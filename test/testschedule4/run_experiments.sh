#!/usr/bin/env bash
# 编译并运行 testschedule4 的 FIFO/LPF，输出到 experiment 目录（时间戳+WORK_SCALE）。
# 用法：
#   1) 直接执行（使用脚本内默认 WORK_SCALE_DEFAULT）
#      sudo bash test/testschedule4/run_experiments.sh
#   2) 覆盖工作量：sudo WORK_SCALE=50000 bash test/testschedule4/run_experiments.sh
# 如需长期固定值，可直接编辑下方 WORK_SCALE_DEFAULT。

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="$ROOT_DIR/bin"
EXP_DIR="$ROOT_DIR/experiment"
mkdir -p "$BIN_DIR" "$EXP_DIR"

FIFO_SRC="$ROOT_DIR/cpu4_thread10_fifo.c"
LPF_SRC="$ROOT_DIR/cpu4_thread10_lpf.c"
FIFO_BIN="$BIN_DIR/cpu4_thread10_fifo4"
LPF_BIN="$BIN_DIR/cpu4_thread10_lpf4"

# 允许在此修改默认工作量（未设置环境变量时使用）
WORK_SCALE_DEFAULT=25000
WS_VALUE="${WORK_SCALE:-$WORK_SCALE_DEFAULT}"

TS="$(date -Iseconds)"
TS_SAFE="${TS//:/-}"
WS_LABEL="${WS_VALUE:-default}"
WS_SAFE="${WS_LABEL//[^A-Za-z0-9._-]/_}"
OUT_FILE="$EXP_DIR/run_results_${TS_SAFE}_ws${WS_SAFE}.txt"

echo "Compiling... (WORK_SCALE=${WS_VALUE:-default})"
gcc -DWORK_SCALE="$WS_VALUE" "$FIFO_SRC" -o "$FIFO_BIN" -lpthread
gcc -DWORK_SCALE="$WS_VALUE" -I"$ROOT_DIR" "$LPF_SRC" -o "$LPF_BIN" -lpthread

echo "Running experiments..."
{
  echo "=== RUN at $TS (WORK_SCALE=${WS_VALUE:-default}) ==="
  echo "=== FIFO run ==="
  "$FIFO_BIN"
  echo
  echo "=== LPF run ==="
  "$LPF_BIN"
} > "$OUT_FILE"

echo "Done. Results saved to $OUT_FILE"
