#!/usr/bin/env python3
"""
C++ 线程调用图简化器
将包含大量 STL 模板实现细节的 DOT 图简化为用户友好的形式
"""

import re
import sys
from pathlib import Path
from typing import Dict, Set, List, Tuple, Optional

class DotSimplifier:
    """DOT 图简化器"""
    
    # 库前缀黑名单 - 需要隐藏的库实现
    LIB_PREFIXES = [
        'std::__',
        'std::_',
        'std::basic_',
        '__gnu_cxx::',
        '__cxxabiv1::',
        '__gthread',
        '__stack_chk',
        '_GLOBAL__',
        '__static_initialization',
    ]

    LIB_KEYWORDS = [
        '_Unwind_Resume',
        '__cxa_',
        'operator new',
        'operator delete',
    ]
    
    # 语义锚点 - 需要识别并映射的关键节点
    SEMANTIC_PATTERNS = {
        'thread_create': r'std::thread::thread<.*>',
        'thread_join': r'std::thread::join\(\)',
        'mutex_lock': r'(std::lock_guard<.*>::lock_guard\(|std::mutex::lock\(\)|__gthread_mutex_lock|pthread_mutex_lock)',
        'mutex_unlock': r'(std::lock_guard<.*>::~lock_guard\(|std::mutex::unlock\(\)|__gthread_mutex_unlock|pthread_mutex_unlock)',
    }
    
    # 通用 std:: 节点（除了语义锚点，其他都隐藏）
    STD_PATTERN = r'std::'
    
    def __init__(self, debug=False):
        self.debug = debug
        self.nodes: Set[str] = set()
        self.edges: List[Tuple[str, str]] = []
        self.node_attrs: Dict[str, str] = {}
        self.adj: Dict[str, List[str]] = {}
        self.is_strict = False
        
        # 分类后的节点
        self.user_nodes: Set[str] = set()
        self.lib_nodes: Set[str] = set()
        self.semantic_nodes: Set[str] = set()
        self.thread_create_nodes: Set[str] = set()
        
        # 语义映射
        self.semantic_mapping: Dict[str, str] = {}
        
    def parse_dot(self, dot_content: str):
        """解析 DOT 文件"""
        lines = dot_content.strip().split('\n')
        
        for line in lines:
            line = line.strip()
            
            # 检查 strict
            if line.startswith('strict digraph'):
                self.is_strict = True
                continue
            
            # 跳过注释和空行
            if not line or line.startswith('//') or line.startswith('#'):
                continue
            
            # 边: "A" -> "B";
            edge_match = re.match(r'"([^"]+)"\s*->\s*"([^"]+)"', line)
            if edge_match:
                src, dst = edge_match.groups()
                self.edges.append((src, dst))
                self.nodes.add(src)
                self.nodes.add(dst)
                self.adj.setdefault(src, []).append(dst)
                continue
            
            # 节点属性: "A" [color=blue, style=filled];
            node_match = re.match(r'"([^"]+)"\s*\[([^\]]+)\]', line)
            if node_match:
                node, attrs = node_match.groups()
                self.nodes.add(node)
                self.node_attrs[node] = attrs
                continue
        
        if self.debug:
            print(f"Parsed {len(self.nodes)} nodes, {len(self.edges)} edges")
    
    def classify_nodes(self):
        """分类节点：用户节点、库节点、语义节点"""
        for node in self.nodes:
            # 检查是否为语义节点
            is_semantic = False
            for sem_type, pattern in self.SEMANTIC_PATTERNS.items():
                if re.search(pattern, node):
                    self.semantic_nodes.add(node)
                    is_semantic = True

                    # 建立语义映射
                    if sem_type == 'thread_join':
                        self.semantic_mapping[node] = 'pthread_join'
                    elif sem_type == 'mutex_lock':
                        self.semantic_mapping[node] = 'pthread_mutex_lock'
                    elif sem_type == 'mutex_unlock':
                        self.semantic_mapping[node] = 'pthread_mutex_unlock'
                    # thread_create 需要特殊处理，稍后推断
                    elif sem_type == 'thread_create':
                        self.thread_create_nodes.add(node)

                    break
            
            if is_semantic:
                continue
            
            # 检查是否为库节点
            is_lib = False
            
            # 检查黑名单前缀
            for prefix in self.LIB_PREFIXES:
                if node.startswith(prefix):
                    self.lib_nodes.add(node)
                    is_lib = True
                    break

            if is_lib:
                continue

            for keyword in self.LIB_KEYWORDS:
                if keyword in node:
                    self.lib_nodes.add(node)
                    is_lib = True
                    break
            
            if is_lib:
                continue
            
            # 检查通用 std:: 节点
            if re.search(self.STD_PATTERN, node):
                self.lib_nodes.add(node)
                continue
            
            # 其余为用户节点
            self.user_nodes.add(node)
        
        if self.debug:
            print(f"User nodes: {len(self.user_nodes)}")
            print(f"Lib nodes: {len(self.lib_nodes)}")
            print(f"Semantic nodes: {len(self.semantic_nodes)}")
    
    def infer_worker_functions(self, source_file: Path = None):
        """推断线程工作函数（优先从图中 BFS，失败再回退到源代码解析）"""
        thread_nodes: Set[str] = set()
        for _, dst in self.edges:
            if re.search(self.SEMANTIC_PATTERNS['thread_create'], dst):
                thread_nodes.add(dst)

        if not thread_nodes:
            return

        for thread_node in thread_nodes:
            worker = self._find_user_reachable(thread_node)

            if not worker and source_file and source_file.exists():
                worker = self._parse_thread_from_source(source_file)

            if worker:
                self.semantic_mapping[thread_node] = worker
                if self.debug:
                    print(f"Inferred worker function: {worker} for {thread_node}")

    def _find_user_reachable(self, start_node: str) -> Optional[str]:
        """从 thread_create 节点出发，沿库节点寻找第一个用户节点"""
        from collections import deque

        queue = deque(self.adj.get(start_node, []))
        visited = set([start_node])

        while queue:
            node = queue.popleft()
            if node in visited:
                continue
            visited.add(node)

            if node in self.user_nodes:
                return node

            if node in self.lib_nodes or node in self.semantic_nodes:
                queue.extend(self.adj.get(node, []))

        return None
    
    def _parse_thread_from_source(self, source_file: Path) -> Optional[str]:
        """从源代码解析 std::thread 的第一个参数"""
        try:
            content = source_file.read_text(encoding='utf-8')
            
            # 查找 std::thread( 的调用
            # 简化版：匹配 std::thread(workerThread, ...)
            pattern = r'std::thread\s*\(\s*([a-zA-Z_][a-zA-Z0-9_]*)'
            matches = re.findall(pattern, content)

            if matches:
                candidate = matches[0]
                for node in self.user_nodes:
                    if candidate in node:
                        return node
                return candidate
        except Exception as e:
            if self.debug:
                print(f"Failed to parse source: {e}")
        
        return None
    
    def compress_lib_chains(self):
        """压缩库链路：用户/语义节点之间跳过库节点"""
        new_edges = []
        passthrough_edges = []
        
        # 对每个用户/语义节点，进行 DFS/BFS 跳过库节点
        important_nodes = self.user_nodes | self.semantic_nodes

        def find_reachable(start: str, visited: Set[str] = None) -> Set[str]:
            """从 start 出发，跳过库节点，找到所有可达的用户/语义节点"""
            if visited is None:
                visited = set()
            
            if start in visited:
                return set()
            
            visited.add(start)
            reachable = set()
            
            if start not in self.adj:
                return reachable

            for dst in self.adj[start]:
                if dst in important_nodes and dst not in self.thread_create_nodes:
                    reachable.add(dst)
                elif dst in self.lib_nodes or dst in self.thread_create_nodes:
                    # 库节点，继续跳过
                    reachable.update(find_reachable(dst, visited))
            
            return reachable
        
        # 对每个重要节点，找到其直接可达的重要节点
        for src, dst in self.edges:
            if src in important_nodes and dst in self.thread_create_nodes:
                passthrough_edges.append((src, dst))

        for node in important_nodes:
            targets = find_reachable(node)
            for target in targets:
                new_edges.append((node, target))

        self.edges = new_edges + passthrough_edges
        
        if self.debug:
            print(f"Compressed to {len(new_edges)} edges")
    
    def apply_semantic_mapping(self):
        """应用语义映射，替换节点名"""
        # 替换边中的节点
        mapped_edges = []
        cleaned_edges = []
        for src, dst in self.edges:
            new_src = self.semantic_mapping.get(src, src)
            new_dst = self.semantic_mapping.get(dst, dst)
            if new_src != new_dst:
                cleaned_edges.append((new_src, new_dst))

        self.edges = cleaned_edges
        
        # 更新节点集合
        self.nodes = set()
        for src, dst in self.edges:
            self.nodes.add(src)
            self.nodes.add(dst)
        
        # 更新节点属性
        new_attrs = {}
        for old_node, attrs in self.node_attrs.items():
            new_node = self.semantic_mapping.get(old_node, old_node)
            if new_node not in new_attrs:  # 避免重复
                new_attrs[new_node] = attrs
        self.node_attrs = new_attrs
    
    def generate_simplified_dot(self) -> str:
        """生成简化后的 DOT"""
        lines = []
        
        if self.is_strict:
            lines.append('strict digraph callgraph {')
        else:
            lines.append('digraph callgraph {')
        
        # 保留的节点（用户节点 + 映射后的语义节点）
        semantic_nodes_mapped = set(self.semantic_mapping.values())
        keep_nodes = self.user_nodes | semantic_nodes_mapped
        
        # 添加节点属性
        for node in keep_nodes:
            if node in self.node_attrs:
                lines.append(f'"{node}" [{self.node_attrs[node]}];')
            elif node in ['pthread_join', 'pthread_mutex_lock', 'pthread_mutex_unlock']:
                # 语义节点使用灰色虚线
                lines.append(f'"{node}" [style=dashed, color=gray];')
        
        # 添加边（去重）
        unique_edges = set(self.edges)
        for src, dst in sorted(unique_edges):
            if src in keep_nodes and dst in keep_nodes:
                lines.append(f'"{src}" -> "{dst}";')
        
        lines.append('}')
        
        return '\n'.join(lines)
    
    def simplify(self, dot_content: str, source_file: Path = None) -> str:
        """执行简化流程"""
        if self.debug:
            print("=== Starting DOT simplification ===")

        # reset state for each run
        self.nodes.clear()
        self.edges.clear()
        self.node_attrs.clear()
        self.adj.clear()
        self.user_nodes.clear()
        self.lib_nodes.clear()
        self.semantic_nodes.clear()
        self.thread_create_nodes.clear()
        self.semantic_mapping.clear()
        self.is_strict = False

        # 1. 解析 DOT
        self.parse_dot(dot_content)
        
        # 2. 分类节点
        self.classify_nodes()
        
        # 3. 推断工作函数
        self.infer_worker_functions(source_file)
        
        # 4. 压缩库链路
        self.compress_lib_chains()
        
        # 5. 应用语义映射
        self.apply_semantic_mapping()
        
        # 6. 生成简化 DOT
        result = self.generate_simplified_dot()
        
        if self.debug:
            print("=== Simplification complete ===")

        return result


