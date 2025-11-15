# Cally++ — 文档索引（双文档机制）

本仓库已采用“双文档机制”：

- `DESIGN.md` — 交互/需求文档（用于记录设计目标、约束、与 GPT 或同事的对话式指令）。
- `ARCHITECTURE.md` — 实现/运行文档（记录代码模块、运行示例、调试与已知问题）。

请先查看这两个文件以了解设计意图与具体运行步骤。

快速开始（最小示例）

```bash
cd /home/chove/Desktop/mydag/cally++
# 假设已有 .expand 文件
python3 generate.py --expand source/<project>/<file>.expand --caller '<ABI>' --output-base .
```

若需从源码生成 `.expand`，请在源码目录中运行带 `-fdump-rtl-expand` 的 g++，然后将 `.expand` 复制到 `source/<project>/` 再运行上面命令。

如果要把其他说明/示例合并到两份文档中，请在 `DESIGN.md` 里写明设计变更点，再按实现把详细命令与路径写入 `ARCHITECTURE.md`。

（旧的多个指导文档如 `CXX_to_Callgraph_Pipeline.md`、`SIMPLIFY_README.md`、`GUI_UPDATE_README.md` 等可作为历史参考；若确认合并，请告知我，我会把内容归档或合并到 `ARCHITECTURE.md`。）
