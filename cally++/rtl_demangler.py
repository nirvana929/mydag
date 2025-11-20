#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""RTL 去改编器 - 将 RTL 文件中的 C++ mangled 符号替换为可读符号"""

import re
import subprocess
import sys
from pathlib import Path
from typing import Dict, Optional

# 确保标准输出使用 UTF-8 编码
if sys.stdout.encoding != 'utf-8':
    import codecs
    sys.stdout = codecs.getwriter('utf-8')(sys.stdout.buffer, 'strict')
    sys.stderr = codecs.getwriter('utf-8')(sys.stderr.buffer, 'strict')


class RTLDemangler:
    """RTL 文件去改编器"""
    
    def __init__(self, debug: bool = False):
        self.debug = debug
        self._symbol_cache: Dict[str, str] = {}
        
    def _demangle_symbol(self, symbol: str) -> str:
        """使用 c++filt 去改编单个符号"""
        if symbol in self._symbol_cache:
            return self._symbol_cache[symbol]
        
        # 尝试多个去改编工具
        for tool in ['c++filt', 'llvm-cxxfilt']:
            try:
                result = subprocess.run(
                    [tool, symbol],
                    capture_output=True,
                    text=True,
                    timeout=1
                )
                if result.returncode == 0:
                    demangled = result.stdout.strip()
                    # 如果去改编成功（结果与输入不同）
                    if demangled and demangled != symbol:
                        self._symbol_cache[symbol] = demangled
                        return demangled
            except (subprocess.TimeoutExpired, FileNotFoundError):
                continue
        
        # 去改编失败，返回原符号
        self._symbol_cache[symbol] = symbol
        return symbol
    
    def demangle_file(
        self,
        input_file: str,
        output_file: Optional[str] = None
    ) -> Optional[str]:
        """
        去改编 RTL 文件中的所有 C++ 符号
        
        Args:
            input_file: 输入的 .expand 文件
            output_file: 输出文件路径（默认：<input>.demangled）
        
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
            # 将 .expand 替换为 .demangled.expand
            # 例如: produce5.cpp.233r.expand → produce5.cpp.233r.demangled.expand
            base_name = str(input_path)
            if base_name.endswith('.expand'):
                output_path = Path(base_name.replace('.expand', '.demangled.expand'))
            else:
                output_path = input_path.with_suffix(input_path.suffix + '.demangled.expand')
        
        print(f"  正在去改编 RTL 文件...")
        print(f"    输入文件: {input_path.name}")
        print(f"    输出文件: {output_path.name}")
        
        if self.debug:
            print(f"    完整路径: {output_path}")
        
        try:
            # 读取原始文件
            with open(input_path, 'r', encoding='utf-8', errors='ignore') as f:
                content = f.read()
            
            # 提取所有可能的 C++ mangled 符号
            # 匹配模式：_Z 开头的标识符
            mangled_pattern = re.compile(r'\b(_Z[a-zA-Z0-9_]+)\b')
            symbols = set(mangled_pattern.findall(content))
            
            print(f"  发现符号数: {len(symbols)} 个")
            
            # 去改编每个符号并替换
            demangled_content = content
            replacement_count = 0
            
            for symbol in symbols:
                demangled = self._demangle_symbol(symbol)
                if demangled != symbol:
                    # 使用正则确保完整匹配（避免误替换子串）
                    pattern = r'\b' + re.escape(symbol) + r'\b'
                    demangled_content = re.sub(pattern, demangled, demangled_content)
                    replacement_count += 1
                    if self.debug:
                        print(f"    {symbol} -> {demangled}")
            
            # 写入去改编文件
            with open(output_path, 'w', encoding='utf-8') as f:
                f.write(demangled_content)
            
            # 统计信息
            original_size_kb = input_path.stat().st_size / 1024
            demangled_size_kb = output_path.stat().st_size / 1024
            
            print(f"  ✓ 去改编完成！")
            print(f"    文件路径: {output_path}")
            print(f"    文件大小: {demangled_size_kb:.1f} KB")
            print(f"    去改编符号: {replacement_count}/{len(symbols)}")
            
            if self.debug:
                print(f"    原始大小: {original_size_kb:.1f} KB")
                print(f"    大小变化: +{demangled_size_kb - original_size_kb:.1f} KB")
            
            return str(output_path)
        
        except Exception as e:
            print(f"ERROR: Failed to demangle RTL file: {e}")
            import traceback
            traceback.print_exc()
            return None


def demangle_rtl(
    input_file: str,
    output_file: Optional[str] = None,
    debug: bool = False
) -> Optional[str]:
    """
    便捷函数：去改编 RTL 文件
    
    Args:
        input_file: 输入 .expand 文件
        output_file: 输出文件（默认：<input>.demangled）
        debug: 调试模式
    
    Returns:
        输出文件路径
    """
    demangler = RTLDemangler(debug=debug)
    return demangler.demangle_file(input_file, output_file)


if __name__ == "__main__":
    import argparse
    
    parser = argparse.ArgumentParser(
        description="Demangle C++ symbols in RTL expand file"
    )
    parser.add_argument("input", help="Input .expand file")
    parser.add_argument("--output", help="Output file (default: <input>.demangled)")
    parser.add_argument("--debug", action="store_true", help="Debug mode")
    
    args = parser.parse_args()
    
    output = demangle_rtl(args.input, args.output, args.debug)
    
    if output:
        print(f"SUCCESS: {output}")
    else:
        print("FAILED")
        exit(1)
