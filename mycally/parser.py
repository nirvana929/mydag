from __future__ import annotations

import fileinput
import re
from typing import Iterable, Optional

from .model import CallGraph


class Parser:
    """Drop-in replacement for legacy cally/mycally.py parsing logic."""

    def __init__(self, no_warnings: bool = False, debug_log=None) -> None:
        self._no_warnings = no_warnings
        self._debug_log = debug_log

        self._function_re = re.compile(r"^;; Function (?P<mangle>.*)\s+\((?P<function>\S+)(,.*)?\).*$")
        self._call_re = re.compile(r'^.*\(call.*"(?P<target>.*)".*$')
        self._symbol_ref_re = re.compile(r'^.*\(symbol_ref.*"(?P<target>.*)".*$')

    def parse_files(self, files: Iterable[str]) -> CallGraph:
        graph = CallGraph()
        current_function: Optional[str] = None

        for line in fileinput.input(files):
            header = self._function_re.match(line)
            if header is not None:
                current_function = header.group("function")
                fn = graph.ensure_function(current_function)
                fn.files.add(fileinput.filename())
                continue

            if current_function is None:
                continue

            call_match = self._call_re.match(line)
            if call_match is not None:
                target = call_match.group("target")
                fn = graph.functions[current_function]
                fn.calls.setdefault(target, True)
                fn.call_sequence.append(target)
                continue

            symbol_match = self._symbol_ref_re.match(line)
            if symbol_match is not None:
                target = symbol_match.group("target")
                graph.functions[current_function].refs.setdefault(target, True)

        return graph
