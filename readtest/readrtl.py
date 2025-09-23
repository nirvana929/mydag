import argparse
import sys
from pathlib import Path
import re
source_code=dict()
symbol_ref = re.compile(r"^.*\(symbol_ref.*\"(?P<target>.*)\".*$")
source_row_str=re.compile(r"^[^:]+:(?P<target>\d+):\d+")
create_flag=0
join_flag=0
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
    if not path.exists() or not path.is_file():
        msg = f"文件路径输入错误：{path}"
        print(msg, file=sys.stderr)          # 明确打印错误信息
        raise FileNotFoundError(msg)         # 抛出异常，程序以非零状态码退出

    # === 正常读取 ===
    with path.open("r", encoding="utf-8") as fp:
            global create_flag, join_flag
            source_row=0
            for line in fp:
              source_row += 1
              match_ref = re.match(symbol_ref, line)
              if match_ref:
                  target = match_ref.group("target")
                  if target=="pthread_create":
                      create_flag=1
                  elif target=="pthread_join":
                      join_flag=1
              if create_flag==1 and not match_ref:
                match_create_row = re.match(source_row_str, line)
                create_row=match_create_row.group("target")
                print("create "+create_row)
                create_flag=0
              if join_flag==1 and not match_ref:
                match_join_row = re.match(source_row_str, line)
                join_row=match_join_row.group("target")
                print("join "+join_row)
                join_flag=0
if __name__ == "__main__":
    main()
