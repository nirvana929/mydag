#!/usr/bin/env bash
# 编译并运行 testschedule3 的 FIFO/LPF，对照输出到 experiment 目录，文件名带时间戳和 WORK_SCALE。
# 用法：sudo WORK_SCALE=10000 bash test/testschedule3/run_experiments.sh

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="$ROOT_DIR/bin"
EXP_DIR="$ROOT_DIR/experiment"
mkdir -p "$BIN_DIR" "$EXP_DIR"

FIFO_SRC="$ROOT_DIR/cpu4_thread10_fifo.c"
LPF_SRC="$ROOT_DIR/cpu4_thread10_lpf.c"
FIFO_BIN="$BIN_DIR/cpu4_thread10_fifo3"
LPF_BIN="$BIN_DIR/cpu4_thread10_lpf3"

TS="$(date -Iseconds)"
TS_SAFE="${TS//:/-}"
WS_LABEL="${WORK_SCALE:-default}"
WS_SAFE="${WS_LABEL//[^A-Za-z0-9._-]/_}"
OUT_FILE="$EXP_DIR/run_results_${TS_SAFE}_ws${WS_SAFE}.txt"

echo "Compiling... (WORK_SCALE=${WORK_SCALE:-default})"
if [[ -n "${WORK_SCALE-}" ]]; then
  gcc -DWORK_SCALE="$WORK_SCALE" "$FIFO_SRC" -o "$FIFO_BIN" -lpthread
  gcc -DWORK_SCALE="$WORK_SCALE" "$LPF_SRC" -o "$LPF_BIN" -lpthread
else
  gcc "$FIFO_SRC" -o "$FIFO_BIN" -lpthread
  gcc "$LPF_SRC" -o "$LPF_BIN" -lpthread
fi

echo "Running experiments..."
{
  echo "=== RUN at $TS (WORK_SCALE=${WORK_SCALE:-default}) ==="
  echo "=== FIFO run ==="
  "$FIFO_BIN"
  echo
  echo "=== LPF run ==="
  "$LPF_BIN"
} > "$OUT_FILE"

echo "Done. Results saved to $OUT_FILE"
