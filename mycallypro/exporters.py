from __future__ import annotations

from pathlib import Path
from typing import Iterable, List, Tuple

from .model import CallGraph


def write_dot(path: Path, dot_str: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(dot_str, encoding="utf-8")


def write_circle_auto(graph: CallGraph, path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    content: List[str] = []
    content.append("互斥量")
    mutex_entries = _collect_mutex_entries(graph)
    content.extend(mutex_entries or [""])
    content.append("")
    content.append("信号量")
    sem_entries = _collect_semaphore_entries(graph)
    content.extend(sem_entries or [""])
    path.write_text("\n".join(content), encoding="utf-8")


def _collect_mutex_entries(graph: CallGraph) -> List[str]:
    idx = 1
    entries: List[str] = []
    stack: List[Tuple[str, str]] = []
    for func in sorted(graph.functions):
        seq = graph.functions[func].call_sequence
        for call in seq:
            if "pthread_mutex_lock" in call:
                stack.append((func, f"MUTEX_{idx}"))
            elif "pthread_mutex_unlock" in call and stack:
                lock_func, var = stack.pop()
                entries.append(f"{lock_func} {var} {idx}")
                idx += 1
    return entries


def _collect_semaphore_entries(graph: CallGraph) -> List[str]:
    idx = 1
    posts: List[Tuple[str, str]] = []
    entries: List[str] = []
    for func in sorted(graph.functions):
        seq = graph.functions[func].call_sequence
        for call in seq:
            if "sem_post" in call:
                posts.append((func, f"SEM_{idx}"))
            elif "sem_wait" in call and posts:
                post_func, var = posts.pop(0)
                entries.append(f"{post_func} {var} {idx}")
                idx += 1
    return entries
