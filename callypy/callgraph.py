#!/usr/bin/env python3
from __future__ import annotations

import argparse
import os
import runpy
import sys
import threading
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, Optional, Set, Tuple


@dataclass(frozen=True)
class Node:
    module: str
    qual: str
    file: str

    def label(self) -> str:
        return f"{self.module}.{self.qual}" if self.module else self.qual


class DynamicCallGraph:
    def __init__(self, base_dir: Path) -> None:
        self.base_dir = base_dir.resolve()
        self.edges: Set[Tuple[str, str]] = set()
        self.nodes: Dict[str, Node] = {}
        self._enabled = False

    def _in_scope(self, filename: str) -> bool:
        try:
            p = Path(filename).resolve()
        except Exception:
            return False
        try:
            p.relative_to(self.base_dir)
            return True
        except Exception:
            return False

    def _qual_name(self, frame) -> Tuple[str, str, str]:
        code = frame.f_code
        filename = code.co_filename
        module = frame.f_globals.get("__name__", "")
        func = code.co_name
        # try to derive class when `self` present
        cls = None
        self_obj = frame.f_locals.get("self")
        if self_obj is not None:
            cls = type(self_obj).__name__
        qual = f"{cls}.{func}" if cls else func
        return module, qual, filename

    def _record(self, caller_f, callee_f) -> None:
        cm, cq, cf = self._qual_name(caller_f)
        tm, tq, tf = self._qual_name(callee_f)
        if not (self._in_scope(cf) and self._in_scope(tf)):
            return
        src = f"{cm}.{cq}" if cm else cq
        dst = f"{tm}.{tq}" if tm else tq
        self.nodes.setdefault(src, Node(cm, cq, cf))
        self.nodes.setdefault(dst, Node(tm, tq, tf))
        self.edges.add((src, dst))

    def _prof(self, frame, event, arg):
        if event == "call":
            caller = frame.f_back
            if caller is not None:
                self._record(caller, frame)
        return self._prof

    def start(self):
        if self._enabled:
            return
        self._enabled = True
        sys.setprofile(self._prof)
        threading.setprofile(self._prof)

    def stop(self):
        if not self._enabled:
            return
        sys.setprofile(None)
        threading.setprofile(None)
        self._enabled = False

    def write_dot(self, out: Path, root: Optional[str] = None) -> None:
        out.parent.mkdir(parents=True, exist_ok=True)
        lines = ["strict digraph callgraph {"]
        if root:
            lines.append(f'"{root}" [color=blue, style=filled];')
        for s, t in sorted(self.edges):
            lines.append(f'"{s}" -> "{t}";')
        lines.append("}")
        out.write_text("\n".join(lines), encoding="utf-8")


def _run_target(script: Path, args: Optional[str]) -> None:
    # Provide argv to the script
    sys_argv_backup = sys.argv[:]
    try:
        sys.argv = [str(script)] + (args.split() if args else [])
        runpy.run_path(str(script), run_name="__main__")
    finally:
        sys.argv = sys_argv_backup


def main() -> int:
    parser = argparse.ArgumentParser(description="Dynamic Python callgraph via profiling")
    parser.add_argument("--input", required=True, help="Python script to run")
    parser.add_argument("--output-base", default="callypy", help="Output base directory")
    parser.add_argument("--args", default=None, help="Arguments to pass to target script")
    parser.add_argument("--root", default=None, help="Root function label to highlight, e.g., demo_threads:main")
    args = parser.parse_args()

    script = Path(args.input).resolve()
    base_dir = script.parent
    out_base = Path(args.output_base)
    base_name = script.name
    # store DOT files under: <output-base>/config/<script_name>/
    dot_dir = out_base / "config" / base_name
    dot_path = dot_dir / f"{base_name}.dot"

    cg = DynamicCallGraph(base_dir)
    cg.start()
    try:
        _run_target(script, args.args)
    except SystemExit:
        pass
    finally:
        cg.stop()

    root_label = None
    if args.root:
        mod, _, func = args.root.partition(":")
        root_label = f"{mod}.{func}" if func else args.root
    cg.write_dot(dot_path, root=root_label)
    print(f"DOT written to: {dot_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