def main():
    """命令行入口"""
    import argparse
    
    parser = argparse.ArgumentParser(description="Simplify C++ callgraph DOT files")
    parser.add_argument("--input", required=True, help="Input DOT file")
    parser.add_argument("--output", help="Output DOT file (default: <input>_simple.dot)")
    parser.add_argument("--source", help="Source file for thread function inference")
    parser.add_argument("--inplace", action="store_true", help="Overwrite input file")
    parser.add_argument("--debug", action="store_true", help="Debug mode")
    args = parser.parse_args()
    
    input_path = Path(args.input)
    if not input_path.exists():
        print(f"ERROR: File not found: {input_path}")
        return 1
    
    # 读取输入
    dot_content = input_path.read_text(encoding='utf-8')
    
    # 简化
    simplifier = DotSimplifier(debug=args.debug)
    source_file = Path(args.source) if args.source else None
    simplified = simplifier.simplify(dot_content, source_file)
    
    # 输出
    if args.inplace:
        output_path = input_path
    elif args.output:
        output_path = Path(args.output)
    else:
        output_path = input_path.parent / f"{input_path.stem}_simple.dot"
    
    output_path.write_text(simplified, encoding='utf-8')
    print(f"Simplified DOT saved: {output_path}")
    
    return 0


if __name__ == "__main__":
    sys.exit(main())
