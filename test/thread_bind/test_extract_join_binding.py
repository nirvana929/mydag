#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path

_HERE = Path(__file__).resolve().parent
_ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(_HERE))

from extract_join_binding import extract_pthread_join_bindings, write_bindings_text


class TestExtractJoinBinding(unittest.TestCase):
    def test_main1_expand(self) -> None:
        expand = _ROOT / "mycallyplus" / "配置文件" / "main1" / "main1.c.233r.expand"
        got = extract_pthread_join_bindings(expand)
        want = {
            "pthread_join1": "thread2",
            "pthread_join2": "thread3",
            "pthread_join3": "thread1",
            "pthread_join4": "thread",
        }
        self.assertEqual(want, got)

        with tempfile.TemporaryDirectory() as td:
            out = Path(td) / "main1.join_bind.txt"
            write_bindings_text(got, out)
            self.assertEqual(
                "pthread_join1: thread2\n"
                "pthread_join2: thread3\n"
                "pthread_join3: thread1\n"
                "pthread_join4: thread\n",
                out.read_text(encoding="utf-8"),
            )

    def test_schedule_demo_expand(self) -> None:
        expand = _ROOT / "mycallyplus" / "配置文件" / "schedule_demo" / "schedule_demo.c.233r.expand"
        got = extract_pthread_join_bindings(expand)
        want = {
            "pthread_join1": "th0",
            "pthread_join2": "th1",
            "pthread_join3": "th2",
            "pthread_join4": "th3",
            "pthread_join5": "th4",
        }
        self.assertEqual(want, got)

        with tempfile.TemporaryDirectory() as td:
            out = Path(td) / "schedule_demo.join_bind.txt"
            write_bindings_text(got, out)
            self.assertEqual(
                "pthread_join1: th0\n"
                "pthread_join2: th1\n"
                "pthread_join3: th2\n"
                "pthread_join4: th3\n"
                "pthread_join5: th4\n",
                out.read_text(encoding="utf-8"),
            )


if __name__ == "__main__":
    unittest.main()
