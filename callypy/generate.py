#!/usr/bin/env python3
from __future__ import annotations

import argparse
import shutil
import subprocess
from pathlib import Path


def run(cmd: list[str], cwd: Path | None = None, check: bool = True) -> int:
    print("$", " ".join(cmd))
    p = subprocess.run(cmd, cwd=str(cwd) if cwd else None)
    if check and p.returncode != 0:
        raise SystemExit(p.returncode)
    return p.returncode


def ensure_dirs(root: Path, base_name: str) -> tuple[Path, Path, Path]:
    # project layout: <root>/source/, <root>/config/<project>/, <root>/img/
    src_dir = root / "source"
    cfg_dir = root / "config" / base_name
    img_dir = root / "img"
    for d in (src_dir, cfg_dir, img_dir):
        d.mkdir(parents=True, exist_ok=True)
    return src_dir, cfg_dir, img_dir


def _collect_inputs(repo: Path, single: str | None, inputs: list[str] | None, directory: str | None, glob: str | None) -> list[Path]:
    files: list[Path] = []
    if inputs:
        files.extend([ (repo / p).resolve() for p in inputs ])
    if single:
        files.append((repo / single).resolve())
    if directory:
        base = (repo / directory).resolve()
        pattern = glob or "*.py"
        files.extend(sorted(base.rglob(pattern)))
    # de-dup and keep order
    seen = set()
    uniq: list[Path] = []
    for p in files:
        if p not in seen and p.exists():
            uniq.append(p)
            seen.add(p)
    return uniq


def main() -> int:
    ap = argparse.ArgumentParser(description="Generate Python callgraph demo (dynamic)")
    ap.add_argument("--input", default=None, help="Single script path")
    ap.add_argument("--inputs", nargs="*", default=None, help="Multiple script paths")
    ap.add_argument("--dir", default=None, help="Directory to scan for scripts")
    ap.add_argument("--glob", default="*.py", help="Glob under --dir, default *.py")
    ap.add_argument("--args", default="--loops 3", help="Args passed to each script")
    ap.add_argument("--root", default=None, help="Root label <module>:<function> for highlight; if omitted, infer from filename")
    args = ap.parse_args()

    repo = Path(__file__).resolve().parents[1]
    base_dir = repo / "callypy"
    base_dir.mkdir(parents=True, exist_ok=True)

    files = _collect_inputs(repo, args.input, args.inputs, args.dir, args.glob)
    if not files:
        # fallback to built-in demo under the new source/ layout
        files = [ (repo / "callypy" / "source" / "demo_threads.py").resolve() ]

    for input_path in files:
        base_name = input_path.name
        _, cfg_dir, img_dir = ensure_dirs(base_dir, base_name)

        root_label = args.root
        if not root_label:
            mod = Path(base_name).stem
            root_label = f"{mod}:main"

        # 1) run dynamic callgraph profiler
        dot_path = cfg_dir / f"{base_name}.dot"
        run([
            "python3", str(repo / "callypy" / "callgraph.py"),
            "--input", str(input_path),
            "--output-base", str(base_dir),
            "--args", args.args,
            "--root", root_label,
        ])

        # 2) render to PNG via fallback renderer
        png_out = img_dir / f"{base_name}_caller.png"
        run([
            "python3", str(repo / "callypy" / "render_dot.py"),
            str(dot_path),
            "-o", str(png_out),
            "--root", root_label.replace(":", "."),
        ])

        print(f"DOT: {dot_path}")
        print(f"PNG: {png_out}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
