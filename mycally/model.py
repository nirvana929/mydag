from __future__ import annotations

from dataclasses import dataclass, field
from typing import Dict, List, Optional, Set, Tuple


@dataclass
class Function:
    name: str
    files: Set[str] = field(default_factory=set)
    calls: Dict[str, bool] = field(default_factory=dict)
    refs: Dict[str, bool] = field(default_factory=dict)
    call_sequence: List[str] = field(default_factory=list)
    callee_calls: Dict[str, bool] = field(default_factory=dict)
    callee_refs: Dict[str, bool] = field(default_factory=dict)
    meta: Dict[str, str] = field(default_factory=dict)


@dataclass
class ThreadInfo:
    thread_id: str
    task_function: str
    create_site: str
    join_site: Optional[str] = None
    tail_node: Optional[str] = None


@dataclass
class CallGraph:
    functions: Dict[str, Function] = field(default_factory=dict)
    thread_infos: Dict[str, ThreadInfo] = field(default_factory=dict)
    thread_edges: List[Tuple[str, str]] = field(default_factory=list)
    thread_create_queue: List[str] = field(default_factory=list)

    def ensure_function(self, name: str) -> Function:
        if name not in self.functions:
            self.functions[name] = Function(name=name)
        return self.functions[name]


@dataclass
class RenderOptions:
    exclude: Optional[str] = None
    no_externs: bool = False
    max_depth: int = 0
    reverse_path: bool = False
