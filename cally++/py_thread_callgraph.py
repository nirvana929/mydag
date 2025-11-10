#!/usr/bin/env python3
"""Python 线程调用图生成器.

静态分析单个 Python 源文件, 抽出函数调用关系、线程创建/等待语义并输出 DOT.
"""
from __future__ import annotations

import argparse
import ast
from collections import defaultdict
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Optional, Set, Tuple


@dataclass
class CallEdge:
    src: str
    dst: str
    kind: str = "call"  # call | thread | join


class CallGraphVisitor(ast.NodeVisitor):
    def __init__(self) -> None:
        self.current_scope: List[str] = []
        self.edges: List[CallEdge] = []
        self.known_functions: Set[str] = set()
        self.thread_class_names: Set[str] = {"threading.Thread", "Thread"}

    # Helpers -------------------------------------------------------------
    def _qualname(self, name: str) -> str:
        stack = ".".join(self.current_scope)
        return f"{stack}.{name}" if stack else name

    def _enter_scope(self, name: str) -> None:
        self.current_scope.append(name)

    def _leave_scope(self) -> None:
        if self.current_scope:
            self.current_scope.pop()

    def _current_func(self) -> str:
        return ".".join(self.current_scope) if self.current_scope else "__main__"

    def _resolve_name(self, node: ast.AST) -> Optional[str]:
        if isinstance(node, ast.Name):
            return node.id
        if isinstance(node, ast.Attribute):
            left = self._resolve_name(node.value)
            if left:
                return f"{left}.{node.attr}"
            return node.attr
        return None

    # Visitor overrides ---------------------------------------------------
    def visit_FunctionDef(self, node: ast.FunctionDef) -> None:
        name = self._qualname(node.name)
        self.known_functions.add(name)
        self._enter_scope(node.name)
        self.generic_visit(node)
        self._leave_scope()

    def visit_AsyncFunctionDef(self, node: ast.AsyncFunctionDef) -> None:  # treat same as sync
        self.visit_FunctionDef(node)  # type: ignore[arg-type]

    def visit_ClassDef(self, node: ast.ClassDef) -> None:
        self._enter_scope(node.name)
        self.generic_visit(node)
        self._leave_scope()

    def visit_Call(self, node: ast.Call) -> None:
        callee = self._resolve_name(node.func)
        caller = self._current_func()
        if callee:
            # join detection
            if callee.endswith(".join"):
                self.edges.append(CallEdge(caller, callee, kind="join"))
            else:
                self.edges.append(CallEdge(caller, callee))

            if self._is_thread_ctor(callee):
                target = self._extract_thread_target(node)
                if target:
                    self.edges.append(CallEdge(caller, target, kind="thread"))
        self.generic_visit(node)

    # Thread helpers ------------------------------------------------------
    def _is_thread_ctor(self, name: str) -> bool:
        if name in self.thread_class_names:
            return True
        return name.endswith(".Thread")

    def _extract_thread_target(self, node: ast.Call) -> Optional[str]:
        # Prefer keyword target=
        for kw in node.keywords:
            if kw.arg == "target" and kw.value is not None:
                return self._resolve_name(kw.value)
        # fallback to first positional argument
        if node.args:
            return self._resolve_name(node.args[0])
        return None


# DOT generation ----------------------------------------------------------
def build_dot(edges: List[CallEdge], keep_nodes: Optional[Set[str]] = None) -> str:
    lines = ["strict digraph callgraph {"]

    # collect nodes
    nodes: Set[str] = set()
    for e in edges:
        nodes.update([e.src, e.dst])
    if keep_nodes:
        nodes |= keep_nodes

    for n in sorted(nodes):
        if n.startswith("__builtins__"):
            continue
        lines.append(f'"{n}";')

    for e in edges:
        style = ""
        if e.kind == "thread":
            style = '[style=dashed, color=blue, label="thread"]'
        elif e.kind == "join":
            style = '[style=dashed, color=red, label="join"]'
        lines.append(f'"{e.src}" -> "{e.dst}" {style};')

    lines.append("}")
    return "\n".join(lines)


def main() -> int:
    parser = argparse.ArgumentParser(description="Python thread callgraph generator")
    parser.add_argument("--input", required=True, help="Python source file")
    parser.add_argument("--output", required=True, help="Output DOT path")
    parser.add_argument("--ignore", action="append", default=[], help="Prefix to ignore (multiple)")
    args = parser.parse_args()

    path = Path(args.input)
    if not path.exists():
        parser.error(f"input not found: {path}")

    tree = ast.parse(path.read_text(encoding="utf-8"))
    visitor = CallGraphVisitor()
    visitor.visit(tree)

    prefixes = tuple(args.ignore)
    filtered_edges = [
        e for e in visitor.edges
        if not e.dst.startswith(prefixes)
        and not e.src.startswith(prefixes)
    ] if prefixes else visitor.edges

    dot = build_dot(filtered_edges)
    Path(args.output).write_text(dot, encoding="utf-8")
    print(f"DOT saved: {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
