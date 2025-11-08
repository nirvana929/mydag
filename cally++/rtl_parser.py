#!/usr/bin/env python3
"""RTL 解析器 - 集成 C++ 符号去改编功能

从 GCC RTL expand 文件中解析函数调用关系，并在解析过程中
直接对 C++ 混淆符号进行去改编处理。

参考自 mycallyplus/core/parser.py 和 mycallypro/legacy.py
"""

import re
import subprocess
from typing import Dict, Set, List, Optional, Tuple


class Demangler:
    """C++ 符号去改编器"""
    
    def __init__(self):
        """初始化去改编器，检测可用工具"""
        self.tool = self._detect_tool()
        self._cache: Dict[str, str] = {}
    
    def _detect_tool(self) -> Optional[str]:
        """检测可用的 c++filt 或 llvm-cxxfilt"""
        for tool in ['c++filt', 'llvm-cxxfilt']:
            try:
                result = subprocess.run(
                    [tool, '--version'],
                    capture_output=True,
                    timeout=1
                )
                if result.returncode == 0:
                    return tool
            except (FileNotFoundError, subprocess.TimeoutExpired):
                continue
        return None
    
    def demangle(self, symbol: str) -> str:
        """对单个符号进行去改编
        
        Args:
            symbol: 混淆的 C++ 符号（如 _ZN16BatterySimulator3RunEv）
            
        Returns:
            去改编后的符号（如 BatterySimulator::Run()）
        """
        # 如果不是 C++ 混淆符号，直接返回
        if not symbol.startswith('_Z'):
            return symbol
        
        # 检查缓存
        if symbol in self._cache:
            return self._cache[symbol]
        
        # 如果没有可用工具，返回原符号
        if not self.tool:
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
                if demangled and demangled != symbol:
                    self._cache[symbol] = demangled
                    return demangled
        except (subprocess.TimeoutExpired, Exception):
            pass
        
        self._cache[symbol] = symbol
        return symbol


class Function:
    """函数信息"""
    
    def __init__(self, name: str):
        self.name = name
        self.calls: Set[str] = set()  # 调用的函数
        self.call_sequence: List[str] = []  # 调用序列（保持顺序）
        self.refs: Set[str] = set()  # 符号引用
        self.files: Set[str] = set()  # 定义所在的文件


class CallGraph:
    """调用图数据结构"""
    
    def __init__(self):
        self.functions: Dict[str, Function] = {}
    
    def ensure_function(self, name: str) -> Function:
        """确保函数存在，不存在则创建"""
        if name not in self.functions:
            self.functions[name] = Function(name)
        return self.functions[name]
    
    def add_call(self, caller: str, callee: str):
        """添加调用关系"""
        func = self.ensure_function(caller)
        func.calls.add(callee)
        func.call_sequence.append(callee)
    
    def add_ref(self, func_name: str, ref: str):
        """添加符号引用"""
        func = self.ensure_function(func_name)
        func.refs.add(ref)


class RTLParser:
    """RTL 解析器 - 集成去改编功能"""
    
    def __init__(self, enable_demangle: bool = True, debug: bool = False):
        """初始化解析器
        
        Args:
            enable_demangle: 是否启用 C++ 符号去改编
            debug: 是否输出调试信息
        """
        self.enable_demangle = enable_demangle
        self.debug = debug
        self.demangler = Demangler() if enable_demangle else None
        
        # 编译正则表达式
        self._function_re = re.compile(
            r"^;; Function (?P<mangle>.*)\s+\((?P<function>\S+)(,.*)?\).*$"
        )
        self._call_re = re.compile(r'^.*\(call.*"(?P<target>.*)".*$')
        self._symbol_ref_re = re.compile(r'^.*\(symbol_ref.*"(?P<target>.*)".*$')
    
    def _demangle_if_needed(self, symbol: str) -> str:
        """如果启用去改编，则处理符号"""
        if self.enable_demangle and self.demangler:
            return self.demangler.demangle(symbol)
        return symbol
    
    def parse_file(self, rtl_file: str) -> CallGraph:
        """解析单个 RTL 文件
        
        Args:
            rtl_file: RTL expand 文件路径
            
        Returns:
            CallGraph 对象
        """
        graph = CallGraph()
        current_function: Optional[str] = None
        
        with open(rtl_file, 'r', encoding='utf-8', errors='ignore') as f:
            for line_no, line in enumerate(f, 1):
                # 解析函数头
                header_match = self._function_re.match(line)
                if header_match:
                    # 提取函数名（可能是混淆的）
                    func_name = header_match.group("function")
                    
                    # 去改编函数名
                    demangled_name = self._demangle_if_needed(func_name)
                    
                    current_function = demangled_name
                    func = graph.ensure_function(demangled_name)
                    func.files.add(rtl_file)
                    
                    if self.debug and func_name != demangled_name:
                        print(f"[DEBUG] Demangled function: {func_name} -> {demangled_name}")
                    
                    continue
                
                # 如果还没遇到函数定义，跳过
                if current_function is None:
                    continue
                
                # 匹配函数调用
                call_match = self._call_re.match(line)
                if call_match:
                    target = call_match.group("target")
                    demangled_target = self._demangle_if_needed(target)
                    graph.add_call(current_function, demangled_target)
                    
                    if self.debug and target != demangled_target:
                        print(f"[DEBUG] Demangled call: {target} -> {demangled_target}")
                    
                    continue
                
                # 匹配符号引用
                ref_match = self._symbol_ref_re.match(line)
                if ref_match:
                    target = ref_match.group("target")
                    demangled_target = self._demangle_if_needed(target)
                    graph.add_ref(current_function, demangled_target)
                    continue
        
        if self.debug and self.demangler:
            print(f"\n[INFO] Demangle statistics:")
            print(f"  - Total symbols processed: {len(self.demangler._cache)}")
            demangled_count = sum(1 for k, v in self.demangler._cache.items() if k != v)
            print(f"  - Successfully demangled: {demangled_count}")
        
        return graph
    
    def parse_files(self, rtl_files: List[str]) -> CallGraph:
        """解析多个 RTL 文件
        
        Args:
            rtl_files: RTL 文件路径列表
            
        Returns:
            合并后的 CallGraph 对象
        """
        merged_graph = CallGraph()
        
        for rtl_file in rtl_files:
            if self.debug:
                print(f"\n[INFO] Parsing {rtl_file}...")
            
            graph = self.parse_file(rtl_file)
            
            # 合并到总图中
            for func_name, func in graph.functions.items():
                merged_func = merged_graph.ensure_function(func_name)
                merged_func.calls.update(func.calls)
                merged_func.call_sequence.extend(func.call_sequence)
                merged_func.refs.update(func.refs)
                merged_func.files.update(func.files)
        
        return merged_graph


def main():
    """测试代码"""
    import sys
    
    if len(sys.argv) < 2:
        print("Usage: python rtl_parser.py <rtl_file>")
        sys.exit(1)
    
    parser = RTLParser(enable_demangle=True, debug=True)
    graph = parser.parse_file(sys.argv[1])
    
    print(f"\n[INFO] Parsed {len(graph.functions)} functions")
    
    # 显示前几个函数
    for i, (name, func) in enumerate(list(graph.functions.items())[:5]):
        print(f"\nFunction: {name}")
        print(f"  Calls: {list(func.calls)[:3]}")
        if i >= 4:
            break


if __name__ == '__main__':
    main()
