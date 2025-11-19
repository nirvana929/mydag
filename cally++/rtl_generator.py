#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""RTL 生成器

从 C++ 源文件自动生成 GCC RTL expand 文件
"""

import os
import subprocess
import sys
import glob
from pathlib import Path
from typing import Optional

# 确保标准输出使用 UTF-8 编码
if sys.stdout.encoding != 'utf-8':
    import codecs
    sys.stdout = codecs.getwriter('utf-8')(sys.stdout.buffer, 'strict')
    sys.stderr = codecs.getwriter('utf-8')(sys.stderr.buffer, 'strict')


class RTLGenerator:
    """RTL 文件生成器"""
    
    def __init__(self, debug: bool = False):
        self.debug = debug
    
    def generate(
        self,
        source_file: str,
        compile_flags: str = "-O0",
        output_dir: Optional[str] = None
    ) -> Optional[str]:
        """
        从 C++ 源文件生成 RTL expand 文件
        
        Args:
            source_file: C++ 源文件路径 (.cpp, .c, .cc)
            compile_flags: GCC 编译选项（默认 -O0）
            output_dir: 输出目录（默认与源文件同目录）
        
        Returns:
            生成的 .expand 文件路径，失败返回 None
        """
        source_path = Path(source_file)
        
        # 检查源文件是否存在
        if not source_path.exists():
            print(f"ERROR: Source file not found: {source_file}")
            return None
        
        # 检查文件扩展名
        if source_path.suffix not in ['.cpp', '.c', '.cc', '.cxx', '.C']:
            print(f"ERROR: Not a C/C++ source file: {source_file}")
            return None
        
        # 确定输出目录
        if output_dir:
            work_dir = Path(output_dir)
            work_dir.mkdir(parents=True, exist_ok=True)
        else:
            work_dir = source_path.parent
        
        # 生成临时目标文件名
        temp_obj = work_dir / "temp_rtl_gen.o"
        
        # 构造 GCC 命令
        # -fdump-rtl-expand: 生成 RTL expand 阶段的 dump
        # -c: 只编译不链接
        # -o: 指定输出文件（虽然我们只要 .expand，但需要指定 .o）
        cmd = [
            "g++",
            "-fdump-rtl-expand",
            "-c",
            str(source_path.absolute()),
            "-o", str(temp_obj)
        ]
        
        # 添加用户指定的编译选项
        if compile_flags:
            # 将编译选项字符串拆分为列表
            flags = compile_flags.split()
            cmd.extend(flags)
        
        if self.debug:
            print(f"Executing: {' '.join(cmd)}")
            print(f"Working directory: {work_dir}")
        
        # 执行编译
        try:
            result = subprocess.run(
                cmd,
                cwd=str(work_dir),
                capture_output=True,
                text=True,
                timeout=30
            )
            
            if result.returncode != 0:
                print(f"ERROR: GCC compilation failed!")
                print(f"Command: {' '.join(cmd)}")
                print(f"STDERR:\n{result.stderr}")
                return None
            
            if self.debug and result.stderr:
                print(f"GCC warnings:\n{result.stderr}")
        
        except subprocess.TimeoutExpired:
            print("ERROR: GCC compilation timeout (30s)")
            return None
        except FileNotFoundError:
            print("ERROR: g++ not found. Please install GCC/G++")
            print("Ubuntu/Debian: sudo apt install g++")
            return None
        except Exception as e:
            print(f"ERROR: Failed to execute g++: {e}")
            return None
        
        # 查找生成的 .expand 文件
        # GCC 生成的文件名格式：<basename>.cpp.<pass_number>r.expand
        # 例如：simple_thread.cpp.233r.expand
        expand_pattern = str(work_dir / f"{source_path.name}.*.expand")
        expand_files = glob.glob(expand_pattern)
        
        if not expand_files:
            print(f"ERROR: No .expand file generated!")
            print(f"Expected pattern: {expand_pattern}")
            return None
        
        # 如果有多个 expand 文件，选择最新的
        expand_file = max(expand_files, key=os.path.getmtime)
        
        if self.debug:
            print(f"Generated RTL expand file: {expand_file}")
            file_size = os.path.getsize(expand_file)
            print(f"File size: {file_size} bytes ({file_size/1024:.1f} KB)")
        
        # 清理临时目标文件
        if temp_obj.exists():
            temp_obj.unlink()
        
        return expand_file


def generate_rtl_from_source(
    source_file: str,
    compile_flags: str = "-O0",
    output_dir: Optional[str] = None,
    debug: bool = False
) -> Optional[str]:
    """
    便捷函数：从源文件生成 RTL
    
    Args:
        source_file: C++ 源文件路径
        compile_flags: 编译选项
        output_dir: 输出目录
        debug: 调试模式
    
    Returns:
        .expand 文件路径
    """
    generator = RTLGenerator(debug=debug)
    return generator.generate(source_file, compile_flags, output_dir)


if __name__ == "__main__":
    import argparse
    
    parser = argparse.ArgumentParser(description="Generate RTL expand file from C++ source")
    parser.add_argument("source", help="C++ source file")
    parser.add_argument("--compile-flags", default="-O0", help="GCC compile flags")
    parser.add_argument("--output-dir", help="Output directory")
    parser.add_argument("--debug", action="store_true", help="Debug mode")
    
    args = parser.parse_args()
    
    expand_file = generate_rtl_from_source(
        args.source,
        args.compile_flags,
        args.output_dir,
        args.debug
    )
    
    if expand_file:
        print(f"SUCCESS: {expand_file}")
    else:
        print("FAILED")
        exit(1)
