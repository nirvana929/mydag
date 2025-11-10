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
    parser = argparse.ArgumentParser(description="Cally++ - C++ Callgraph Generator")
    parser.add_argument("--expand", required=True, help="RTL expand file")
    parser.add_argument("--caller", help="Root function for caller graph")
    parser.add_argument("--full", action="store_true", help="Generate full callgraph (all functions)")
    parser.add_argument("--output-base", default=".", help="Output directory (default: current dir)")
    parser.add_argument("--simplify-cxx", action="store_true", help="Simplify C++ callgraph (hide STL internals)")
    parser.add_argument("--source", help="Source file for thread function inference (optional; auto-detected when omitted)")
    parser.add_argument("--debug", action="store_true", help="Debug mode")
    args = parser.parse_args()
    
    expand_path = Path(args.expand)
    if not expand_path.exists():
        print(f"ERROR: File not found: {expand_path}")
        return 1
    
    print(f"Parsing RTL file with demangle enabled...")
    rtl_parser = RTLParser(enable_demangle=True, debug=args.debug)
    graph = rtl_parser.parse_file(str(expand_path))
    print(f"Parsed {len(graph.functions)} functions")
    
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
    
    base = expand_path.stem
    if base.endswith('.233r'):
        base = base[:-5]
    
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
        print("Simplifying C++ callgraph...")
        simplifier = DotSimplifier(debug=args.debug)
        source_file = Path(args.source) if args.source else _guess_source_from_expand(expand_path)
        if source_file and not source_file.exists():
            source_file = None
        if args.debug and source_file:
            print(f"  using source for inference: {source_file}")
        simplified = simplifier.simplify(dot_content, source_file)
        
        simple_dot_path = cfg_dir / f"{base}_simple.dot"
        simple_dot_path.write_text(simplified, encoding='utf-8')
        print(f"Simplified DOT saved: {simple_dot_path}")
        
        # 生成简化版的 PNG
        simple_png_path = img_dir / f"{base}_{graph_type}_simple.png"
        subprocess.run(['dot', '-Tpng', str(simple_dot_path), '-o', str(simple_png_path)])
        print(f"Simplified PNG saved: {simple_png_path}")
    
    png_path = img_dir / f"{base}_{graph_type}.png"
    subprocess.run(['dot', '-Tpng', str(dot_path), '-o', str(png_path)])
    print(f"PNG saved: {png_path}")
    print("Done!")
    return 0

if __name__ == "__main__":
    sys.exit(main())
