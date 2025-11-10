#!/usr/bin/env python3
"""调用图数据结构

存储 Python 函数定义和调用关系
"""

from typing import Dict, Set, List, Optional
from dataclasses import dataclass, field


@dataclass
class Function:
    """函数信息"""
    name: str  # 完全限定名，如 "MyClass.method"
    calls: Set[str] = field(default_factory=set)  # 调用的函数
    call_sequence: List[str] = field(default_factory=list)  # 调用序列（保持顺序）
    defined_in: Optional[str] = None  # 定义所在文件
    lineno: int = 0  # 定义行号
    is_method: bool = False  # 是否为类方法
    class_name: Optional[str] = None  # 所属类名
    is_async: bool = False  # 是否为异步函数
    decorators: List[str] = field(default_factory=list)  # 装饰器列表


@dataclass
class ThreadCreation:
    """线程创建信息"""
    creator: str  # 创建线程的函数
    target: str  # 线程目标函数
    thread_type: str  # 'Thread', 'Pool', 'Process'
    lineno: int = 0  # 创建位置


@dataclass
class SyncPrimitive:
    """同步原语调用"""
    function: str  # 调用同步原语的函数
    primitive_type: str  # 'lock', 'semaphore', 'event', 'condition'
    operation: str  # 'acquire', 'release', 'wait', 'set', etc.
    lineno: int = 0


class CallGraph:
    """调用图"""
    
    def __init__(self):
        self.functions: Dict[str, Function] = {}
        self.imports: Dict[str, str] = {}  # alias -> module.name
        self.thread_creations: List[ThreadCreation] = []
        self.sync_primitives: List[SyncPrimitive] = []
    
    def ensure_function(self, name: str) -> Function:
        """确保函数存在，不存在则创建"""
        if name not in self.functions:
            self.functions[name] = Function(name=name)
        return self.functions[name]
    
    def add_function(self, func: Function):
        """添加函数"""
        self.functions[func.name] = func
    
    def add_call(self, caller: str, callee: str):
        """添加函数调用关系"""
        func = self.ensure_function(caller)
        func.calls.add(callee)
        if callee not in func.call_sequence:
            func.call_sequence.append(callee)
        
        # 确保被调用函数也存在（可能是外部函数）
        self.ensure_function(callee)
    
    def add_import(self, alias: str, module_path: str):
        """添加导入信息"""
        self.imports[alias] = module_path
    
    def add_thread_creation(self, creator: str, target: str, thread_type: str, lineno: int = 0):
        """添加线程创建"""
        self.thread_creations.append(ThreadCreation(
            creator=creator,
            target=target,
            thread_type=thread_type,
            lineno=lineno
        ))
    
    def add_sync_primitive(self, function: str, primitive_type: str, operation: str, lineno: int = 0):
        """添加同步原语调用"""
        self.sync_primitives.append(SyncPrimitive(
            function=function,
            primitive_type=primitive_type,
            operation=operation,
            lineno=lineno
        ))
    
    def get_external_functions(self) -> Set[str]:
        """获取外部函数（被调用但未定义）"""
        all_called = set()
        for func in self.functions.values():
            all_called.update(func.calls)
        
        defined = set(self.functions.keys())
        return all_called - defined
    
    def get_thread_entry_points(self) -> Set[str]:
        """获取线程入口函数"""
        return {tc.target for tc in self.thread_creations}
    
    def __str__(self) -> str:
        return f"CallGraph(functions={len(self.functions)}, threads={len(self.thread_creations)})"
