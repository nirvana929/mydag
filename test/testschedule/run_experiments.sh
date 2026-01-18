#!/usr/bin/env bash
# 说明：
# - 自动编译并分别运行 FIFO 版与 LPF 版程序，结果写入 run_results.txt（追加，带时间戳）
# - 可通过环境变量 WORK_SCALE 统一覆盖两份代码的 WORK_SCALE 宏
# - 需要 root 执行（LPF 内部使用 FIFO 优先级）
# 用法：
#   sudo WORK_SCALE=5000 bash test/testschedule/run_experiments.sh

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FIFO_SRC="$ROOT_DIR/fifo/cpu4_thread10_fifo.c"
LPF_SRC="$ROOT_DIR/lpf/cpu4_thread10_lpf.c"
BIN_DIR="$ROOT_DIR/bin"
mkdir -p "$BIN_DIR"
FIFO_BIN="$BIN_DIR/cpu4_thread10_fifo"
LPF_BIN="$BIN_DIR/cpu4_thread10_lpf"
EXP_DIR="$ROOT_DIR/experiment"
mkdir -p "$EXP_DIR"

TS="$(date -Iseconds)"
TS_SAFE="${TS//:/-}"   # Windows 兼容：去掉时间中的冒号
WS_LABEL="${WORK_SCALE:-default}"
# 清理一下文件名中的特殊字符
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
