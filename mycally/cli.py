from __future__ import annotations

import sys
from typing import List, Optional

from . import legacy


def main(argv: Optional[List[str]] = None) -> int:
    if argv is None:
        argv = sys.argv[1:]
    original_argv = sys.argv[:]
    sys.argv = [original_argv[0]] + argv
    try:
        return legacy.main()
    finally:
        sys.argv = original_argv

