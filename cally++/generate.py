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
        print(f"\n=== 使用已有 RTL 文件 ===")
        print(f"  文件路径: {expand_path}")
        expand_size_kb = expand_path.stat().st_size / 1024
        print(f"  文件大小: {expand_size_kb:.1f} KB")
    
    # Step 2: 去改编 RTL 文件
    print(f"\n{'='*70}")
    print(f"步骤 2/5: 去改编 RTL 文件")
    print(f"{'='*70}")
    demangled_file = demangle_rtl(str(expand_path), debug=args.debug)
    
    if not demangled_file:
        print("  ⚠ 警告: RTL 去改编失败，使用原始 RTL")
        demangled_path = expand_path
    else:
        demangled_path = Path(demangled_file)
    
    # Step 3: 过滤去改编后的 RTL 文件
    if not args.keep_raw_rtl:
        print(f"\n{'='*70}")
        print(f"步骤 3/5: 过滤去改编后的 RTL 文件")
        print(f"{'='*70}")
        filtered_file = filter_rtl(str(demangled_path), debug=args.debug)
        
        if not filtered_file:
            print("  ⚠ 警告: RTL 过滤失败，使用去改编的 RTL")
            filtered_path = demangled_path
        else:
            filtered_path = Path(filtered_file)
    else:
        print(f"\n{'='*70}")
        print(f"步骤 3/5: 跳过 RTL 过滤 (--keep-raw-rtl)")
        print(f"{'='*70}")
        filtered_path = demangled_path
    
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
    
    # 确定输出文件的基础名称
    if args.source:
        # 从源文件名提取
        base = Path(args.source).stem
    else:
        # 从 expand 文件名提取
        base = expand_path.stem
        if base.endswith('.233r'):
            base = base[:-5]
    
    # 保存 DOT 文件
    print(f"\n  正在保存 DOT 文件...")
    out_root = Path(args.output_base)
    cfg_dir = out_root / "config" / base
    img_dir = out_root / "img"
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
    print(f"  1. RTL 文件生成成功: {expand_path}")
    if demangled_file:
        print(f"  2. 去改编 RTL 文件已保存: {demangled_path}")
    if not args.keep_raw_rtl and filtered_file:
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
