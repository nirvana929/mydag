#!/usr/bin/env python3
"""Python 调用图简化器

隐藏 Python 内建函数和标准库调用，简化调用图
"""

import re
from typing import Set, List, Dict


class PythonSimplifier:
    """Python 调用图简化器"""
    
    # Python 内建函数黑名单
    BUILTIN_BLACKLIST = {
        'print', 'len', 'range', 'enumerate', 'zip', 'map', 'filter',
        'str', 'int', 'float', 'bool', 'list', 'dict', 'set', 'tuple',
        'open', 'input', 'isinstance', 'hasattr', 'getattr', 'setattr',
        'sum', 'min', 'max', 'abs', 'round', 'sorted', 'reversed',
        'any', 'all', 'iter', 'next', 'super', 'type', 'id', 'hash',
        'format', 'repr', 'ord', 'chr', 'hex', 'oct', 'bin',
    }
    
    # 标准库模块前缀黑名单（可配置）
    STDLIB_PREFIXES = [
        'os.', 'sys.', 're.', 'json.', 'time.', 'datetime.',
        'collections.', 'itertools.', 'functools.',
        'pathlib.Path', 'logging.', 'argparse.',
        'io.', 'shutil.', 'subprocess.',
        # 保留 threading 和 multiprocessing（这是我们关注的）
    ]
    
    # 语义节点（保留）
    SEMANTIC_NODES = {
        'threading_lock_acquire',
        'threading_lock_release',
        'threading_semaphore_acquire',
        'threading_semaphore_release',
        'threading_event_wait',
        'threading_event_set',
        'threading_condition_wait',
        'threading_condition_notify',
    }
    
    def __init__(self, debug: bool = False):
        self.debug = debug
        self.nodes: Set[str] = set()
        self.edges: List[tuple] = []
        self.node_attrs: Dict[str, str] = {}
        
        # 分类节点
        self.user_nodes: Set[str] = set()
        self.builtin_nodes: Set[str] = set()
        self.semantic_nodes: Set[str] = set()
    
    def simplify(self, dot_content: str) -> str:
        """简化 DOT 图"""
        if self.debug:
            print("=== Starting Python callgraph simplification ===")
        
        # 1. 解析 DOT
        self._parse_dot(dot_content)
        
        # 2. 分类节点
        self._classify_nodes()
        
        # 3. 压缩链路
        self._compress_chains()
        
        # 4. 生成简化 DOT
        result = self._generate_simplified_dot()
        
        if self.debug:
            print(f"Simplified: {len(self.builtin_nodes)} builtin nodes hidden")
            print("=== Simplification complete ===")
        
        return result
    
    def _parse_dot(self, dot_content: str):
        """解析 DOT 内容"""
        lines = dot_content.strip().split('\n')
        
        for line in lines:
            line = line.strip()
            
            # 跳过注释和空行
            if not line or line.startswith('//') or line.startswith('#'):
                continue
            
            # 边: "A" -> "B"
            edge_match = re.match(r'"([^"]+)"\s*->\s*"([^"]+)"(?:\s*\[([^\]]+)\])?', line)
            if edge_match:
                src, dst, attrs = edge_match.groups()
                self.edges.append((src, dst, attrs or ''))
                self.nodes.add(src)
                self.nodes.add(dst)
                continue
            
            # 节点属性: "A" [...]
            node_match = re.match(r'"([^"]+)"\s*\[([^\]]+)\]', line)
            if node_match:
                node, attrs = node_match.groups()
                self.nodes.add(node)
                self.node_attrs[node] = attrs
                continue
        
        if self.debug:
            print(f"Parsed {len(self.nodes)} nodes, {len(self.edges)} edges")
    
    def _classify_nodes(self):
        """分类节点"""
        for node in self.nodes:
            # 语义节点
            if node in self.SEMANTIC_NODES:
                self.semantic_nodes.add(node)
                continue
            
            # 内建函数
            if node in self.BUILTIN_BLACKLIST:
                self.builtin_nodes.add(node)
                continue
            
            # 标准库前缀
            is_stdlib = False
            for prefix in self.STDLIB_PREFIXES:
                if node.startswith(prefix):
                    self.builtin_nodes.add(node)
                    is_stdlib = True
                    break
            
            if is_stdlib:
                continue
            
            # 其余为用户节点
            self.user_nodes.add(node)
        
        if self.debug:
            print(f"User nodes: {len(self.user_nodes)}")
            print(f"Builtin nodes: {len(self.builtin_nodes)}")
            print(f"Semantic nodes: {len(self.semantic_nodes)}")
    
    def _compress_chains(self):
        """压缩仅含内建函数的链路"""
        # 构建邻接表
        adj: Dict[str, List[tuple]] = {}
        for src, dst, attrs in self.edges:
            if src not in adj:
                adj[src] = []
            adj[src].append((dst, attrs))
        
        # 对每个重要节点，找到可达的重要节点
        important_nodes = self.user_nodes | self.semantic_nodes
        new_edges: List[tuple] = []
        
        def find_reachable(start: str, visited: Set[str] = None) -> List[tuple]:
            """从 start 出发，跳过内建节点，找到所有可达的重要节点"""
            if visited is None:
                visited = set()
            
            if start in visited:
                return []
            
            visited.add(start)
            reachable = []
            
            if start not in adj:
                return reachable
            
            for dst, attrs in adj[start]:
                if dst in important_nodes:
                    # 到达重要节点
                    reachable.append((dst, attrs))
                elif dst in self.builtin_nodes:
                    # 内建节点，继续跳过
                    reachable.extend(find_reachable(dst, visited))
            
            return reachable
        
        # 对每个重要节点，构建压缩后的边
        for node in important_nodes:
            targets = find_reachable(node)
            for target, attrs in targets:
                new_edges.append((node, target, attrs))
        
        self.edges = new_edges
        
        if self.debug:
            print(f"Compressed to {len(new_edges)} edges")
    
    def _generate_simplified_dot(self) -> str:
        """生成简化后的 DOT"""
        lines = ['strict digraph callgraph {']
        lines.append('  rankdir=LR;')
        lines.append('  node [shape=box];')
        
        # 保留的节点
        keep_nodes = self.user_nodes | self.semantic_nodes
        
        # 添加节点属性
        for node in keep_nodes:
            if node in self.node_attrs:
                lines.append(f'  "{node}" [{self.node_attrs[node]}];')
        
        # 添加边（去重）
        unique_edges = set()
        for src, dst, attrs in self.edges:
            if src in keep_nodes and dst in keep_nodes:
                edge_key = (src, dst, attrs)
                if edge_key not in unique_edges:
                    unique_edges.add(edge_key)
                    if attrs:
                        lines.append(f'  "{src}" -> "{dst}" [{attrs}];')
                    else:
                        lines.append(f'  "{src}" -> "{dst}";')
        
        lines.append('}')
        return '\n'.join(lines)
