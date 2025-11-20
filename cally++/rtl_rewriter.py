#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""RTL rewrite pipeline (demangle + optional cleanups)."""

from __future__ import annotations

import dataclasses
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Tuple

from rtl_demangler import demangle_rtl


@dataclasses.dataclass
class RewriteArtifact:
    """记录单个改编步骤产物。"""

    step: str
    path: Path
    stats: Dict[str, str]


class RewriteStep:
    """改编步骤基类。"""

    name = "rewrite-step"

    def run(self, input_path: Path, debug: bool = False) -> Tuple[Path, Dict[str, str]]:
        raise NotImplementedError


class DemangleSymbolsStep(RewriteStep):
    """使用现有 demangle 流程将符号改编为可读形式。"""

    name = "demangle"

    def run(self, input_path: Path, debug: bool = False) -> Tuple[Path, Dict[str, str]]:
        output = demangle_rtl(str(input_path), debug=debug)
        if not output:
            raise RuntimeError("Failed to demangle RTL file")
        out_path = Path(output)
        stats = {
            "input_size_kb": f"{input_path.stat().st_size / 1024:.1f}",
            "output_size_kb": f"{out_path.stat().st_size / 1024:.1f}",
        }
        return out_path, stats


class StripTrailingWhitespaceStep(RewriteStep):
    """
    删除行尾空白以及多余空行，保证 RTL 更易 diff/对比。
    该步骤是轻量示例，展示 rewrite pipeline 的扩展能力。
    """

    name = "trim-whitespace"

    def __init__(self, suffix: str = ".cleaned") -> None:
        self._suffix = suffix

    def run(self, input_path: Path, debug: bool = False) -> Tuple[Path, Dict[str, str]]:
        output_path = input_path.with_suffix(input_path.suffix + self._suffix)
        removed = 0
        lines_total = 0

        with open(input_path, "r", encoding="utf-8", errors="ignore") as src, open(
            output_path, "w", encoding="utf-8"
        ) as dst:
            for line in src:
                lines_total += 1
                trimmed = line.rstrip()
                if trimmed != line.rstrip("\n"):
                    removed += 1
                dst.write(trimmed + "\n")

        stats = {
            "lines": str(lines_total),
            "trimmed_lines": str(removed),
        }
        return output_path, stats


@dataclasses.dataclass
class RewriteResult:
    input_path: Path
    final_path: Path
    artifacts: List[RewriteArtifact]

    def summary(self) -> str:
        parts = []
        for artifact in self.artifacts:
            stats = ", ".join(f"{k}={v}" for k, v in artifact.stats.items())
            parts.append(f"{artifact.step}: {artifact.path.name} ({stats})")
        return "; ".join(parts)


class RTLRewriter:
    """串联多个改编步骤，输出最终 RTL 文件。"""

    def __init__(self, steps: Optional[Iterable[RewriteStep]] = None, debug: bool = False) -> None:
        self.steps = list(steps) if steps else [DemangleSymbolsStep()]
        self.debug = debug

    def rewrite(self, rtl_file: str) -> Optional[RewriteResult]:
        current = Path(rtl_file)
        if not current.exists():
            raise FileNotFoundError(f"RTL file not found: {rtl_file}")

        artifacts: List[RewriteArtifact] = []
        for step in self.steps:
            try:
                next_path, stats = step.run(current, debug=self.debug)
            except Exception as exc:  # pragma: no cover - defensive
                if self.debug:
                    print(f"[rewrite] step '{step.name}' failed: {exc}")
                return None

            artifacts.append(RewriteArtifact(step=step.name, path=next_path, stats=stats))
            current = next_path

        return RewriteResult(input_path=Path(rtl_file), final_path=current, artifacts=artifacts)


def rewrite_rtl(
    input_file: str,
    steps: Optional[Iterable[RewriteStep]] = None,
    debug: bool = False,
) -> Optional[RewriteResult]:
    """便捷函数：执行默认改编（符号去改编）。"""
    rewriter = RTLRewriter(steps=steps, debug=debug)
    return rewriter.rewrite(input_file)


__all__ = [
    "RewriteArtifact",
    "RewriteResult",
    "RewriteStep",
    "DemangleSymbolsStep",
    "StripTrailingWhitespaceStep",
    "RTLRewriter",
    "rewrite_rtl",
]
