# C++ 源码到函数调用图：端到端流程说明（逻辑/交互文档）

> **文档角色**：本文件用于记录 cally++ 的整体需求、流程设计、以及与 GPT 协作时的“该做什么”。若需要了解“代码目前怎么实现、CLI/GUI 怎么用”，请参考 `README.md`（实现文档）。保持两份文档同步更新。

本文详细说明从 C++ 源文件（以 PX4 的 `BatterySimulator.cpp` 为例）到生成函数调用图（DOT/PNG）的完整流程、涉及的文件、关键命令与数据流。

## 1. 产出与路径

- 输入（示例）
  - 源码：`mydag/其他文件/c++文件/BatterySimulator.cpp`
  - 预处理：`mydag/其他文件/c++文件/BatterySimulator/BatterySimulator_full_expand.i`
- 中间/输出
  - RTL：`mydag/cally++/源代码/BatterySimulator/BatterySimulator.cpp.233r.expand`
  - DOT：`mydag/cally++/配置文件/BatterySimulator.cpp/BatterySimulator.cpp.dot`
  - PNG：`mydag/cally++/img/BatterySimulator.cpp_caller.png`

说明：所有生成物都归档在 `mydag/cally++` 下，便于集中查看和复用。

## 2. 目录结构（cally++）

- `源代码/<基名>/`：对应源文件与其派生的 `.i`/`.expand`
- `配置文件/<基名>/`：mycallyplus 导出的 DOT、expand 副本（便于 describe 查看）
- `中间结果/<基名>/`：mycallyplus 的调试/临时文件（`debug/*.dot|*.json` 等）
- `img/`：最终渲染的调用图 PNG
- 工具脚本：
  - `generate.py`：一键生成 `.expand` + DOT + PNG
  - `render_dot.py`：在无 Graphviz 时，用 networkx+matplotlib 渲染 DOT

## 3. 从 C++ 到 RTL（.expand）

GCC/G++ 在 RTL 展开阶段可导出 `.expand`。推荐两种方式：

- 方式 A：复用工程编译命令（最稳妥）
  - 在工程构建目录找到 `compile_commands.json`，定位目标文件的编译命令；在其基础上追加 `-fdump-rtl-expand`，保持其它参数不变。
  - 示例（已执行）：
    - 目录：`其他文件/PX4-Autopilot/build/px4_sitl_default`
    - 命令：`/usr/bin/c++ ... -std=gnu++14 -fdump-rtl-expand -o .../BatterySimulator.cpp.expand.o -c /.../BatterySimulator.cpp`
    - 生成：`.../BatterySimulator.cpp.233r.expand`
  - 然后将 `.expand` 复制到 `cally++/源代码/<基名>/`。

- 方式 B：使用预处理产物 `.i`
  - 先生成 `.i`（`-E`），之后对 `.i` 再编译一次导出 RTL：
    - `g++ -O0 -std=c++17 -x c++ -fdump-rtl-expand -c BatterySimulator_full_expand.i -o tmp.o`
  - 注意：`.i` 必须包含完整的头文件与宏展开，否则编译会失败（PX4 等大型工程需先构建以生成配置头）。

快速一键：
- `python3 mydag/cally++/generate.py --src 其他文件/c++文件/BatterySimulator.cpp --preprocessed 其他文件/c++文件/BatterySimulator/BatterySimulator_full_expand.i --function '_ZN16BatterySimulator3RunEv' --output-base cally++`

## 4. 解析与建图（mycallyplus / mycallypro）

- 入口命令：
  - `python3 -m mycallyplus generate --caller '_ZN16BatterySimulator3RunEv' --output-base cally++ cally++/源代码/BatterySimulator/BatterySimulator.cpp.233r.expand`
- 解析逻辑（关键点）：
  - 函数头匹配：`^;; Function (?P<mangle>.*)\s+\((?P<function>\S+)`。
    - C++ 情况下：`mangle` 捕获“可读名”，`function` 捕获 ABI 符号（`_ZN...`）。
    - 工具内部以 `function`（ABI 符号）作为函数键，因此 `--caller/--callee` 传入 ABI 名最稳妥。
    - 查找 ABI 名方法：`rg -n '^;; Function' *.expand`。
  - 调用与引用：通过正则匹配 RTL 中的 `(call ...)` 和 `(symbol_ref ...)` 构建有向边与符号引用集合。
  - 线程/条件：legacy 流程额外识别 `pthread_create/join` 和 `if/while/switch`，在 DOT 中用虚线节点表达（非 threads-only 模式下）。
