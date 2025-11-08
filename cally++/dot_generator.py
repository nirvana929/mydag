#!/usr/bin/env python3
"""DOT 图生成器

从调用图数据结构生成 Graphviz DOT 格式文件。

参考自 mycallypro/legacy.py 的渲染逻辑
"""

from typing import Set, Optional, List
from rtl_parser import CallGraph


class DOTGenerator:
    """DOT 图生成器"""
    
    def __init__(self, graph: CallGraph):
        """初始化生成器
        
        Args:
            graph: 调用图对象
        """
        self.graph = graph
    
    def generate_caller_graph(
        self,
        root_function: str,
        max_depth: int = 0,
        exclude_externs: bool = False
    ) -> str:
        """生成以某个函数为根的调用者图（caller graph）
        
        Args:
            root_function: 根函数名
            max_depth: 最大深度，0 表示不限制
            exclude_externs: 是否排除外部函数（未定义的函数）
            
        Returns:
            DOT 格式字符串
        """
        visited: Set[str] = set()
        lines = ['strict digraph callgraph {']
        
        # 标记根节点
        lines.append(f'"{root_function}" [color=blue, style=filled];')
        
        # 遍历调用关系
        self._visit_caller(
            root_function,
            visited,
            lines,
            depth=0,
            max_depth=max_depth,
            exclude_externs=exclude_externs
        )
        
        lines.append('}')
        return '\n'.join(lines)
    
    def _visit_caller(
        self,
        func_name: str,
        visited: Set[str],
        lines: List[str],
        depth: int,
        max_depth: int,
        exclude_externs: bool
    ):
        """递归访问函数调用"""
        if func_name in visited:
            return
        
        if max_depth > 0 and depth >= max_depth:
            return
        
        visited.add(func_name)
        
        # 获取函数信息
        if func_name not in self.graph.functions:
            return
        
        func = self.graph.functions[func_name]
        
        # 遍历所有调用
        for callee in func.calls:
            # 检查是否为外部函数
            is_extern = callee not in self.graph.functions
            
            if exclude_externs and is_extern:
                continue
            
            # 添加边
            lines.append(f'"{func_name}" -> "{callee}";')
            
            # 如果是外部函数，标记为虚线
            if is_extern:
                lines.append(f'"{callee}" [style=dashed];')
            else:
                # 递归访问
                self._visit_caller(
                    callee,
                    visited,
                    lines,
                    depth + 1,
                    max_depth,
                    exclude_externs
                )
    
    def generate_callee_graph(
        self,
        root_function: str,
        max_depth: int = 0,
        exclude_externs: bool = False
    ) -> str:
        """生成以某个函数为根的被调用者图（callee graph）
        
        Args:
            root_function: 根函数名
            max_depth: 最大深度，0 表示不限制
            exclude_externs: 是否排除外部函数
            
        Returns:
            DOT 格式字符串
        """
        # 构建反向索引
        callers: dict[str, Set[str]] = {}
        for func_name, func in self.graph.functions.items():
            for callee in func.calls:
                if callee not in callers:
                    callers[callee] = set()
                callers[callee].add(func_name)
        
        visited: Set[str] = set()
        lines = ['strict digraph callgraph {']
        
        # 标记根节点
        lines.append(f'"{root_function}" [color=blue, style=filled];')
        
        # 遍历调用关系
        self._visit_callee(
            root_function,
            callers,
            visited,
            lines,
            depth=0,
            max_depth=max_depth,
            exclude_externs=exclude_externs
        )
        
        lines.append('}')
        return '\n'.join(lines)
    
    def _visit_callee(
        self,
        func_name: str,
        callers: dict,
        visited: Set[str],
        lines: List[str],
        depth: int,
        max_depth: int,
        exclude_externs: bool
    ):
        """递归访问被调用关系"""
        if func_name in visited:
            return
        
        if max_depth > 0 and depth >= max_depth:
            return
        
        visited.add(func_name)
        
        # 获取所有调用者
        if func_name not in callers:
            return
        
        for caller in callers[func_name]:
            # 检查是否为外部函数
            is_extern = caller not in self.graph.functions
            
            if exclude_externs and is_extern:
                continue
            
            # 添加边（注意方向：caller -> func_name）
            lines.append(f'"{caller}" -> "{func_name}";')
            
            # 如果是外部函数，标记为虚线
            if is_extern:
                lines.append(f'"{caller}" [style=dashed];')
            else:
                # 递归访问
                self._visit_callee(
                    caller,
                    callers,
                    visited,
                    lines,
                    depth + 1,
                    max_depth,
                    exclude_externs
                )
    
    def generate_full_graph(self, exclude_externs: bool = False) -> str:
        """生成完整的调用图
        
        Args:
            exclude_externs: 是否排除外部函数
            
        Returns:
            DOT 格式字符串
        """
        lines = ['strict digraph callgraph {']
        
        # 遍历所有函数
        for func_name, func in self.graph.functions.items():
            for callee in func.calls:
                # 检查是否为外部函数
                is_extern = callee not in self.graph.functions
                
                if exclude_externs and is_extern:
                    continue
                
                # 添加边
                lines.append(f'"{func_name}" -> "{callee}";')
                
                # 如果是外部函数，标记为虚线
                if is_extern:
                    lines.append(f'"{callee}" [style=dashed];')
        
        lines.append('}')
        return '\n'.join(lines)


def main():
    """测试代码"""
    import sys
    from rtl_parser import RTLParser
    
    if len(sys.argv) < 3:
        print("Usage: python dot_generator.py <rtl_file> <function_name>")
        sys.exit(1)
    
    # 解析 RTL
    parser = RTLParser(enable_demangle=True)
    graph = parser.parse_file(sys.argv[1])
    
    # 生成 DOT
    generator = DOTGenerator(graph)
    dot_content = generator.generate_caller_graph(sys.argv[2])
    
    print(dot_content)


if __name__ == '__main__':
    main()
