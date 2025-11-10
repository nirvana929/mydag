#!/usr/bin/env python3
"""AST 解析器

解析 Python 源代码，提取函数定义和调用关系
"""

import ast
from pathlib import Path
from typing import Optional, List, Set
from call_graph import CallGraph, Function


class ASTParser:
    """AST 解析器"""
    
    def __init__(self, debug: bool = False):
        self.debug = debug
        self.graph = CallGraph()
        self.current_file: Optional[str] = None
    
    def parse_file(self, filepath: str) -> CallGraph:
        """解析 Python 文件"""
        filepath = Path(filepath)
        if not filepath.exists():
            raise FileNotFoundError(f"File not found: {filepath}")
        
        self.current_file = str(filepath)
        
        if self.debug:
            print(f"Parsing file: {filepath}")
        
        # 读取源代码
        source = filepath.read_text(encoding='utf-8')
        
        # 解析为 AST
        try:
            tree = ast.parse(source, filename=str(filepath))
        except SyntaxError as e:
            print(f"Syntax error in {filepath}: {e}")
            return self.graph
        
        # 遍历 AST
        visitor = CallGraphVisitor(self.graph, self.current_file, self.debug)
        visitor.visit(tree)
        
        if self.debug:
            print(f"Parsed {len(self.graph.functions)} functions")
            print(f"Found {len(self.graph.thread_creations)} thread creations")
        
        return self.graph


