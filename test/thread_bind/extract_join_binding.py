#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""从 GCC RTL .expand 中提取 pthread_join 绑定的线程变量名。

目标输出结构：
    pthread_join<序号>: <变量名>

说明：
    - 这里的 <序号> 表示“第几个识别到的 join”（按文件中出现顺序，从 1 开始）。
    - 变量名优先从 `symbol_ref:DI ("<name>")` 提取；其次从 `reg:DI N [ <name>.* ]` 提取。
    - 这是测试/验证用的轻量解析器，不依赖 legacy.py 的实现细节。
"""

from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
import re
from typing import Dict, List, Optional


_PTHREAD_JOIN_CALL_LINE = re.compile(
    r'.*\(call\s+\(mem:QI\s+\(symbol_ref:DI\s+\("pthread_join"\)'
)
_SET_DI_LINE = re.compile(r".*\(set\s+\(reg:DI\s+5\s+di\).*")

_SYMBOL_REF_NAME = re.compile(r'\(symbol_ref:[A-Z]+\s+\("(?P<name>[^"]+)"\)')
_DBG_REG_NAME = re.compile(r"\(reg:DI\s+(?P<regno>\d+)\s+\[\s+(?P<dbg>[^\]]+)\s+\]\)")
_PLAIN_REG = re.compile(r"\(reg:DI\s+(?P<regno>\d+)\b(?!\s+\[)")


def _base_var_name(raw: str) -> str:
    token = raw.strip().split()[0]
    if "." in token:
        token = token.split(".", 1)[0]
    return token


def _gather_chunk(lines: List[str], start: int, *, max_lines: int = 12) -> str:
    """从 start 开始收集若干行，直到遇到 '))' 或达上限。"""
    buf: List[str] = []
    for i in range(start, min(len(lines), start + max_lines)):
        buf.append(lines[i])
        if "))" in lines[i]:
            break
    return "".join(buf)


def _find_prev_set_for_reg(lines: List[str], start: int, regno: int, *, max_back: int) -> Optional[int]:
    needle = f"(set (reg:DI {regno}"
    for j in range(start, max(-1, start - max_back), -1):
        if needle in lines[j]:
            return j
    return None


def _extract_name_from_chunk(chunk: str) -> Optional[str]:
    sym = _SYMBOL_REF_NAME.search(chunk)
    if sym is not None:
        name = sym.group("name")
        # 排除常量池 *.LCx
        if not name.startswith("*.LC"):
            return name

    dbg = _DBG_REG_NAME.search(chunk)
    if dbg is not None:
        return _base_var_name(dbg.group("dbg"))
    return None


def _extract_rhs_regno(chunk: str) -> Optional[int]:
    dbg = _DBG_REG_NAME.search(chunk)
    if dbg is not None:
        return int(dbg.group("regno"))
    plain = _PLAIN_REG.search(chunk)
    if plain is not None:
        return int(plain.group("regno"))
    return None


def _resolve_join_arg_name(lines: List[str], call_index: int, *, max_back: int) -> Optional[str]:
    """从 pthread_join 的 call 行向上追溯 di 的来源，解析线程变量名。"""
    # 1) 先找到离 call 最近的 `(set (reg:DI 5 di) ...)`
    set_di_idx: Optional[int] = None
    for j in range(call_index, max(-1, call_index - max_back), -1):
        if _SET_DI_LINE.match(lines[j]):
            set_di_idx = j
            break
    if set_di_idx is None:
        return None

    chunk = _gather_chunk(lines, set_di_idx)
    name = _extract_name_from_chunk(chunk)
    if name:
        return name

    rhs_regno = _extract_rhs_regno(chunk)
    if rhs_regno is None:
        return None

    # 2) 递归/迭代向上追踪 rhs reg 的定义
    visited: set[int] = set()
    cur_regno = rhs_regno
    cur_start = set_di_idx - 1
    for _ in range(20):
        if cur_regno in visited:
            return None
        visited.add(cur_regno)

        prev_set = _find_prev_set_for_reg(lines, cur_start, cur_regno, max_back=max_back)
        if prev_set is None:
            return None

        prev_chunk = _gather_chunk(lines, prev_set)
        name = _extract_name_from_chunk(prev_chunk)
        if name:
            return name

        next_regno = _extract_rhs_regno(prev_chunk)
        if next_regno is None or next_regno == cur_regno:
            return None
        cur_regno = next_regno
        cur_start = prev_set - 1

    return None


def extract_pthread_join_bindings(expand_path: str | Path, *, max_backtrack_lines: int = 300) -> Dict[str, str]:
    """提取 pthread_join<序号> -> 线程变量名 的映射。"""
    path = Path(expand_path)
    text = path.read_text(encoding="utf-8", errors="replace")
    lines = text.splitlines(keepends=True)

    results: Dict[str, str] = {}
    join_count = 0
    for idx, line in enumerate(lines):
        if _PTHREAD_JOIN_CALL_LINE.match(line) is None:
            continue
        join_count += 1
        var = _resolve_join_arg_name(lines, idx, max_back=max_backtrack_lines) or ""
        results[f"pthread_join{join_count}"] = var

    return results


def write_bindings_text(mapping: Dict[str, str], output_path: str | Path) -> Path:
    """将映射写入文件：每行 `pthread_join<序号>: <变量名>`。"""
    out = Path(output_path)

    def sort_key(k: str) -> int:
        tail = "".join(ch for ch in k if ch.isdigit())
        return int(tail) if tail else 0

    lines: List[str] = []
    for key in sorted(mapping.keys(), key=sort_key):
        lines.append(f"{key}: {mapping[key]}\n")
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text("".join(lines), encoding="utf-8")
    return out


if __name__ == "__main__":
    import argparse
    import json

    ap = argparse.ArgumentParser()
    ap.add_argument("expand", help="GCC RTL .expand file")
    ap.add_argument("--json", action="store_true", help="以 JSON 输出映射")
    ap.add_argument(
        "--out",
        type=str,
        default="",
        help='写入到文件；默认输出到 "<expand>.join_bind.txt"',
    )
    args = ap.parse_args()

    mapping = extract_pthread_join_bindings(args.expand)
    out_path = Path(args.out) if args.out else Path(args.expand).with_suffix(Path(args.expand).suffix + ".join_bind.txt")

    if args.json:
        out_path.parent.mkdir(parents=True, exist_ok=True)
        out_path.write_text(json.dumps(mapping, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    else:
        write_bindings_text(mapping, out_path)

    print(out_path)