- 数据模型（现代接口 `mycallyplus/core/model.py`）：
  - `CallGraph.functions[name]`：记录 `calls`、`refs`、`call_sequence` 等。
  - `builder.build_callee_info(...)`：补全反向索引（被调→调用者）。

## 5. 导出 DOT 与中间产物

- mycallyplus 在 `--output-base cally++` 时：
  - 写入 DOT：`cally++/配置文件/<基名>/<基名>.dot`
  - 复制 `.expand`：`cally++/配置文件/<基名>/<原始.expand>`
  - 调试快照：`cally++/中间结果/<基名>/debug/*.dot|*.json`（保留生成时的上下文、选项、函数表）

示例（Run 入口）：
- `cally++/配置文件/BatterySimulator.cpp/BatterySimulator.cpp.dot`
  - 含有 `"_ZN16BatterySimulator3RunEv" -> "callee"` 的有向边；条件节点用 `[style=dashed]` 标记。

## 6. 渲染 PNG（两种方式）

- Graphviz（有 `dot`）：
  - `dot -Tpng cally++/配置文件/<基名>/<基名>.dot -o cally++/img/<基名>_caller.png`
- Fallback（无 `dot`）：
  - `python3 cally++/render_dot.py cally++/配置文件/<基名>/<基名>.dot -o cally++/img/<基名>_caller.png --root '_ZN16BatterySimulator3RunEv'`

## 7. 数据流总览（文字版）

1) 源码：`BatterySimulator.cpp`
2) 预处理（可选）：`BatterySimulator_full_expand.i`
3) 编译并导出 RTL：`BatterySimulator.cpp.233r.expand`
4) 解析 RTL：提取函数/调用/引用 → 构建 `CallGraph`
5) 生成 DOT：目标入口（caller/callee 模式），可选条件/线程补边
6) 渲染图像：DOT → PNG（Graphviz 或 fallback）

## 8. C++ 专项注意事项

- 名称修饰（mangling）：建议在 CLI 中使用 ABI 符号（`_ZN...`）；从 `.expand` 的 `;; Function` 行获取。
- 内联与优化：`-O0 -fno-inline` 能保留更多直接调用；否则一些调用在 RTL 中不可见。
- 框架插桩：编译器/运行库会插入如 `__stack_chk_fail`、锁操作等，DOT 中可能多于源码中的“显式”调用。
- 预处理完整性：大型工程（如 PX4）必须使用其完整 include 与生成头；否则 `.i`/`.expand` 生成会失败或不完整。

## 9. 复现实例（已执行）

- 生成 RTL（工程命令追加 `-fdump-rtl-expand`）：
  - 来源：`其他文件/PX4-Autopilot/build/px4_sitl_default/`
  - 结果：`.../BatterySimulator.cpp.233r.expand` → 复制至 `cally++/源代码/BatterySimulator/`
- 生成调用图（Run 作为入口）：
  - `python3 -m mycallyplus generate --caller '_ZN16BatterySimulator3RunEv' --output-base cally++ cally++/源代码/BatterySimulator/BatterySimulator.cpp.233r.expand`
  - DOT：`cally++/配置文件/BatterySimulator.cpp/BatterySimulator.cpp.dot`
- 渲染 PNG（fallback 渲染）：
  - `python3 cally++/render_dot.py cally++/配置文件/BatterySimulator.cpp/BatterySimulator.cpp.dot -o cally++/img/BatterySimulator.cpp_caller.png --root '_ZN16BatterySimulator3RunEv'`

## 10. 差异与对账（为何“源码调用数”≠“DOT 出边数”）

- 源码中统计到的调用（`Run()` 内）包含内联/模板/成员访问形式；在 RTL 中被优化/折叠的不再产生 `(call ...)`，因此 DOT 出边更少。
- DOT 中出现的运行库/插桩（如 `pthread_mutex_*`、`__stack_chk_fail`）可能在源码中并非显式调用。
- 解决建议：对账时以 `.expand` 中 `;; Function ...`/`(call ...)` 的真实调用为准；必要时降低优化级别或禁用内联以提高可见性。

---

如需将此流程扩展到多源文件/多入口函数，直接将多个 `.expand` 一并传给 `mycallyplus generate`，并为不同入口重复渲染步骤即可。

## 11. 插桩与对账（深入版）