class CallGraphVisitor(ast.NodeVisitor):
    """AST 访问者，构建调用图"""
    
    def __init__(self, graph: CallGraph, filename: str, debug: bool = False):
        self.graph = graph
        self.filename = filename
        self.debug = debug
        
        # 上下文栈
        self.current_class: Optional[str] = None
        self.current_function: Optional[str] = None
        self.scope_stack: List[str] = []  # 用于嵌套函数
    
    def visit_Import(self, node: ast.Import):
        """处理 import 语句"""
        for alias in node.names:
            name = alias.asname if alias.asname else alias.name
            self.graph.add_import(name, alias.name)
            if self.debug:
                print(f"[Import] {name} -> {alias.name}")
        self.generic_visit(node)
    
    def visit_ImportFrom(self, node: ast.ImportFrom):
        """处理 from ... import 语句"""
        module = node.module or ''
        for alias in node.names:
            name = alias.asname if alias.asname else alias.name
            full_path = f"{module}.{alias.name}" if module else alias.name
            self.graph.add_import(name, full_path)
            if self.debug:
                print(f"[ImportFrom] {name} -> {full_path}")
        self.generic_visit(node)
    
    def visit_ClassDef(self, node: ast.ClassDef):
        """处理类定义"""
        old_class = self.current_class
        self.current_class = node.name
        self.scope_stack.append(node.name)
        
        if self.debug:
            print(f"[ClassDef] {node.name} at line {node.lineno}")
        
        # 访问类体
        self.generic_visit(node)
        
        self.current_class = old_class
        self.scope_stack.pop()
    
    def visit_FunctionDef(self, node: ast.FunctionDef):
        """处理函数定义"""
        self._visit_function(node, is_async=False)
    
    def visit_AsyncFunctionDef(self, node: ast.AsyncFunctionDef):
        """处理异步函数定义"""
        self._visit_function(node, is_async=True)
    
    def _visit_function(self, node, is_async: bool):
        """处理函数定义（同步/异步）"""
        # 构建完全限定名
        func_name = self._get_qualified_name(node.name)
        
        # 创建函数对象
        func = Function(
            name=func_name,
            defined_in=self.filename,
            lineno=node.lineno,
            is_method=self.current_class is not None,
            class_name=self.current_class,
            is_async=is_async,
            decorators=[self._get_decorator_name(d) for d in node.decorator_list]
        )
        
        self.graph.add_function(func)
        
        if self.debug:
            print(f"[FunctionDef] {func_name} at line {node.lineno}")
        
        # 保存当前函数上下文
        old_function = self.current_function
        self.current_function = func_name
        self.scope_stack.append(node.name)
        
        # 访问函数体
        self.generic_visit(node)
        
        # 恢复上下文
        self.current_function = old_function
        self.scope_stack.pop()
    
    def visit_Call(self, node: ast.Call):
        """处理函数调用"""
        if not self.current_function:
            # 不在任何函数内（模块级调用），跳过或记录到特殊函数
            self.generic_visit(node)
            return
        
        # 解析调用目标
        callee = self._resolve_call_target(node.func)
        
        if callee:
            # 添加调用关系
            self.graph.add_call(self.current_function, callee)
            
            if self.debug:
                print(f"[Call] {self.current_function} -> {callee}")
            
            # 检查是否为线程创建
            self._check_thread_creation(node, callee)
            
            # 检查是否为同步原语
            self._check_sync_primitive(node, callee)
        
        self.generic_visit(node)
    
    def _get_qualified_name(self, name: str) -> str:
        """获取完全限定名"""
        if self.current_class:
            return f"{self.current_class}.{name}"
        elif self.scope_stack:
            # 嵌套函数
            return '.'.join(self.scope_stack) + f".{name}"
        else:
            return name
    
    def _resolve_call_target(self, node) -> Optional[str]:
        """解析调用目标"""
        if isinstance(node, ast.Name):
            # 简单名称：func()
            name = node.id
            # 检查是否为导入的名称
            if name in self.graph.imports:
                return self.graph.imports[name]
            return name
        
        elif isinstance(node, ast.Attribute):
            # 属性访问：obj.method() 或 module.func()
            return self._resolve_attribute(node)
        
        elif isinstance(node, ast.Call):
            # 调用返回的可调用对象：get_func()()
            # 暂时无法静态解析
            return "<dynamic_call>"
        
        return None
    
    def _resolve_attribute(self, node: ast.Attribute) -> str:
        """解析属性访问"""
        parts = []
        current = node
        
        # 从右向左收集属性链
        while isinstance(current, ast.Attribute):
            parts.insert(0, current.attr)
            current = current.value
        
        # 处理基础对象
        if isinstance(current, ast.Name):
            base = current.id
            # 检查是否为导入的模块
            if base in self.graph.imports:
                base = self.graph.imports[base]
            parts.insert(0, base)
        elif isinstance(current, ast.Call):
            # 方法链：obj.get().method()
            parts.insert(0, "<dynamic>")
        else:
            parts.insert(0, "<unknown>")
        
        return '.'.join(parts)
    
    def _get_decorator_name(self, decorator) -> str:
        """获取装饰器名称"""
        if isinstance(decorator, ast.Name):
            return decorator.id
        elif isinstance(decorator, ast.Attribute):
            return self._resolve_attribute(decorator)
        elif isinstance(decorator, ast.Call):
            # 装饰器带参数：@decorator(args)
            if isinstance(decorator.func, ast.Name):
                return decorator.func.id
            elif isinstance(decorator.func, ast.Attribute):
                return self._resolve_attribute(decorator.func)
        return "<unknown_decorator>"
    
    def _check_thread_creation(self, node: ast.Call, callee: str):
        """检查是否为线程创建"""
        # threading.Thread(target=...)
        if 'Thread' in callee and callee.startswith('threading.'):
            target = self._extract_thread_target(node)
            if target:
                self.graph.add_thread_creation(
                    creator=self.current_function,
                    target=target,
                    thread_type='Thread',
                    lineno=node.lineno
                )
                if self.debug:
                    print(f"[ThreadCreation] {self.current_function} creates thread -> {target}")
        
        # ThreadPoolExecutor.submit(func, ...)
        elif 'submit' in callee and 'Executor' in callee:
            target = self._extract_pool_target(node)
            if target:
                self.graph.add_thread_creation(
                    creator=self.current_function,
                    target=target,
                    thread_type='Pool',
                    lineno=node.lineno
                )
                if self.debug:
                    print(f"[PoolSubmit] {self.current_function} submits -> {target}")
        
        # multiprocessing.Process(target=...)
        elif 'Process' in callee and 'multiprocessing' in callee:
            target = self._extract_thread_target(node)
            if target:
                self.graph.add_thread_creation(
                    creator=self.current_function,
                    target=target,
                    thread_type='Process',
                    lineno=node.lineno
                )
                if self.debug:
                    print(f"[ProcessCreation] {self.current_function} creates process -> {target}")
    
    def _extract_thread_target(self, node: ast.Call) -> Optional[str]:
        """提取 Thread(target=...) 中的目标函数"""
        for keyword in node.keywords:
            if keyword.arg == 'target':
                if isinstance(keyword.value, ast.Name):
                    return keyword.value.id
                elif isinstance(keyword.value, ast.Attribute):
                    return self._resolve_attribute(keyword.value)
        return None
    
    def _extract_pool_target(self, node: ast.Call) -> Optional[str]:
        """提取 executor.submit(func, ...) 中的函数"""
        if node.args:
            first_arg = node.args[0]
            if isinstance(first_arg, ast.Name):
                return first_arg.id
            elif isinstance(first_arg, ast.Attribute):
                return self._resolve_attribute(first_arg)
        return None
    
    def _check_sync_primitive(self, node: ast.Call, callee: str):
        """检查是否为同步原语调用"""
        # Lock/RLock/Semaphore.acquire()
        if callee.endswith('.acquire'):
            primitive_type = self._infer_primitive_type(callee)
            self.graph.add_sync_primitive(
                function=self.current_function,
                primitive_type=primitive_type,
                operation='acquire',
                lineno=node.lineno
            )
            if self.debug:
                print(f"[SyncPrimitive] {self.current_function} acquires {primitive_type}")
        
        # Lock/RLock/Semaphore.release()
        elif callee.endswith('.release'):
            primitive_type = self._infer_primitive_type(callee)
            self.graph.add_sync_primitive(
                function=self.current_function,
                primitive_type=primitive_type,
                operation='release',
                lineno=node.lineno
            )
            if self.debug:
                print(f"[SyncPrimitive] {self.current_function} releases {primitive_type}")
        
        # Event.wait() / Event.set()
        elif callee.endswith('.wait') or callee.endswith('.set'):
            primitive_type = 'event'
            operation = 'wait' if callee.endswith('.wait') else 'set'
            self.graph.add_sync_primitive(
                function=self.current_function,
                primitive_type=primitive_type,
                operation=operation,
                lineno=node.lineno
            )
        
        # Condition.wait() / Condition.notify()
        elif callee.endswith('.notify') or callee.endswith('.notify_all'):
            self.graph.add_sync_primitive(
                function=self.current_function,
                primitive_type='condition',
                operation='notify',
                lineno=node.lineno
            )
    
    def _infer_primitive_type(self, callee: str) -> str:
        """推断同步原语类型"""
        callee_lower = callee.lower()
        if 'lock' in callee_lower:
            return 'lock'
        elif 'semaphore' in callee_lower:
            return 'semaphore'
        elif 'event' in callee_lower:
            return 'event'
        elif 'condition' in callee_lower:
            return 'condition'
        else:
            return 'unknown'
