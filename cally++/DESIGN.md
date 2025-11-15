````markdown
# cally++ 设计文档（交互 / 需求 / GPT 协作）

> 本文档为“逻辑/交互”文档，面向：需求讨论、与 GPT（或同事）决策沟通、功能设计与约束说明。
>
> 注意：每次需求或设计变更，先更新此文件；每次代码实现完成后，请把实现细节与命令写入 `ARCHITECTURE.md`（实现/可运行说明）。

## 目的与范围

- 目标：为 C++ 源码生成函数调用图（基于 GCC RTL expand）并支持可选的简化与线程/锁语义标注。
- 范围：从源码/expand -> 解析 -> 生成 DOT -> 渲染 PNG 的端到端流程，以及 GUI/CLI 的一键体验。
- 非目标：对 IDE 集成、运行时动态分析（除非另行指定）、或替换现有大型工程构建系统。

## 双文档机制说明

- DESIGN.md（本文件）：描述“为什么要这样做”“输入输出是什么”“设计决策/限制/交互示例”。保持简洁、便于 GPT 理解与修改。
- ARCHITECTURE.md：记录“代码如何实现”“具体命令/路径/模块说明/运行步骤/示例结果”。此文件由实现者维护，面向开发者与维护者。

每次 feature 变更流程建议：
1. 在 `DESIGN.md` 更新设计变更（需求、边界、预期输出、测试用例）。
2. 执行实现并在 PR 描述中引用 DESIGN.md 中的相关段落。
3. 实现完成后，将运行命令、配置与实现细节写入 `ARCHITECTURE.md` 并在 PR 中标注验证步骤与结果截图/示例。

## 高阶流程（一行概览）

source (.cpp/.i) -> [g++ -fdump-rtl-expand] -> .expand -> [rtl_filter.py] -> .expand.filtered -> [解析器] -> .dot -> [dot|render_dot.py] -> .png

## 输入 / 输出契约

- 输入：C++ 源文件或 GCC 的 `.expand` 文件（文本）。
- 输出：`config/<project>/<base>.dot`（原始），`config/<project>/<base>_simple.dot`（可选简化），以及 `img/<project>/...png`。
- 错误模式：GCC 在包含非 ASCII 路径时可能无法写出 expand 文件；工具目前通过在源目录执行编译来规避该问题（详见 ARCHITECTURE.md）。

## 关键设计决策与理由

- 目录组织：统一按项目存放（`source/`、`config/`、`img/`），便于查找与版本控制。
- 简化策略：以用户函数与语义节点（线程/锁）为最小保留集，跳过 STL 模板噪声。
- RTL 过滤：在 .expand 中筛选函数头与 call/symbol_ref 行，显著减小后端解析数据量（示例：>90% 行数减少）。
- 用户交互：保留 GUI 中文界面文案（可选本地化），但内部路径与 API使用英文目录名以避免编译器/工具对非 ASCII 路径的兼容性问题。

## 交互示例（用于 GPT）

- 问：如何从 BatterySimulator.cpp 生成调用图？
- 答：在 `DESIGN.md` 写明：先使用工程编译命令增加 `-fdump-rtl-expand` 或用预处理 `.i` 重新编译，得到 `.expand`；将 `.expand` 放到 `source/<base>/`，运行 `python3 generate.py --expand source/<base>/<base>.expand --caller '<ABI>' --output-base .`。

## 变更记录（简短）
- 2025-11-10：引入双文档机制，新增 `DESIGN.md` 与 `ARCHITECTURE.md`（初稿），并把 README 指向两个文档。

````