本节聚焦两个常见疑问：
- “插桩”从何而来、在 RTL 与 DOT 中如何呈现、如何识别与过滤？
- 如何对账：让“源码中的调用预期”与“DOT 出边/RTL 记录”一致、可解释、可复现？

### 11.1 插桩来源与在图中的表现

- 编译器防护/运行时支持
  - 栈保护/栈溢出检测：`__stack_chk_fail`
  - 异常/语言运行时：`__gxx_personality_v0`、`__cxa_*`（可能在其他函数中出现）
  - 内存/内建：`memcpy`、`memset`、`__atomic*` 等（按需）
- 线程与同步（库级 API）
  - 互斥锁：`pthread_mutex_lock` / `pthread_mutex_unlock`
  - 信号量：`sem_wait` / `sem_post`
  - 线程：`pthread_create` / `pthread_join`
- 框架/工程级“插桩”
  - PX4 性能埋点：`perf_begin` / `perf_end`
  - 日志/时间：`px4_log_*`、`hrt_absolute_time`
  - 中间件调用：`uORB::*`（如 `SubscriptionInterval::updated/copy`、`Manager::orb_data_copy` 等）

在 DOT 中：
- 工具会将“条件节点”和“外部/叶子调用”标记为 `[style=dashed]`，因此你会看到大量虚线节点；这既包含业务调用（如 `uORB::*`），也包含插桩调用（如 `__stack_chk_fail`）。
- 入口函数节点会用 `[color=blue, style=filled]` 高亮（示例：`"_ZN16BatterySimulator3RunEv"`）。
- `threads_only` 模式会抑制条件节点（只保留普通调用），便于聚焦线程边。

识别插桩的一个稳妥依据是 RTL：在 `.233r.expand` 中，插桩与普通调用都以 `(call_insn ... (symbol_ref "目标名") ...)` 形式出现；因此“是否为插桩”更多靠“名称类别”判断，而不是结构差异。

### 11.2 BatterySimulator::Run 实例：插桩清单（来自 RTL）

目标函数头位置：
- `mydag/cally++/源代码/BatterySimulator/BatterySimulator.cpp.233r.expand` 中的
  `;; Function BatterySimulator::Run (_ZN16BatterySimulator3RunEv, ...)`

在该函数体内提取所有具名调用目标（按 `symbol_ref` 聚合）：

```bash
# 统计 BatterySimulator::Run 的具名调用目标及出现次数
file=mydag/cally++/源代码/BatterySimulator/BatterySimulator.cpp.233r.expand
start=$(rg -n '^;; Function BatterySimulator::Run \(_ZN16BatterySimulator3RunEv' "$file" | cut -d: -f1)
end=$(rg -n '^;; Function ' "$file" | awk -v s=$start -F: '$1>s{print $1; exit}')
sed -n "${start},${end}p" "$file" \
 | rg -o 'symbol_ref:[^\"]+"([^"]+)' \
 | sed 's/.*"//' | sort | uniq -c | sort -nr
```

示例输出要点（已验证）：
- 互斥锁：`pthread_mutex_lock`、`pthread_mutex_unlock`（各 2 次）
- 性能埋点：`perf_begin`、`perf_end`（各 2 次）
- 栈保护：`__stack_chk_fail`（2 次）
- 时间：`hrt_absolute_time`（2 次）
- 框架调用：`uORB::SubscriptionInterval::{updated,copy}`、`uORB::Manager::{orb_data_copy,updates_available}`、`uORB::Subscription::subscribe` 等
- 业务逻辑：`BatterySimulator::{updateCommands, updateVoltage, updateCurrent, updateAndPublishBatteryStatus}`
- 其它：`px4_modules_mutex`（作为全局变量的 `symbol_ref` 亦会出现）

这些目标在 DOT 中也都有对应出边（虚线/普通），因此 DOT 是 RTL 的“投影”。差异主要来自“未具名的间接调用”（如虚函数/函数指针）和工具的筛选选项。

### 11.3 对账方法论（从源码预期到 RTL/DOT 确认）

建议用 `.expand` 作为“黄金对账账本”，步骤如下：

1) 锁定入口函数（获取 mangled/ABI 名）
- 在 `.expand` 中查找函数头，确认 ABI 名：
  - `rg -n '^;; Function .*\(_ZN16BatterySimulator3RunEv' mydag/cally++/源代码/BatterySimulator/BatterySimulator.cpp.233r.expand`
