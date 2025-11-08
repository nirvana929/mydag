#!/usr/bin/env python3
"""C++ 符号去改编工具模块

在 RTL 阶段对混淆的 C++ 符号进行去改编处理，
使得生成的调用图直接包含可读的函数名。

这是 cally++ 项目的独立实现，不依赖 mycallyplus。
"""

import subprocess
import re
import os
import tempfile
from pathlib import Path
from typing import Optional, List, Dict


class Demangler:
    """C++ 符号去改编器"""
    
    def __init__(self, tool: str = 'auto'):
        """初始化去改编器
        
        Args:
            tool: 使用的工具，可选 'c++filt', 'llvm-cxxfilt', 或 'auto'
        """
        self.tool = self._detect_tool(tool)
    
    def _detect_tool(self, preference: str) -> Optional[str]:
        """检测可用的去改编工具
        
        Args:
            preference: 优先使用的工具
            
        Returns:
            可用工具的路径，如果都不可用则返回 None
        """
        if preference == 'auto':
            tools = ['c++filt', 'llvm-cxxfilt']
        else:
            tools = [preference]
        
        for tool in tools:
            try:
                subprocess.run(
                    [tool, '--version'],
                    capture_output=True,
                    timeout=1
                )
                return tool
            except (FileNotFoundError, subprocess.TimeoutExpired):
                continue
        
        return None
    
    def demangle(self, symbol: str) -> str:
        """对单个符号进行去改编
        
        Args:
            symbol: 混淆的 C++ 符号
            
        Returns:
            去改编后的符号，如果失败则返回原符号
        """
        # 如果不是 C++ 混淆符号，直接返回
        if not symbol.startswith('_Z'):
            return symbol
        
        # 如果没有可用工具，返回原符号
        if self.tool is None:
            return symbol
        
        try:
            result = subprocess.run(
                [self.tool, symbol],
                capture_output=True,
                text=True,
                timeout=1
            )
            
            if result.returncode == 0:
                demangled = result.stdout.strip()
                # 确保去改编成功（不等于原符号）
                if demangled and demangled != symbol:
                    return demangled
        except (subprocess.TimeoutExpired, Exception):
            pass
        
        return symbol
    
    def demangle_batch(self, symbols: List[str]) -> Dict[str, str]:
        """批量去改编符号
        
        Args:
            symbols: 符号列表
            
        Returns:
            字典，键为原符号，值为去改编后的符号
        """
        result = {}
        for symbol in symbols:
            result[symbol] = self.demangle(symbol)
        return result


def preprocess_rtl_with_demangle(rtl_content: str, demangler: Demangler) -> tuple:
    """预处理 RTL 内容，替换混淆符号为可读名称
    
    Args:
        rtl_content: RTL 文件内容
        demangler: 去改编器实例
        
    Returns:
        (处理后的 RTL 内容, 替换的符号数量)
    """
    lines = rtl_content.split('\n')
    
    # 用于存储所有需要去改编的符号
    symbols_to_demangle = set()
    
    # 第一遍：收集所有混淆符号
    for line in lines:
        # 1. call 指令中的符号：(call.*"symbol"
        call_matches = re.finditer(r'\(call[^"]*"([^"]+)"', line)
        for match in call_matches:
            symbol = match.group(1)
            if symbol.startswith('_Z'):
                symbols_to_demangle.add(symbol)
        
        # 2. symbol_ref 中的符号：(symbol_ref.*"symbol"
        ref_matches = re.finditer(r'\(symbol_ref[^"]*"([^"]+)"', line)
        for match in ref_matches:
            symbol = match.group(1)
            if symbol.startswith('_Z'):
                symbols_to_demangle.add(symbol)
        
        # 3. 函数头中的符号：;; Function name (_Zxxxxx,
        func_match = re.match(r'^;; Function .* \((_Z\w+),', line)
        if func_match:
            symbols_to_demangle.add(func_match.group(1))
    
    # 批量去改编
    symbol_map = demangler.demangle_batch(list(symbols_to_demangle))
    
    # 统计成功替换的符号数
    successful_replacements = sum(1 for orig, dem in symbol_map.items() if orig != dem)
    
    # 第二遍：替换符号
    processed_lines = []
    for line in lines:
        modified_line = line
        
        # 替换所有匹配的符号
        for mangled, demangled in symbol_map.items():
            if mangled != demangled:  # 只替换成功去改编的
                # 使用精确匹配，避免部分替换
                modified_line = modified_line.replace(f'"{mangled}"', f'"{demangled}"')
                # 也替换函数头中的符号
                modified_line = re.sub(
                    r'\(' + re.escape(mangled) + r',',
                    f'({demangled},',
                    modified_line
                )
        
        processed_lines.append(modified_line)
    
    return '\n'.join(processed_lines), successful_replacements


def demangle_rtl_file(input_path: str, output_path: str, demangler: Optional[Demangler] = None) -> int:
    """处理 RTL 文件并输出去改编版本
    
    Args:
        input_path: 输入 RTL 文件路径
        output_path: 输出文件路径
        demangler: 去改编器实例，如果为 None 则创建新实例
        
    Returns:
        替换的符号数量
    """
    if demangler is None:
        demangler = Demangler()
    
    # 读取 RTL 文件
    with open(input_path, 'r', encoding='utf-8', errors='ignore') as f:
        content = f.read()
    
    # 处理内容
    processed, changes = preprocess_rtl_with_demangle(content, demangler)
    
    # 写入输出文件
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(processed)
    
    return changes


def demangle_rtl_files_inplace(rtl_files: List[str], verbose: bool = True) -> Dict[str, int]:
    """对 RTL 文件列表进行原地去改编处理
    
    创建去改编后的临时文件，返回临时文件路径映射
    
    Args:
        rtl_files: RTL 文件路径列表
        verbose: 是否打印详细信息
        
    Returns:
        字典，键为原文件路径，值为(临时文件路径, 替换数量)的元组
    """
    demangler = Demangler()
    
    if demangler.tool is None:
        if verbose:
            print("WARNING: No C++ demangler tool found (c++filt or llvm-cxxfilt)")
        return {}
    
    result = {}
    
    for rtl_file in rtl_files:
        # 创建临时文件
        fd, temp_path = tempfile.mkstemp(suffix='.expand', prefix='demangled_')
        os.close(fd)
        
        # 执行去改编
        changes = demangle_rtl_file(rtl_file, temp_path, demangler)
        
        if verbose and changes > 0:
            print(f"INFO: Demangled {changes} C++ symbols in {os.path.basename(rtl_file)}")
        
        result[rtl_file] = (temp_path, changes)
    
    return result


if __name__ == '__main__':
    import sys
    
    if len(sys.argv) < 2:
        print("Usage: python demangle.py <rtl_file> [output_file]")
        print("  If output_file is not specified, creates a .demangled.expand file")
        sys.exit(1)
    
    input_file = sys.argv[1]
    output_file = sys.argv[2] if len(sys.argv) > 2 else input_file.replace('.expand', '.demangled.expand')
    
    demangler = Demangler()
    if demangler.tool is None:
        print("ERROR: No C++ demangler tool found (c++filt or llvm-cxxfilt)")
        sys.exit(1)
    
    print(f"Using demangler: {demangler.tool}")
    print(f"Processing: {input_file}")
    
    changes = demangle_rtl_file(input_file, output_file, demangler)
    
    print(f"Demangled {changes} symbols")
    print(f"Output saved to: {output_file}")
