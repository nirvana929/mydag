#!/usr/bin/env python3
"""Cally++ 主程序"""
import argparse
import subprocess
import sys
from pathlib import Path
from rtl_parser import RTLParser
from dot_generator import DOTGenerator

def main():
    parser = argparse.ArgumentParser(description="Cally++ - C++ Callgraph Generator")
    parser.add_argument("--expand", required=True, help="RTL expand file")
    parser.add_argument("--caller", help="Root function for caller graph")
    parser.add_argument("--output-base", default=".", help="Output directory (default: current dir)")
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
    
    if not args.caller:
        print("ERROR: --caller required")
        return 1
    
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
    
    generator = DOTGenerator(graph)
    dot_content = generator.generate_caller_graph(func_name)
    
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
    
    png_path = img_dir / f"{base}_caller.png"
    subprocess.run(['dot', '-Tpng', str(dot_path), '-o', str(png_path)])
    print(f"PNG saved: {png_path}")
    print("Done!")
    return 0

if __name__ == "__main__":
    sys.exit(main())