- CLI 里尽量用 ABI 名传参：`--caller '_ZN16BatterySimulator3RunEv'`

2) 列出函数体的具名调用（真实发生的 `(call ...)`）
- 参照 11.2 的统计命令，得到“应计入的调用目标与次数”。
- 注意：虚表/函数指针的“间接调用”在 RTL 中可能是 `(call (mem:QI (reg ...))`，无 `symbol_ref`，因此不会出现在以上清单，DOT 也无法指向具体函数。

3) 与 DOT 对账（边集一致性）
- 打开 `mydag/cally++/配置文件/BatterySimulator.cpp/BatterySimulator.cpp.dot`
- 验证每一个具名 `symbol_ref` 目标在 DOT 中存在一条从入口指向它的边；入口节点名称应为 ABI 名（蓝底）。
- 如果 DOT 出边比“源码直观阅读”多：多出者通常为插桩（`pthread_*`、`perf_*`、`__stack_chk_fail` 等）或框架调用（`uORB::*`）。
- 如果 DOT 出边比 RTL 较少：检查是否使用了 `--exclude`、`--no-externs`、或深度限制；也留意“间接调用”不会有具名边。

4) 解释“源码调用数 ≠ DOT 出边数”的常见原因
- 内联与优化：被内联的调用在 RTL 中不一定产生 `(call)`；建议 `-O0 -fno-inline` 提高可见性。
- 模板/重载：会生成多个实例化目标，DOT 中是多节点；源码里可能只看到一个模板调用。
- 虚函数/函数指针：RTL 常以寄存器加载的间接调用呈现，DOT 无法具名连边。
- 编译器/框架插桩：`__stack_chk_fail`、`perf_*`、`pthread_*`、日志/时间函数等在源码不一定显式出现。

### 11.4 过滤与聚焦（对账时的实操建议）

- 过滤插桩（保留业务调用）
  - 使用正则排除：`--exclude '(pthread_|perf_|__stack_chk_fail|^mem(set|cpy)$|hrt_absolute_time)'`
  - 或隐藏外部：`--no-externs`（不显示未在 RTL 中具名定义的外部节点）
- 只看线程相关：`--threads-only`（抑制 if/while/switch 条件节点，便于对账线程边）
- 控制规模：`--max-depth N`（如在“callee”方向分析）

注意：如果你要为 `circle.txt` 抽取同步原语（互斥量/信号量），请不要过滤 `pthread_mutex_*` / `sem_*`，它们正是同步对账的依据。`exporters.py` 会读取 `call_sequence` 中的这些调用，并尝试绑定到源码行号与变量名。

### 11.5 快速对账脚本（可拷贝使用）

```bash
# 以 BatterySimulator::Run 为例，输出三列：计数  目标名  DOT中是否出现
EXP=mydag/cally++/源代码/BatterySimulator/BatterySimulator.cpp.233r.expand
DOT=mydag/cally++/配置文件/BatterySimulator.cpp/BatterySimulator.cpp.dot
START=$(rg -n '^;; Function BatterySimulator::Run \(_ZN16BatterySimulator3RunEv' "$EXP" | cut -d: -f1)
END=$(rg -n '^;; Function ' "$EXP" | awk -v s=$START -F: '$1>s{print $1; exit}')
SYMS=$(sed -n "${START},${END}p" "$EXP" | rg -o 'symbol_ref:[^\"]+"([^"]+)' | sed 's/.*"//' | sort | uniq -c)

while read -r CNT NAME; do
  IN_DOT=$(rg -q "\"$NAME\"" "$DOT" && echo yes || echo no)
  printf "%3s  %-60s  %s\n" "$CNT" "$NAME" "$IN_DOT"
done <<EOF
$SYMS
EOF
```

这能直观展示“RTL 具名调用目标”是否都被 DOT 呈现；若某些为 `no`，通常因为被 `--exclude/--no-externs` 过滤，或属于“间接调用”（无具名目标）。

### 11.6 小结（实务要点）

- 对账以 `.expand` 为准；DOT 是经过筛选/样式化的可视化投影。
- 插桩不是“噪声”，很多用于并发/安全/诊断；对账时可按需过滤，但做同步/线程分析时要保留。
- C++ 语义特性（模板/多态/内联）导致“源码直觉”与“编译后事实”存在差异；必要时用 `-O0 -fno-inline`，并结合 ABI 符号名进行精准定位。
