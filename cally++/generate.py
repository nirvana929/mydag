#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Cally++ 主程序"""
import argparse
import subprocess
import sys
from pathlib import Path
from typing import Optional
from rtl_parser import RTLParser
from dot_generator import DOTGenerator
from simplify_dot import DotSimplifier
from rtl_generator import generate_rtl_from_source
from rtl_demangler import demangle_rtl
from rtl_filter import filter_rtl

# 确保标准输出使用 UTF-8 编码
if sys.stdout.encoding != 'utf-8':
    import codecs
    sys.stdout = codecs.getwriter('utf-8')(sys.stdout.buffer, 'strict')
    sys.stderr = codecs.getwriter('utf-8')(sys.stderr.buffer, 'strict')


def _guess_source_from_expand(expand_path: Path) -> Optional[Path]:
    name = expand_path.name
    parent = expand_path.parent

    # 常见形态：foo.cpp.233r.expand → foo.cpp
    if name.endswith('.233r.expand'):
        candidate = parent / name.replace('.233r.expand', '.cpp')
        if candidate.exists():
            return candidate

    if name.endswith('.expand'):
        candidate = parent / name[:-len('.expand')]
        if candidate.exists():
            return candidate

    # 退化：尝试常见后缀
    base = expand_path.stem  # 去掉最后一个后缀 .expand
    for ext in ('.cpp', '.cc', '.cxx', '.c'):
        candidate = parent / f"{base}{ext}"
        if candidate.exists():
            return candidate

    return None


def _detect_expand_type(expand_path: Path) -> str:
    """
    检测 expand 文件的类型
    
    Returns:
        'raw': 原始 expand 文件 (produce5.cpp.233r.expand)
        'demangled': 去改编后的 expand 文件 (produce5.cpp.233r.demangled.expand)
        'filtered': 过滤后的 expand 文件 (produce5.cpp.233r.filtered.expand)
    """
    name = expand_path.name
    
    if '.filtered.expand' in name:
        return 'filtered'
    elif '.demangled.expand' in name:
        return 'demangled'
    elif name.endswith('.expand'):
        return 'raw'
    else:
        # 默认当作原始文件处理
        return 'raw'


_INTERMEDIATE_SUFFIXES = (".demangled.filtered", ".demangled", ".filtered")


def _strip_intermediate_suffixes(path: Path) -> Path:
    """移除 .demangled/.filtered 等后缀，得到基础文件名"""
    name = path.name
    while True:
        matched = False
        for suffix in _INTERMEDIATE_SUFFIXES:
            if name.endswith(suffix):
                name = name[:-len(suffix)]
                matched = True
                break
        if not matched:
            break
    return path.with_name(name)


def _canonical_intermediate_path(path: Path, stage: str) -> Path:
    """根据原始 expand 文件生成固定的中间产物路径"""
    base = _strip_intermediate_suffixes(path)
    if stage == "demangled":
        # produce5.cpp.233r.expand → produce5.cpp.233r.demangled.expand
        return Path(str(base).replace('.expand', '.demangled.expand'))
    if stage == "filtered":
        # produce5.cpp.233r.expand → produce5.cpp.233r.filtered.expand
        return Path(str(base).replace('.expand', '.filtered.expand'))
    raise ValueError(f"Unknown stage: {stage}")


def _relative_subdir_under_source(file_path: Path) -> Optional[Path]:
    """
    根据文件路径推断其在 source/ 目录下的子目录结构。
    例如 source/produce5_cpp/produce5.cpp -> produce5_cpp。
    """
    for parent in file_path.parents:
        if parent.name == "source":
            try:
                rel = file_path.parent.relative_to(parent)
                return None if rel == Path(".") else rel
            except ValueError:
                continue
    return None

