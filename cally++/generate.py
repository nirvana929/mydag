#!/usr/bin/env python3
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
from rtl_filter import filter_rtl


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
        
        # 过滤 RTL 文件（除非用户要求保留原始）
        if not args.keep_raw_rtl:
            print(f"\n=== Step 2: Filtering RTL ===")
            filtered_file = filter_rtl(expand_file, debug=args.debug)
            
            if not filtered_file:
                print("WARNING: RTL filtering failed, using raw RTL")
                filtered_path = expand_path
            else:
                filtered_path = Path(filtered_file)
                print(f"Filtered: {filtered_path}")
        else:
            print(f"\n=== Step 2: Skipping RTL filtering (--keep-raw-rtl) ===")
            filtered_path = expand_path
        
        # 记录源文件路径（用于 simplify 推断）
        source_file = Path(args.source)
    
    else:
        # 使用已有的 expand 文件
        expand_path = Path(args.expand)
        if not expand_path.exists():
            print(f"ERROR: File not found: {expand_path}")
            return 1
        
        filtered_path = expand_path
        source_file = Path(args.source_hint) if args.source_hint else _guess_source_from_expand(expand_path)
        print(f"Using existing RTL file: {expand_path}")
    
    # 解析 RTL
    print(f"\n=== Step 3: Parsing RTL with demangle ===")
    rtl_parser = RTLParser(enable_demangle=True, debug=args.debug)
    graph = rtl_parser.parse_file(str(filtered_path))
    print(f"Parsed {len(graph.functions)} functions")
    
    # 生成调用图
    print(f"\n=== Step 4: Generating callgraph ===")
    generator = DOTGenerator(graph)
    
    if args.full:
        # 生成完整调用图
        dot_content = generator.generate_full_graph()
        graph_type = "full"
    elif args.caller:
        # 生成 caller 图
        func_name = args.caller
        if func_name not in graph.functions and rtl_parser.demangler:
            demangled = rtl_parser.demangler.demangle(func_name)
            if demangled in graph.functions:
                func_name = demangled
        
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
    print(f"\n=== Step 5: Saving DOT file ===")
    out_root = Path(args.output_base)
    cfg_dir = out_root / "配置文件" / base
    img_dir = out_root / "img"
    cfg_dir.mkdir(parents=True, exist_ok=True)
    img_dir.mkdir(parents=True, exist_ok=True)
    
    dot_path = cfg_dir / f"{base}.dot"
    dot_path.write_text(dot_content, encoding='utf-8')
    print(f"DOT saved: {dot_path}")
    
    # 简化 C++ 调用图（如果启用）
    if args.simplify_cxx:
        print(f"\n=== Step 6: Simplifying C++ callgraph ===")
        simplifier = DotSimplifier(debug=args.debug)
        
        # 确定源文件（用于线程函数推断）
        if args.source:
            source_for_inference = Path(args.source)
        elif args.source_hint:
            source_for_inference = Path(args.source_hint)
        else:
            source_for_inference = source_file if source_file and source_file.exists() else None
        
        if args.debug and source_for_inference:
            print(f"  Using source for inference: {source_for_inference}")
        
        simplified = simplifier.simplify(dot_content, source_for_inference)
        
        simple_dot_path = cfg_dir / f"{base}_simple.dot"
        simple_dot_path.write_text(simplified, encoding='utf-8')
        print(f"Simplified DOT saved: {simple_dot_path}")
        
        # 生成简化版的 PNG
        print(f"\n=== Step 7: Rendering simplified PNG ===")
        simple_png_path = img_dir / f"{base}_{graph_type}_simple.png"
        subprocess.run(['dot', '-Tpng', str(simple_dot_path), '-o', str(simple_png_path)])
        print(f"Simplified PNG saved: {simple_png_path}")
    
    # 生成原始 PNG
    print(f"\n=== Step {7 if args.simplify_cxx else 6}: Rendering PNG ===")
    png_path = img_dir / f"{base}_{graph_type}.png"
    subprocess.run(['dot', '-Tpng', str(dot_path), '-o', str(png_path)])
    print(f"PNG saved: {png_path}")
    
    print("\n=== Done! ===")
    return 0

if __name__ == "__main__":
    sys.exit(main())
