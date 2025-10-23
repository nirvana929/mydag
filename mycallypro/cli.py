from __future__ import annotations

"""命令行入口（兼容模式）。

说明：为了与 `cally/mycally.py` 保持完全一致的行为，这里将
参数转发给 `legacy.main()` 执行，输出 DOT 至 stdout。
"""

import sys
from typing import List, Optional

from . import legacy


def main(argv: Optional[List[str]] = None) -> int:
    """运行 legacy CLI。

    - argv: 可选参数列表；缺省使用 sys.argv[1:]
    """
    if argv is None:
        argv = sys.argv[1:]
    original_argv = sys.argv[:]
    sys.argv = [original_argv[0]] + argv
    try:
        return legacy.main()
    finally:
        sys.argv = original_argv