def main():
    parser = argparse.ArgumentParser(
        description="Cally++ - C++ Callgraph Generator",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # 从源文件一键生成（推荐）
  python3 generate.py --source file.cpp --caller main --simplify-cxx
  
  # 从已有 expand 文件生成
  python3 generate.py --expand file.cpp.233r.expand --caller main
  
  # 自定义编译选项
  python3 generate.py --source file.cpp --caller main --compile-flags "-std=c++17 -I./include"
  
  # 保留原始 RTL（不过滤）
  python3 generate.py --source file.cpp --caller main --keep-raw-rtl
        """
    )
    
    # 输入选项（二选一）
    input_group = parser.add_mutually_exclusive_group(required=True)
    input_group.add_argument("--source", help="C++ source file (.cpp, .c, .cc) - auto generate RTL")
    input_group.add_argument("--expand", help="Existing RTL expand file")
    
    # 图类型选项
    parser.add_argument("--caller", help="Root function for caller graph")
    parser.add_argument("--full", action="store_true", help="Generate full callgraph (all functions)")
    
    # RTL 生成选项
    parser.add_argument("--compile-flags", default="-O0", help="GCC compile flags (default: -O0)")
    parser.add_argument("--keep-raw-rtl", action="store_true", help="Keep raw RTL without filtering")
    parser.add_argument("--skip-rewrite", action="store_true", help="Skip RTL rewrite/demangle stage")
    
    # 输出选项
    parser.add_argument("--output-base", default=".", help="Output directory (default: current dir)")
    parser.add_argument("--simplify-cxx", action="store_true", help="Simplify C++ callgraph (hide STL internals)")
    parser.add_argument("--source-hint", help="Source file for thread function inference (auto-detected if omitted)")
    parser.add_argument("--debug", action="store_true", help="Debug mode")
    
    args = parser.parse_args()
    
    # 处理输入：从源文件生成 RTL 或使用已有 expand
    if args.source:
        # 从源文件生成 RTL
        print(f"=== Step 1: Generating RTL from source ===")
        print(f"Source file: {args.source}")
        
        expand_file = generate_rtl_from_source(
            args.source,
            compile_flags=args.compile_flags,
            debug=args.debug
        )
        
        if not expand_file:
            print("ERROR: Failed to generate RTL file")
            return 1
        
        expand_path = Path(expand_file)
        print(f"Generated: {expand_path}")
        source_file = Path(args.source)
    
    else:
        # 使用已有的 expand 文件
        expand_path = Path(args.expand)
        if not expand_path.exists():
            print(f"ERROR: File not found: {expand_path}")
            return 1
        
        source_file = Path(args.source_hint) if args.source_hint else _guess_source_from_expand(expand_path)
        
        # 检测 expand 文件类型
        expand_type = _detect_expand_type(expand_path)
        
        print(f"\n{'='*70}")
        print(f"使用已有 RTL 文件")
        print(f"{'='*70}")
        print(f"  文件路径: {expand_path}")
        expand_size_kb = expand_path.stat().st_size / 1024
        print(f"  文件大小: {expand_size_kb:.1f} KB")
        
        if expand_type == 'filtered':
            print(f"  文件类型: 已过滤的 expand 文件")
            print(f"  ✓ 将直接使用此文件生成调用图（跳过去改编和过滤步骤）")
        elif expand_type == 'demangled':
            print(f"  文件类型: 已去改编的 expand 文件")
            print(f"  ✓ 将跳过去改编步骤，仅执行过滤")
        else:
            print(f"  文件类型: 原始 expand 文件")
            print(f"  ✓ 将执行完整流程（去改编 → 过滤 → 生成图）")
    
    # 根据文件类型决定处理流程
    if args.source:
        # 从源文件生成，需要完整流程
        expand_type = 'raw'
        current_file = expand_path
    else:
        # 使用已有文件，根据检测结果决定
        current_file = expand_path
    
    # Step 2: 去改编 RTL 文件（如果需要）
    if expand_type == 'raw' and not args.skip_rewrite:
        print(f"\n{'='*70}")
        print(f"步骤 2/5: 去改编 RTL 文件")
        print(f"{'='*70}")
        demangled_file = demangle_rtl(str(current_file), debug=args.debug)
        
        if not demangled_file:
            print("  ⚠ 警告: RTL 去改编失败，使用原始 RTL")
            demangled_path = current_file
        else:
            demangled_path = Path(demangled_file)
            print(f"  ✓ 去改编完成: {demangled_path.name}")
            current_file = demangled_path
    elif expand_type == 'demangled':
        print(f"\n{'='*70}")
        print(f"步骤 2/5: 跳过去改编（文件已去改编）")
        print(f"{'='*70}")
        demangled_path = current_file
    elif expand_type == 'filtered':
        print(f"\n{'='*70}")
        print(f"步骤 2/5: 跳过去改编（文件已过滤）")
        print(f"{'='*70}")
        demangled_path = current_file
    else:
        print(f"\n{'='*70}")
        print(f"步骤 2/5: 跳过去改编 (--skip-rewrite)")
        print(f"{'='*70}")
        demangled_path = current_file
    
    # Step 3: 过滤 RTL 文件（如果需要）
    if expand_type != 'filtered' and not args.keep_raw_rtl:
        print(f"\n{'='*70}")
        print(f"步骤 3/5: 过滤 RTL 文件")
        print(f"{'='*70}")
        filtered_file = filter_rtl(str(current_file), debug=args.debug)
        
        if not filtered_file:
            print("  ⚠ 警告: RTL 过滤失败，使用当前 RTL")
            filtered_path = current_file
        else:
            filtered_path = Path(filtered_file)
            print(f"  ✓ 过滤完成: {filtered_path.name}")
    elif expand_type == 'filtered':
        print(f"\n{'='*70}")
        print(f"步骤 3/5: 跳过过滤（文件已过滤）")
        print(f"{'='*70}")
        filtered_path = current_file
    else:
        print(f"\n{'='*70}")
        print(f"步骤 3/5: 跳过过滤 (--keep-raw-rtl)")
        print(f"{'='*70}")
        filtered_path = current_file
    
    # Step 4: 解析过滤后的 RTL（不再需要去改编，因为已经是可读符号）
    print(f"\n{'='*70}")
    print(f"步骤 4/5: 解析过滤后的 RTL 文件")
    print(f"{'='*70}")
    print(f"  正在解析 RTL 文件...")
    rtl_parser = RTLParser(enable_demangle=False, debug=args.debug)  # 关闭去改编
    graph = rtl_parser.parse_file(str(filtered_path))
    print(f"  ✓ 解析完成！")
    print(f"    发现函数: {len(graph.functions)} 个")
    
    # Step 5: 生成调用图
    print(f"\n{'='*70}")
    print(f"步骤 5/5: 生成调用图")
    print(f"{'='*70}")
    generator = DOTGenerator(graph)
    
    if args.full:
        # 生成完整调用图
        dot_content = generator.generate_full_graph()
        graph_type = "full"
    elif args.caller:
        # 生成 caller 图（函数名已经是可读形式，不需要去改编）
        func_name = args.caller
        
        if func_name not in graph.functions:
            print(f"ERROR: Function '{args.caller}' not found")
            print("Available functions:")
            for name in list(graph.functions.keys())[:5]:
                print(f"  - {name}")
            return 1
        
        dot_content = generator.generate_caller_graph(func_name)
        graph_type = "caller"
    else:
        print("ERROR: --caller or --full required")
        return 1
    
    # 确定输出文件的基础名称与对应的 source 子目录
    if args.source:
        # 从源文件名提取
        source_path = Path(args.source)
        base = source_path.stem
        project_subdir = _relative_subdir_under_source(source_path)
    else:
        # 从 expand 文件名提取
        base = expand_path.stem
        if base.endswith('.233r'):
            base = base[:-5]
        project_subdir = _relative_subdir_under_source(expand_path)
    
    # 保存 DOT 文件
    print(f"\n  正在保存 DOT 文件...")
    out_root = Path(args.output_base)
    cfg_dir = out_root / "config"
    img_dir = out_root / "img"
    if project_subdir:
        cfg_dir = cfg_dir / project_subdir
        img_dir = img_dir / project_subdir
    cfg_dir.mkdir(parents=True, exist_ok=True)
    img_dir.mkdir(parents=True, exist_ok=True)
    
    dot_path = cfg_dir / f"{base}.dot"
    dot_path.write_text(dot_content, encoding='utf-8')
    print(f"  ✓ DOT 文件已保存")
    print(f"    文件路径: {dot_path}")
    
    # 简化 C++ 调用图（如果启用）
    if args.simplify_cxx:
        print(f"\n{'='*70}")
        print(f"步骤 6/7: 简化 C++ 调用图")
        print(f"{'='*70}")
        simplifier = DotSimplifier(debug=args.debug)
        
        # 确定源文件（用于线程函数推断）
        if args.source:
            source_for_inference = Path(args.source)
        elif args.source_hint:
            source_for_inference = Path(args.source_hint)
        else:
            source_for_inference = source_file if source_file and source_file.exists() else None
        
        if args.debug and source_for_inference:
            print(f"  使用源文件进行推断: {source_for_inference}")
        
        print(f"  正在简化调用图...")
        simplified = simplifier.simplify(dot_content, source_for_inference)
        
        simple_dot_path = cfg_dir / f"{base}_simple.dot"
        simple_dot_path.write_text(simplified, encoding='utf-8')
        print(f"  ✓ 简化完成")
        print(f"    文件路径: {simple_dot_path}")
        
        # 生成简化版的 PNG
        print(f"\n{'='*70}")
        print(f"步骤 7/7: 渲染简化后的 PNG 图片")
        print(f"{'='*70}")
        simple_png_path = img_dir / f"{base}_{graph_type}_simple.png"
        print(f"  正在渲染...")
        subprocess.run(['dot', '-Tpng', str(simple_dot_path), '-o', str(simple_png_path)])
        simple_png_size_kb = simple_png_path.stat().st_size / 1024
        print(f"  ✓ PNG 图片已保存")
        print(f"    文件路径: {simple_png_path}")
        print(f"    文件大小: {simple_png_size_kb:.1f} KB")
    
    # 生成原始 PNG
    step_num = 7 if args.simplify_cxx else 6
    print(f"\n{'='*70}")
    print(f"步骤 {step_num}/{step_num}: 渲染原始 PNG 图片")
    print(f"{'='*70}")
    png_path = img_dir / f"{base}_{graph_type}.png"
    print(f"  正在渲染...")
    subprocess.run(['dot', '-Tpng', str(dot_path), '-o', str(png_path)])
    png_size_kb = png_path.stat().st_size / 1024
    print(f"  ✓ PNG 图片已保存")
    print(f"    文件路径: {png_path}")
    print(f"    文件大小: {png_size_kb:.1f} KB")
    
    print(f"\n{'='*70}")
    print(f"✓ 所有步骤完成！")
    print(f"{'='*70}")
    
    # 汇总生成的文件
    print(f"\n生成的文件列表:")
    if args.source:
        print(f"  1. RTL 文件生成成功: {expand_path}")
    else:
        print(f"  1. 使用的 RTL 文件: {expand_path}")
    
    if expand_type == 'raw' and not args.skip_rewrite:
        print(f"  2. 去改编 RTL 文件已保存: {demangled_path}")
    
    if expand_type != 'filtered' and not args.keep_raw_rtl:
        print(f"  3. 过滤后 RTL 文件已保存: {filtered_path}")
    
    print(f"  4. DOT 文件已保存: {dot_path}")
    print(f"  5. PNG 图片已保存: {png_path}")
    
    if args.simplify_cxx:
        print(f"  6. 简化 DOT 文件已保存: {simple_dot_path}")
        print(f"  7. 简化 PNG 图片已保存: {simple_png_path}")
    
    print(f"\n可以查看图: {png_path}")
    return 0

if __name__ == "__main__":
    sys.exit(main())
