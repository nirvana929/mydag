import argparse
import sys
from pathlib import Path
import re
source_code=dict()
thread_create=re.compile(r"^.*pthread_create\s*\(\s*&?\s*(?P<target>\w+)\s*,[^;]*?\)")
thread_join=re.compile(r"^.*pthread_join\s*\(\s*(?P<target>\w+)\s*,\s*NULL\s*\)")

def main() -> None:
    parser = argparse.ArgumentParser(description="读取指定文件并按行输出（UTF-8 编码）")
    parser.add_argument(
        "--file",
        dest="file",
        required=True,
        metavar="FILE",
        help="要读取的文件路径",
    )

    args = parser.parse_args()

    # === 路径检查：不存在或不是普通文件就报错 ===
    path = Path(args.file).expanduser()
    # if not path.exists() or not path.is_file():
    #     msg = f"文件路径输入错误：{path}"
    #     print(msg, file=sys.stderr)          # 明确打印错误信息
    #     raise FileNotFoundError(msg)         # 抛出异常，程序以非零状态码退出

    # === 正常读取 ===
    with path.open("r", encoding="utf-8") as fp:
            source_row=0
            for line in fp:
              source_row += 1
              match_create = re.match(thread_create, line)
              match_join = re.match(thread_join, line)
              if match_create:
                  target = match_create.group("target")
                  source_code[str(source_row)] = target
                  print(target)
              elif match_join:
                  target = match_join.group("target")
                  source_code[str(source_row)] = target
    print(source_code)
if __name__ == "__main__":
    main()
