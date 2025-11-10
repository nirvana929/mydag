#!/usr/bin/env python3
"""CallyPy Static - Python 静态线程调用图生成器"""

import argparse
import subprocess
import sys
from pathlib import Path
from ast_parser import ASTParser
from dot_generator import DOTGenerator
from simplify import PythonSimplifier


def main():
    parser = argparse.ArgumentParser(
        description="CallyPy Static - Python Thread Callgraph Generator (Static Analysis)",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # 生成完整调用图
  python3 generate_static.py --source example.py --full
  
  # 从 main 函数开始的调用图
  python3 generate_static.py --source example.py --caller main
  
  # 简化图（隐藏内建函数）
  python3 generate_static.py --source example.py --full --simplify
  
  # 仅显示线程相关
  python3 generate_static.py --source example.py --thread-only
        """
    )
    
    parser.add_argument("--source", required=True, help="Python 源文件")
    parser.add_argument("--caller", help="从指定函数开始的 caller 图")
    parser.add_argument("--full", action="store_true", help="生成完整调用图")
    parser.add_argument("--thread-only", action="store_true", help="仅显示线程相关函数")
    parser.add_argument("--simplify", action="store_true", help="简化图（隐藏内建函数）")
    parser.add_argument("--output-base", default=".", help="输出目录（默认：当前目录）")
    parser.add_argument("--debug", action="store_true", help="调试模式")
    
    args = parser.parse_args()
    
    # 检查输入文件
    source_path = Path(args.source)
    if not source_path.exists():
        print(f"ERROR: File not found: {source_path}")
        return 1
    
    # 解析 Python 代码
    print(f"Parsing Python file: {source_path}")
    ast_parser = ASTParser(debug=args.debug)
    
    try:
        graph = ast_parser.parse_file(str(source_path))
    except Exception as e:
        print(f"ERROR: Failed to parse: {e}")
        if args.debug:
            import traceback
            traceback.print_exc()
        return 1
    
    print(f"Parsed {len(graph.functions)} functions")
    print(f"Found {len(graph.thread_creations)} thread creations")
    print(f"Found {len(graph.sync_primitives)} sync primitive calls")
    
    # 生成 DOT
    generator = DOTGenerator(graph, debug=args.debug)
    
    if args.thread_only:
        # 仅线程相关
        dot_content = generator.generate_thread_only_graph()
        graph_type = "thread_only"
    elif args.full:
        # 完整图
        dot_content = generator.generate_full_graph()
        graph_type = "full"
    elif args.caller:
        # Caller 图
        try:
            dot_content = generator.generate_caller_graph(args.caller)
            graph_type = "caller"
        except ValueError as e:
            print(f"ERROR: {e}")
            print("\nAvailable functions:")
            for i, func in enumerate(sorted(graph.functions.keys())[:10]):
                print(f"  - {func}")
            if len(graph.functions) > 10:
                print(f"  ... and {len(graph.functions) - 10} more")
            return 1
    else:
        print("ERROR: Must specify --full, --caller, or --thread-only")
        return 1
    
    # 准备输出路径（符合目录结构规范）
    # 提取项目名（源文件的 stem）
    base = source_path.stem
    out_root = Path(args.output_base)
    
    # 配置文件目录：config/<project_name>/
    config_dir = out_root / "config" / base
    # 图片目录：img/<project_name>/
    img_dir = out_root / "img" / base
    
    config_dir.mkdir(parents=True, exist_ok=True)
    img_dir.mkdir(parents=True, exist_ok=True)
    
    # 保存原始 DOT
    dot_path = config_dir / f"{base}.dot"
    dot_path.write_text(dot_content, encoding='utf-8')
    print(f"DOT saved: {dot_path}")
    
    # 简化（如果启用）
    if args.simplify:
        print("Simplifying callgraph...")
        simplifier = PythonSimplifier(debug=args.debug)
        simplified_dot = simplifier.simplify(dot_content)
        
        simple_dot_path = config_dir / f"{base}_simple.dot"
        simple_dot_path.write_text(simplified_dot, encoding='utf-8')
        print(f"Simplified DOT saved: {simple_dot_path}")
        
        # 生成简化版 PNG
        simple_png_path = img_dir / f"{base}_{graph_type}_simple.png"
        try:
            subprocess.run(['dot', '-Tpng', str(simple_dot_path), '-o', str(simple_png_path)], check=True)
            print(f"Simplified PNG saved: {simple_png_path}")
        except subprocess.CalledProcessError as e:
            print(f"WARNING: Failed to generate PNG: {e}")
        except FileNotFoundError:
            print("WARNING: Graphviz 'dot' command not found. Please install Graphviz.")
    
    # 生成原始 PNG
    png_path = img_dir / f"{base}_{graph_type}.png"
    try:
        subprocess.run(['dot', '-Tpng', str(dot_path), '-o', str(png_path)], check=True)
        print(f"PNG saved: {png_path}")
    except subprocess.CalledProcessError as e:
        print(f"WARNING: Failed to generate PNG: {e}")
    except FileNotFoundError:
        print("WARNING: Graphviz 'dot' command not found. Please install Graphviz.")
    
    print("Done!")
    return 0


if __name__ == "__main__":
    sys.exit(main())
