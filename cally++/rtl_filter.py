#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""RTL 过滤器

过滤 GCC RTL expand 文件，只保留函数定义和调用关系，
去除冗余的 RTL 指令细节，减小文件大小，提高解析速度
"""

import re
import sys
from pathlib import Path
from typing import List, Optional

# 确保标准输出使用 UTF-8 编码
if sys.stdout.encoding != 'utf-8':
    import codecs
    sys.stdout = codecs.getwriter('utf-8')(sys.stdout.buffer, 'strict')
    sys.stderr = codecs.getwriter('utf-8')(sys.stderr.buffer, 'strict')


class RTLFilter:
    """RTL 文件过滤器"""
    
    def __init__(self, debug: bool = False):
        self.debug = debug
        
        # 函数定义的正则表达式
        # 匹配：;; Function void worker(int) (_Z6workeri, funcdef_no=5, ...)
        self.function_pattern = re.compile(r'^;; Function\s+.*$')
        
        # 调用指令的正则表达式
        # 匹配：(call (mem:DI (symbol_ref:DI ("function_name") ...
        self.call_pattern = re.compile(r'.*\(call\s+.*symbol_ref.*')
        
        # symbol_ref 的正则表达式（更宽松，捕获所有符号引用）
        self.symbol_ref_pattern = re.compile(r'.*symbol_ref.*')
        
        # 需要保留的特殊行
        self.keep_patterns = [
            re.compile(r'^;; Function'),           # 函数定义
            re.compile(r'.*\(call\s+.*'),          # 调用指令
            re.compile(r'.*symbol_ref.*'),         # 符号引用
            re.compile(r'^\s*$'),                   # 空行（保持可读性）
        ]
    
    def filter(
        self,
        input_file: str,
        output_file: Optional[str] = None
    ) -> Optional[str]:
        """
        过滤 RTL 文件
        
        Args:
            input_file: 输入的 .expand 文件
            output_file: 输出文件路径（默认：<input>.filtered）
        
        Returns:
            输出文件路径，失败返回 None
        """
        input_path = Path(input_file)
        
        if not input_path.exists():
            print(f"ERROR: Input file not found: {input_file}")
            return None
        
        # 确定输出文件名
        if output_file:
            output_path = Path(output_file)
        else:
            output_path = input_path.with_suffix(input_path.suffix + '.filtered')
        
        print(f"  正在过滤 RTL 文件...")
        print(f"    输入文件: {input_path.name}")
        print(f"    输出文件: {output_path.name}")
        
        if self.debug:
            print(f"    完整路径: {output_path}")
        
        try:
            # 读取原始文件
            with open(input_path, 'r', encoding='utf-8', errors='ignore') as f:
                lines = f.readlines()
            
            original_size = len(lines)
            
            # 过滤行
            filtered_lines = self._filter_lines(lines)
            
            filtered_size = len(filtered_lines)
            
            # 写入过滤后的文件
            with open(output_path, 'w', encoding='utf-8') as f:
                f.writelines(filtered_lines)
            
            # 计算统计信息
            reduction = (1 - filtered_size / original_size) * 100
            original_size_kb = input_path.stat().st_size / 1024
            filtered_size_kb = output_path.stat().st_size / 1024
            
            print(f"  ✓ 过滤完成！")
            print(f"    文件路径: {output_path}")
            print(f"    文件大小: {filtered_size_kb:.1f} KB")
            print(f"    压缩比例: {reduction:.1f}% (从 {original_size} 行减少到 {filtered_size} 行)")
            
            if self.debug:
                print(f"    原始大小: {original_size_kb:.1f} KB")
                print(f"    大小减少: -{original_size_kb - filtered_size_kb:.1f} KB")
            
            return str(output_path)
        
        except Exception as e:
            print(f"ERROR: Failed to filter RTL file: {e}")
            return None
    
    def _filter_lines(self, lines: List[str]) -> List[str]:
        """
        过滤行，保留有用信息
        
        Args:
            lines: 原始行列表
        
        Returns:
            过滤后的行列表
        """
        filtered = []
        in_function = False
        current_function = None
        
        for line in lines:
            # 检查是否是函数定义
            if self.function_pattern.match(line):
                in_function = True
                current_function = line.strip()
                filtered.append(line)
                if self.debug:
                    print(f"Found function: {current_function[:60]}...")
                continue
            
            # 如果在函数内，检查是否是调用或符号引用
            if in_function:
                # 检查是否包含 call 和 symbol_ref
                if 'call' in line and 'symbol_ref' in line:
                    # 提取关键信息
                    simplified = self._simplify_call_line(line)
                    filtered.append(simplified)
                    if self.debug:
                        # 提取被调用的函数名
                        match = re.search(r'symbol_ref.*?"([^"]+)"', line)
                        if match:
                            callee = match.group(1)
                            print(f"  -> calls: {callee}")
                    continue
                
                # 保留单独的 symbol_ref 行（可能是间接调用）
                if 'symbol_ref' in line and 'call' not in line:
                    simplified = self._simplify_symbol_line(line)
                    filtered.append(simplified)
                    continue
            
            # 保留空行（但限制连续空行）
            if line.strip() == '':
                if filtered and filtered[-1].strip() != '':
                    filtered.append('\n')
        
        return filtered
    
    def _simplify_call_line(self, line: str) -> str:
        """
        简化调用指令行，只保留关键信息
        
        原始：
        (call_insn 25 24 26 3 (call (mem:DI (symbol_ref:DI ("_Z10processDatai") [flags 0x3]))
            (const_int 0 [0])) simple_thread.cpp:15 -1 (nil))
        
        简化后：
        (call (mem:DI (symbol_ref:DI ("_Z10processDatai")))
        """
        # 尝试提取核心部分
        match = re.search(r'\(call\s+\(mem[^)]*\(symbol_ref[^)]*"([^"]+)"[^)]*\)\)', line)
        if match:
            func_name = match.group(1)
            return f'(call (mem:DI (symbol_ref:DI ("{func_name}")))\n'
        
        # 如果匹配失败，保留包含 call 和 symbol_ref 的部分
        if 'call' in line and 'symbol_ref' in line:
            # 保留原行（已经足够简洁）
            return line
        
        return line
    
    def _simplify_symbol_line(self, line: str) -> str:
        """
        简化符号引用行
        
        原始：
        (insn 30 29 31 4 (set (reg:DI 90)
            (symbol_ref:DI ("pthread_mutex_lock") [flags 0x41]))
        
        简化后：
        (symbol_ref:DI ("pthread_mutex_lock"))
        """
        match = re.search(r'\(symbol_ref[^)]*"([^"]+)"[^)]*\)', line)
        if match:
            func_name = match.group(1)
            return f'(symbol_ref:DI ("{func_name}"))\n'
        
        return line


def filter_rtl(
    input_file: str,
    output_file: Optional[str] = None,
    debug: bool = False
) -> Optional[str]:
    """
    便捷函数：过滤 RTL 文件
    
    Args:
        input_file: 输入 .expand 文件
        output_file: 输出文件（默认：<input>.filtered）
        debug: 调试模式
    
    Returns:
        输出文件路径
    """
    filter_obj = RTLFilter(debug=debug)
    return filter_obj.filter(input_file, output_file)


if __name__ == "__main__":
    import argparse
    
    parser = argparse.ArgumentParser(
        description="Filter RTL expand file to extract function calls only"
    )
    parser.add_argument("input", help="Input .expand file")
    parser.add_argument("--output", help="Output file (default: <input>.filtered)")
    parser.add_argument("--debug", action="store_true", help="Debug mode")
    
    args = parser.parse_args()
    
    output = filter_rtl(args.input, args.output, args.debug)
    
    if output:
        print(f"SUCCESS: {output}")
    else:
        print("FAILED")
        exit(1)
