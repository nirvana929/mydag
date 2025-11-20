````markdown
# cally++ 实现与架构说明（实现文档）

本文件记录当前代码实现的细节、运行示例、关键模块和已知问题，供开发者查阅并在实现后更新。

## 项目路径约定

- `source/<project>/` - 存放 `.expand` 或源文件副本（每个项目一个子文件夹）。
- `config/<project>/` - 生成的 DOT 文件与中间产物（`.expand.filtered` 等）。
- `img/<project>/` - 渲染出的 PNG 图片。

## 关键模块

- `rtl_generator.py`：通过在源文件目录或指定工作目录中执行 g++（带 `-fdump-rtl-expand`）生成 `.expand` 文件；处理编译参数与错误信息。
- `rtl_rewriter.py`：统一管理改编步骤（默认包含符号去改编），产出可读的 `.expand.demangled`，后续过滤/解析均基于该结果，日后可扩展其它 rewrite 规则。
- `rtl_filter.py`：对 `.expand` 做轻量过滤，抽取函数头（`;; Function ...`）与 `symbol_ref`/`call` 行，输出 `.expand.filtered` 以显著减小待解析数据量。
- `rtl_parser.py` / `dot_generator.py`：负责从 `.expand` 或 `.expand.filtered` 提取函数与调用边，构建内部 `CallGraph` 并输出 DOT。
- `simplify_dot.py`：C++ 专用简化器，把 STL/ABI 噪声折叠为语义节点（线程/锁），输出 `_simple.dot`。
- `generate.py`：CLI 入口，支持 `--expand`、`--source`、`--caller`、`--full`、`--simplify-cxx`、`--output-base` 等参数，协调上面模块完成端到端流程。
- `gui.py`：Tkinter GUI，提供“选择源文件/expand”、“生成 RTL”、“生成调用图”等按钮，调用 `generate.py` 的内部函数以完成流程。

## 运行示例（快速验证）

1) 已有 `.expand` 的情况：

```bash
cd mydag/cally++
python3 generate.py --expand source/BatterySimulator/BatterySimulator.cpp.233r.expand --caller '_ZN16BatterySimulator3RunEv' --output-base .
```

2) 从源码生成 `.expand` 并解析（如果需要自行编译）：

```bash
# 在源码目录运行，避免非 ASCII 路径问题
cd /path/to/source/dir
g++ -O0 -std=c++17 -fdump-rtl-expand -c BatterySimulator.cpp -o /tmp/tmp.o
# 将生成的 .expand 复制到 cally++/source/BatterySimulator/
cp BatterySimulator.cpp.*.expand /home/chove/Desktop/mydag/cally++/source/BatterySimulator/
cd /home/chove/Desktop/mydag/cally++
python3 generate.py --expand source/BatterySimulator/BatterySimulator.cpp.*.expand --caller '<ABI>' --output-base .
```

## 已知问题与注意事项

- GCC 在尝试写出 expand 到路径中包含非 ASCII 字符（例如中文目录名）时可能失败；解决方法：在源文件目录或一个 ASCII-only 临时目录中执行 g++，然后把 `.expand` 复制到项目 `source/` 下。
- `.expand` 通常很大，建议使用 `rtl_filter.py` 先过滤再解析；过滤后行数常常从数千降到几百，解析速度显著提升。

## 测试与验证

- 单元/集成：`test_rtl_generation.py`（示例测试脚本）用于对 `rtl_generator`+`rtl_filter` 的端到端执行进行快速验证。
- 手动验证：生成 `config/<project>/<base>.dot` 并用 `dot -Tpng` 或 `render_dot.py` 渲染结果到 `img/<project>/`，确认入口节点与预期一致。

## 维护说明

- 新增功能时：先在 `DESIGN.md` 说明设计意图 → 实现 → 在 `ARCHITECTURE.md` 添加实现步骤与示例命令并记录测试结果。
- 建议把历史 debug 快照（`source/<project>/debug/*.json`）保留为参考，但不要依赖这些文件中的旧路径作为运行时输入。

````
