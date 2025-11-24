#!/usr/bin/env bash
set -euo pipefail

# 默认构建目录（包含 compile_commands.json 的目录）
BUILD_DIR="/home/chove/Desktop/mydag/其他文件/PX4-Autopilot/build/px4_sitl_default"

# 命令获取优先级：
# 1) 位置参数（直接粘贴命令）  2) 环境变量 CMD  3) 当前目录的 command.txt 文件
CMD_INPUT=${CMD:-}
if [[ $# -gt 0 ]]; then
  CMD_INPUT="$*"
elif [[ -z "${CMD_INPUT}" && -f "command.txt" ]]; then
  CMD_INPUT="$(cat command.txt)"
fi

if [[ -z "${CMD_INPUT}" ]]; then
  cat <<'EOF'
请提供命令（compile_commands.json 的整条 "command"）：
  方式A：./run_compile_command.sh <命令全文>
  方式B：CMD='<命令全文>' ./run_compile_command.sh
  方式C：在当前目录放置 command.txt，内容为命令全文（含必要的反斜杠），然后执行 ./run_compile_command.sh
EOF
  exit 1
fi

# 处理 compile_commands.json 中的转义（把 \\\" 还原成 \\" 供 shell 使用）
CMD="${CMD_INPUT//\\\\\"/\\\"}"

echo "[info] 使用构建目录: ${BUILD_DIR}"
echo "[info] 即将执行命令:"
echo "${CMD}"

# 使用 Python 的 shlex 解析命令，避免 shell 语法问题
python3 - <<'PY' "${BUILD_DIR}" "${CMD}"
import os, shlex, subprocess, sys

build_dir = sys.argv[1]
cmd = sys.argv[2]
argv = shlex.split(cmd)

# 将常见的 JSON/compile_commands 转义还原，并修正 -D 宏里的转义引号
fixed = []
for arg in argv:
    original = arg
    arg = arg.replace(r'\\"', '"')
    arg = arg.replace(r'\\', '\\')
    if arg.startswith("-D"):
        k, _, v = arg.partition("=")
        if v:
            v = v.replace(r'\"', '"')
            if v.startswith("\\") and v.endswith("\\") and len(v) > 1:
                v = v[1:-1]
            if k == "-DMODULE_NAME":
                v = v.strip('"\\')
                arg = f'{k}="{v}"'
            else:
                arg = f"{k}={v}"
    fixed.append(arg)
argv = fixed

print("[info] 解析后的 argv:")
for i, arg in enumerate(argv):
    print(f"  [{i}]: {arg}")

subprocess.run(argv, cwd=build_dir, check=True)
PY
