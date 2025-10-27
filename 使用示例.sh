#!/bin/bash
# mycallypro集成使用示例

# 设置颜色输出
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}mycallypro + dag_describe 集成演示${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# 示例1：基本用法
echo -e "${GREEN}示例1: 基本用法 - 生成DOT和txt配置${NC}"
echo "命令："
echo "  python3 -m mycallypro input.expand \\"
echo "    --export-txt output/circle.txt \\"
echo "    --output-base output/"
echo ""

# 示例2：包含源文件
echo -e "${GREEN}示例2: 包含源文件信息${NC}"
echo "命令："
echo "  python3 -m mycallypro input.expand \\"
echo "    --export-txt output/circle.txt \\"
echo "    --source-file input.c \\"
echo "    --output-base output/"
echo ""

# 示例3：实际测试
echo -e "${GREEN}示例3: 实际测试（使用produce5示例）${NC}"
EXPAND_FILE="mycallypro/中间结果文件/produce5/main.c.233r.expand"
OUTPUT_BASE="demo_output"

if [ -f "$EXPAND_FILE" ]; then
    echo "运行命令..."
    python3 -m mycallypro "$EXPAND_FILE" \
        --export-txt "$OUTPUT_BASE/circle.txt" \
        --output-base "$OUTPUT_BASE" \
        --debug
    
    echo ""
    echo -e "${GREEN}✅ 完成！生成的文件：${NC}"
    echo "  配置文件："
    ls -lh "$OUTPUT_BASE"/配置文件/*/dag.dot 2>/dev/null || echo "    (未生成)"
    echo "  TXT文件："
    ls -lh "$OUTPUT_BASE"/circle.txt 2>/dev/null || echo "    (未生成)"
    echo "  中间结果："
    ls -lh "$OUTPUT_BASE"/中间结果/*/debug/*.json 2>/dev/null | head -3 || echo "    (未生成)"
    
    echo ""
    echo -e "${BLUE}现在可以使用dag_describe读取配置文件：${NC}"
    echo "  cd test && python3 ../cally/dag_describe.py"
    echo "  然后选择配置文件夹: $OUTPUT_BASE/配置文件/main.c/"
else
    echo "❌ 测试文件不存在: $EXPAND_FILE"
    echo "请先确保有可用的expand文件"
fi

echo ""
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}完整使用流程：${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""
echo "1. 编译源代码生成expand文件："
echo "   gcc -fdump-rtl-expand -g main.c -o main"
echo ""
echo "2. 运行mycallypro生成配置："
echo "   python3 -m mycallypro main.c.233r.expand \\"
echo "     --export-txt config/circle.txt \\"
echo "     --output-base config/"
echo ""
echo "3. 使用dag_describe可视化："
echo "   cd test && python3 ../cally/dag_describe.py"
echo "   选择：config/配置文件/<basename>/"
echo ""
