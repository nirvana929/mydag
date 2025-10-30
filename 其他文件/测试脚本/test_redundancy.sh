#!/bin/bash
# 冗余处理机制测试脚本

# 颜色定义
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}mycallypro 冗余处理机制测试${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# 测试文件路径
EXPAND_FILE="mycallypro/源文件/produce3/produce.c.233r.expand"
OUTPUT_BASE="/home/chove/桌面/cally/mycallypro"

if [ ! -f "$EXPAND_FILE" ]; then
    echo -e "${YELLOW}警告：测试文件不存在: $EXPAND_FILE${NC}"
    echo "请修改脚本中的 EXPAND_FILE 路径"
    exit 1
fi

echo -e "${GREEN}测试文件：${NC}$EXPAND_FILE"
echo ""

# 测试1：默认模式
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}测试 1：默认模式（覆盖）${NC}"
echo -e "${BLUE}========================================${NC}"
python3 -m mycallypro "$EXPAND_FILE" \
    --export-txt circle.txt \
    --output-base "$OUTPUT_BASE" \
    --debug 2>&1 | grep -E "\[INFO\]|Successfully"
echo ""
sleep 1

# 测试2：智能模式（应该跳过）
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}测试 2：智能模式（应该跳过）${NC}"
echo -e "${BLUE}========================================${NC}"
python3 -m mycallypro "$EXPAND_FILE" \
    --export-txt circle.txt \
    --output-base "$OUTPUT_BASE" \
    --smart \
    --debug 2>&1 | grep -E "\[SMART\]|\[INFO\]"
echo ""
sleep 1

# 测试3：智能模式 + 强制重新生成
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}测试 3：智能模式 + 强制（应该生成）${NC}"
echo -e "${BLUE}========================================${NC}"
python3 -m mycallypro "$EXPAND_FILE" \
    --export-txt circle.txt \
    --output-base "$OUTPUT_BASE" \
    --smart \
    --force \
    --debug 2>&1 | grep -E "\[INFO\]|Successfully"
echo ""
sleep 1

# 测试4：清理重建模式
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}测试 4：清理重建模式${NC}"
echo -e "${BLUE}========================================${NC}"
python3 -m mycallypro "$EXPAND_FILE" \
    --export-txt circle.txt \
    --output-base "$OUTPUT_BASE" \
    --clean \
    --debug 2>&1 | grep -E "\[CLEAN\]|\[INFO\]"
echo ""

# 验证最终结果
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}最终目录结构验证${NC}"
echo -e "${BLUE}========================================${NC}"

BASE_NAME=$(basename "$EXPAND_FILE" .233r.expand)
if [ -d "$OUTPUT_BASE/配置文件/$BASE_NAME" ]; then
    echo -e "${GREEN}✅ 配置文件目录：${NC}"
    tree -L 1 "$OUTPUT_BASE/配置文件/$BASE_NAME" 2>/dev/null || ls -la "$OUTPUT_BASE/配置文件/$BASE_NAME"
    echo ""
fi

if [ -d "$OUTPUT_BASE/中间结果/$BASE_NAME" ]; then
    echo -e "${GREEN}✅ 中间结果目录：${NC}"
    tree -L 1 "$OUTPUT_BASE/中间结果/$BASE_NAME" 2>/dev/null || ls -la "$OUTPUT_BASE/中间结果/$BASE_NAME"
    echo ""
fi

echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}✅ 所有测试完成！${NC}"
echo -e "${GREEN}========================================${NC}"
