#!/usr/bin/env python3
"""DOT 图生成器

从调用图生成 Graphviz DOT 格式
"""

from typing import Set, List, Dict
from call_graph import CallGraph


class DOTGenerator:
    """DOT 图生成器"""
    
    def __init__(self, graph: CallGraph, debug: bool = False):
        self.graph = graph
        self.debug = debug
    
    def generate_full_graph(self) -> str:
        """生成完整调用图"""
        lines = ['strict digraph callgraph {']
        lines.append('  rankdir=LR;')  # 从左到右布局
        lines.append('  node [shape=box];')
        
        visited_edges: Set[tuple] = set()
        
        # 标记线程入口点
        thread_entries = self.graph.get_thread_entry_points()
        for entry in thread_entries:
            lines.append(f'  "{entry}" [color=green, style=filled, fillcolor=lightgreen];')
        
        # 添加所有函数调用边
        for func_name, func in self.graph.functions.items():
            for callee in func.calls:
                edge = (func_name, callee)
                if edge not in visited_edges:
                    visited_edges.add(edge)
                    lines.append(f'  "{func_name}" -> "{callee}";')
        
        # 添加线程创建边（特殊样式）
        for tc in self.graph.thread_creations:
            edge = (tc.creator, tc.target)
            if edge not in visited_edges:
                visited_edges.add(edge)
                label = self._get_thread_label(tc.thread_type)
                lines.append(f'  "{tc.creator}" -> "{tc.target}" [label="{label}", color=green, penwidth=2.0];')
        
        # 标记外部函数
        external_funcs = self.graph.get_external_functions()
        for func in external_funcs:
            lines.append(f'  "{func}" [style=dashed];')
        
        # 添加同步原语节点
        sync_nodes = self._generate_sync_nodes()
        for node_def in sync_nodes:
            lines.append(f'  {node_def}')
        
        lines.append('}')
        return '\n'.join(lines)
    
    def generate_caller_graph(self, root_function: str, max_depth: int = 0) -> str:
        """生成以某个函数为根的调用者图"""
        if root_function not in self.graph.functions:
            raise ValueError(f"Function '{root_function}' not found in call graph")
        
        lines = ['strict digraph callgraph {']
        lines.append('  rankdir=LR;')
        lines.append('  node [shape=box];')
        
        # 标记根节点
        lines.append(f'  "{root_function}" [color=blue, style=filled, fillcolor=lightblue];')
        
        visited: Set[str] = set()
        
        # 递归遍历
        self._visit_caller(
            root_function,
            visited,
            lines,
            depth=0,
            max_depth=max_depth
        )
        
        # 标记外部函数
        external_funcs = self.graph.get_external_functions()
        for func in visited:
            if func in external_funcs:
                lines.append(f'  "{func}" [style=dashed];')
        
        # 添加同步原语节点（仅涉及visited的）
        sync_nodes = self._generate_sync_nodes(visited_functions=visited)
        for node_def in sync_nodes:
            lines.append(f'  {node_def}')
        
        lines.append('}')
        return '\n'.join(lines)
    
    def _visit_caller(
        self,
        func_name: str,
        visited: Set[str],
        lines: List[str],
        depth: int,
        max_depth: int
    ):
        """递归访问调用关系"""
        if func_name in visited:
            return
        
        if max_depth > 0 and depth >= max_depth:
            return
        
        visited.add(func_name)
        
        if func_name not in self.graph.functions:
            return
        
        func = self.graph.functions[func_name]
        
        # 检查是否有线程创建
        thread_targets = {tc.target: tc.thread_type for tc in self.graph.thread_creations if tc.creator == func_name}
        
        for callee in func.calls:
            # 添加边
            if callee in thread_targets:
                # 线程创建边
                label = self._get_thread_label(thread_targets[callee])
                lines.append(f'  "{func_name}" -> "{callee}" [label="{label}", color=green, penwidth=2.0];')
                # 标记线程入口
                lines.append(f'  "{callee}" [color=green, style=filled, fillcolor=lightgreen];')
            else:
                lines.append(f'  "{func_name}" -> "{callee}";')
            
            # 递归访问
            self._visit_caller(
                callee,
                visited,
                lines,
                depth + 1,
                max_depth
            )
    
    def _get_thread_label(self, thread_type: str) -> str:
        """获取线程类型标签"""
        labels = {
            'Thread': 'thread',
            'Pool': 'pool_submit',
            'Process': 'process'
        }
        return labels.get(thread_type, 'thread')
    
    def _generate_sync_nodes(self, visited_functions: Set[str] = None) -> List[str]:
        """生成同步原语节点定义"""
        nodes = []
        sync_node_names: Set[str] = set()
        
        for sp in self.graph.sync_primitives:
            # 如果指定了visited_functions，只处理相关的
            if visited_functions is not None and sp.function not in visited_functions:
                continue
            
            # 构建同步节点名
            node_name = f"threading_{sp.primitive_type}_{sp.operation}"
            
            if node_name not in sync_node_names:
                sync_node_names.add(node_name)
                # 定义同步节点（灰色虚线）
                nodes.append(f'"{node_name}" [style=dashed, color=gray];')
            
            # 添加从函数到同步节点的边
            nodes.append(f'"{sp.function}" -> "{node_name}";')
        
        return nodes
    
    def generate_thread_only_graph(self) -> str:
        """生成仅包含线程相关的简化图"""
        lines = ['strict digraph callgraph {']
        lines.append('  rankdir=LR;')
        lines.append('  node [shape=box];')
        
        # 收集所有涉及线程的函数
        thread_funcs: Set[str] = set()
        
        # 线程创建者和目标
        for tc in self.graph.thread_creations:
            thread_funcs.add(tc.creator)
            thread_funcs.add(tc.target)
        
        # 使用同步原语的函数
        for sp in self.graph.sync_primitives:
            thread_funcs.add(sp.function)
        
        # 添加这些函数的调用关系
        visited_edges: Set[tuple] = set()
        
        for func_name in thread_funcs:
            if func_name in self.graph.functions:
                func = self.graph.functions[func_name]
                for callee in func.calls:
                    if callee in thread_funcs:  # 仅保留线程相关函数之间的调用
                        edge = (func_name, callee)
                        if edge not in visited_edges:
                            visited_edges.add(edge)
                            lines.append(f'  "{func_name}" -> "{callee}";')
        
        # 添加线程创建边
        for tc in self.graph.thread_creations:
            edge = (tc.creator, tc.target)
            if edge not in visited_edges:
                visited_edges.add(edge)
                label = self._get_thread_label(tc.thread_type)
                lines.append(f'  "{tc.creator}" -> "{tc.target}" [label="{label}", color=green, penwidth=2.0];')
        
        # 标记线程入口
        thread_entries = self.graph.get_thread_entry_points()
        for entry in thread_entries:
            lines.append(f'  "{entry}" [color=green, style=filled, fillcolor=lightgreen];')
        
        # 添加同步原语
        sync_nodes = self._generate_sync_nodes(visited_functions=thread_funcs)
        for node_def in sync_nodes:
            lines.append(f'  {node_def}')
        
        lines.append('}')
        return '\n'.join(lines)
