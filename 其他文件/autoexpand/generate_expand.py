#!/usr/bin/env python3
from __future__ import annotations

import json
import os
import shlex
import shutil
import subprocess
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Any


# =========================
# User-configurable options
# =========================

# Path to compile commands JSON.
# Typical PX4 location:
#   ../PX4-Autopilot/build/px4_sitl_default/compile_commands.json
COMPILE_COMMANDS_PATH = Path(__file__).resolve().parent.parent / "PX4-Autopilot" / "build" / "px4_sitl_default" / "compile_commands.json"

# Select which entry to run.
# Preferred: set SOURCE_FILE exactly as it appears in compile_commands.json ("file" field).
# Fallback: set ENTRY_INDEX (0-based) if you still want index-based selection.
SOURCE_FILE: str | None = "/home/chove/Desktop/mydag/其他文件/PX4-Autopilot/platforms/common/px4_work_queue/WorkQueueManager.cpp"
ENTRY_INDEX: int | None = None

# Where to collect generated *.expand files (created if missing).
OUTPUT_DIR = Path(__file__).resolve().parent / "expand"

# If true, copy the generated *.expand into OUTPUT_DIR (keeps original in build dir).
# If false, move it (removes from build dir).
COPY_INSTEAD_OF_MOVE = True


@dataclass(frozen=True)
class CompileCommand:
    directory: Path
    command: str
    file: Path


def _die(message: str, exit_code: int = 1) -> None:
    print(message, file=sys.stderr)
    raise SystemExit(exit_code)


def _load_compile_commands(path: Path) -> list[dict[str, Any]]:
    if not path.exists():
        _die(f"[autoexpand] JSON not found: {path}")

    if path.stat().st_size == 0:
        _die(f"[autoexpand] JSON is empty, skip generating expand: {path}")

    try:
        data = json.loads(path.read_text(encoding="utf-8"))
    except json.JSONDecodeError as e:
        _die(f"[autoexpand] Invalid JSON: {path}\n{e}")

    if not isinstance(data, list):
        _die(f"[autoexpand] Unexpected JSON format (expected list): {path}")

    return data


def _pick_entry(data: list[dict[str, Any]], index: int) -> CompileCommand:
    if index < 0 or index >= len(data):
        _die(f"[autoexpand] ENTRY_INDEX out of range: {index} (0..{len(data)-1})")

    entry = data[index]
    if not isinstance(entry, dict):
        _die(f"[autoexpand] Entry at index {index} is not an object")

    directory = entry.get("directory")
    command = entry.get("command")
    file_ = entry.get("file")

    if not directory or not command or not file_:
        _die(f"[autoexpand] Entry missing required fields at index {index}: {entry}")

    directory_path = Path(directory)
    file_path = Path(file_)

    if not directory_path.exists():
        _die(f"[autoexpand] Build directory does not exist, skip: {directory_path}")

    if not file_path.exists():
        _die(f"[autoexpand] Source file does not exist, skip: {file_path}")

    return CompileCommand(directory=directory_path, command=str(command), file=file_path)


def _pick_entry_by_file(data: list[dict[str, Any]], source_file: str) -> CompileCommand:
    matches: list[dict[str, Any]] = []
    for entry in data:
        if not isinstance(entry, dict):
            continue
        if entry.get("file") == source_file:
            matches.append(entry)

    if not matches:
        _die(f"[autoexpand] No entry matched SOURCE_FILE, skip: {source_file}")

    if len(matches) > 1:
        print(f"[autoexpand] Warning: {len(matches)} entries matched SOURCE_FILE; using the first one.", file=sys.stderr)

    selected = matches[0]
    directory = selected.get("directory")
    command = selected.get("command")
    file_ = selected.get("file")

    if not directory or not command or not file_:
        _die(f"[autoexpand] Matched entry missing required fields: {selected}")

    directory_path = Path(directory)
    file_path = Path(file_)

    if not directory_path.exists():
        _die(f"[autoexpand] Build directory does not exist, skip: {directory_path}")

    if not file_path.exists():
        _die(f"[autoexpand] Source file does not exist, skip: {file_path}")

    return CompileCommand(directory=directory_path, command=str(command), file=file_path)


def _inject_fdump_rtl_expand(command: str) -> list[str]:
    args = shlex.split(command)
    if not args:
        _die("[autoexpand] Empty command")

    if "-fdump-rtl-expand" in args:
        return args

    compiler_idx = 0
    for i, token in enumerate(args[:5]):
        name = Path(token).name
        if name in {"c++", "g++", "clang++"} or name.endswith("c++") or name.endswith("g++"):
            compiler_idx = i
            break

    args.insert(compiler_idx + 1, "-fdump-rtl-expand")
    return args


def _find_generated_expand_file(command_args: list[str], cwd: Path, source_file: Path) -> Path | None:
    out_path: Path | None = None
    if "-o" in command_args:
        try:
            out_path = Path(command_args[command_args.index("-o") + 1])
        except (ValueError, IndexError):
            out_path = None

    search_dir = (cwd / out_path).parent if out_path is not None else cwd
    if not search_dir.exists():
        search_dir = cwd

    stem = source_file.name
    candidates = list(search_dir.glob(f"{stem}.*.expand"))
    if not candidates:
        # Some toolchains may use different naming; fall back to any *.expand in dir.
        candidates = list(search_dir.glob("*.expand"))

    if not candidates:
        return None

    candidates.sort(key=lambda p: p.stat().st_mtime, reverse=True)
    return candidates[0]


def main() -> None:
    data = _load_compile_commands(COMPILE_COMMANDS_PATH)
    if SOURCE_FILE is not None:
        entry = _pick_entry_by_file(data, SOURCE_FILE)
        selection_label = f"SOURCE_FILE={SOURCE_FILE}"
    else:
        if ENTRY_INDEX is None:
            _die("[autoexpand] Set either SOURCE_FILE or ENTRY_INDEX")
        entry = _pick_entry(data, ENTRY_INDEX)
        selection_label = f"ENTRY_INDEX={ENTRY_INDEX}"

    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

    cmd_args = _inject_fdump_rtl_expand(entry.command)
    print(f"[autoexpand] Running {selection_label} in: {entry.directory}")
    print(f"[autoexpand] Source: {entry.file}")

    result = subprocess.run(cmd_args, cwd=str(entry.directory), text=True)
    if result.returncode != 0:
        _die(f"[autoexpand] Compile failed with exit code: {result.returncode}", exit_code=result.returncode)

    generated = _find_generated_expand_file(cmd_args, cwd=entry.directory, source_file=entry.file)
    if generated is None or not generated.exists():
        _die("[autoexpand] Compile succeeded but no *.expand file was found.")

    dest = OUTPUT_DIR / generated.name
    if COPY_INSTEAD_OF_MOVE:
        shutil.copy2(generated, dest)
        action = "Copied"
    else:
        shutil.move(str(generated), str(dest))
        action = "Moved"

    print(f"[autoexpand] {action} expand to: {dest}")
    print(f"[autoexpand] Original expand: {generated}")


if __name__ == "__main__":
    # Avoid Python writing .pyc files into the repo.
    os.environ.setdefault("PYTHONDONTWRITEBYTECODE", "1")
    main()
