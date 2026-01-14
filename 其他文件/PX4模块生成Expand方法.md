# 为 PX4 某个模块生成 `.expand` 文件的方法（GCC `*.expand` Dump）

## 1. 说明与目的

PX4 构建过程中你看到的 `*.233r.expand` 这类文件，通常**不是**“预处理后的源码（`-E` 输出）”，而是 **GCC 在 `expand` 编译阶段的 RTL dump**（由 `-fdump-rtl-expand` 产生）。这类文件更适合做编译器/优化层面的分析（RTL、CFG 等），而不是看纯宏展开后的 C/C++ 文本。

生成 PX4 某个模块的 `.expand`（预处理展开）文件，用于：
- 宏展开审计与条件编译路径确认
- 静态分析/代码阅读时减少宏与包含干扰
- 对比不同构建目标（SITL / FMU）下的差异

## 2. 适用范围

- 适用于完整 PX4 工程仓库：`PX4-Autopilot/`
- 若只有单独的 `modules/` 代码快照（例如仅有 `px4/modules/...`），通常无法直接生成 `.expand`，需要放到完整 `PX4-Autopilot` 构建体系内编译。

## 3. 前置条件

- 已具备 `PX4-Autopilot` 完整仓库
- 本机已安装构建依赖（至少：`cmake`、`ninja`、编译器工具链；以及 PX4 对应平台依赖）
- 推荐在 Linux 环境执行

## 4. 生成构建目录（以 SITL 为例）

在 `PX4-Autopilot/` 目录下二选一：

### 方式 A：使用 PX4 常用命令（推荐）

```bash
make px4_sitl_default
```

### 方式 B：直接使用 CMake + Ninja

```bash
cmake -S . -B build/px4_sitl_default -G Ninja
ninja -C build/px4_sitl_default
```

说明：
- `build/px4_sitl_default` 为示例构建目录名；你也可以用硬件目标对应的构建目录（例如 `build/px4_fmu-v5_default`）。
- `.expand` 的内容会随构建目标、板级配置、Kconfig 开关变化。

## 5. 确认模块对应的 Ninja 目标名（关键步骤）

在模块目录中查看其 CMake 定义：
- 文件路径：`PX4-Autopilot/src/modules/<module>/CMakeLists.txt`
- 找到类似：

```cmake
px4_add_module(
  MODULE modules__<module>
  ...
)
```

其中 `modules__<module>` 就是该模块的构建目标前缀，后续生成 `.expand` 一般使用：
- `modules__<module>.expand`

示例：
- `commander` → 通常为 `modules__commander.expand`
- `ekf2` → 通常为 `modules__ekf2.expand`

## 6. 生成 `.expand`（推荐：对单个源文件生成，如 `EKF2.cpp`）

PX4/Ninja 并不一定提供可直接调用的 `modules__<module>.expand` 目标；更稳定的方法是：
1) 从 `compile_commands.json` 取到该源文件的完整编译命令；
2) 在该命令中加入 `-fdump-rtl-expand`；
3) 在同一个构建目录下重新编译该源文件对应的 `.o`，即可生成 `*.expand` dump 文件。

### 6.1 从 `compile_commands.json` 提取某个源文件的编译命令

以 `EKF2.cpp` 为例，在 `PX4-Autopilot/` 目录执行：

```bash
python3 - <<'PY'
import json, pathlib
p = pathlib.Path('build/px4_sitl_default/compile_commands.json')
data = json.loads(p.read_text())
for e in data:
    if e.get('file','').endswith('src/modules/ekf2/EKF2.cpp'):
        print(e['command'])
        print('DIR', e['directory'])
        break
else:
    raise SystemExit('NOT_FOUND: EKF2.cpp not in compile_commands.json')
PY
```

输出中：
- `DIR .../build/px4_sitl_default` 是应当执行编译命令的目录
- `command` 是原始编译命令（不含 `-fdump-rtl-expand`）

### 6.2 重新编译并生成 `*.expand`

进入上一步的 `DIR` 目录（通常就是 `build/px4_sitl_default`），把编译命令前面加上 `-fdump-rtl-expand`，然后执行。

你可以按下面模板操作（把 `<原始编译命令>` 替换成上一步打印出来的那一行）：

```bash
cd build/px4_sitl_default
<原始编译命令中紧跟在 c++ 后面的参数前插入 -fdump-rtl-expand>
```

示例（只展示关键差异）：把
- `/usr/bin/c++ ... -o ...EKF2.cpp.o -c .../EKF2.cpp`

改为
- `/usr/bin/c++ -fdump-rtl-expand ... -o ...EKF2.cpp.o -c .../EKF2.cpp`

## 7. 定位 `.expand` 文件输出位置

优先方式：
- 直接在构建目录中搜索生成的 `*.expand` 文件

备用方式：在 build 目录里搜索

```bash
find build/px4_sitl_default -name "*.expand" | rg "EKF2\\.cpp|ekf2|modules__ekf2"
```

对于 `EKF2.cpp`，常见落点类似：
- `build/px4_sitl_default/src/modules/ekf2/CMakeFiles/modules__ekf2.dir/EKF2.cpp.<随机后缀>.expand`

## 8. 可选：生成单个源文件的 `.expand`（更细粒度）

本方法本身就是“单源文件”粒度：对哪个源文件加 `-fdump-rtl-expand`，就生成哪个源文件的 `*.expand`。

## 9. 分析时的辅助信息：`compile_commands.json`

构建目录通常会生成：
- `build/px4_sitl_default/compile_commands.json`

用途：
- 查看每个源文件的编译参数、宏定义、包含路径
- 与 `.expand` 结果互相验证（例如宏是否按预期启用）

## 10. 常见问题排查

### 10.1 `compile_commands.json` 里找不到该源文件

原因通常是该文件未被当前 build 目标编译到。

排查步骤：
1. 先确保你已经成功编译过目标（例如 `make px4_sitl_default`）
2. 确认当前 build 目标是否启用了该模块（Kconfig/board config）
3. 重新生成/更新 build 目录后，再查 `compile_commands.json`

### 10.2 `.expand` 内容和预期不一致

优先核对：
- 你选用的构建目标（SITL vs 某个 FMU）
- `Kconfig` / 参数 / board config 是否一致
- `compile_commands.json` 中对应源文件的编译宏与 include 路径

## 11. 补充：如果你要的是“预处理后的源码”（宏展开后的 C/C++ 文本）

如果你的目标是得到**宏展开后的源码文本**（而不是 GCC RTL 的 `*.expand` dump），应使用 `-E`（预处理）：

1) 从 `compile_commands.json` 取到该源文件编译命令
2) 在构建目录下执行（示例模板）：

```bash
cd build/px4_sitl_default
/usr/bin/c++ <同样的 -D/-I 参数> -E -P /abs/path/to/EKF2.cpp > EKF2.i
```

输出的 `EKF2.i` 才是“预处理后的 C++ 文件”，更适合做宏/包含分析。

## 12. 自动化脚本：`autoexpand/generate_expand.py`

仓库里已提供脚本 `autoexpand/generate_expand.py` 用于“一键生成并集中收集 `.expand` 文件”：
- 读取 `compile_commands.json`（可在脚本顶部 `COMPILE_COMMANDS_PATH` 指定）
- 按 `SOURCE_FILE`（推荐）或 `ENTRY_INDEX` 选择一条编译命令
- 自动在编译命令中注入 `-fdump-rtl-expand`
- 在该条记录的 `directory` 目录下执行编译
- 自动把生成的 `*.expand` 复制/移动到 `autoexpand/expand/`
- 若 JSON/构建目录/源文件不存在，会输出原因并跳过（不生成 `.expand`）

使用方式：
1. 打开并编辑：`autoexpand/generate_expand.py` 顶部配置项（至少设置 `SOURCE_FILE` 或 `ENTRY_INDEX`）
2. 运行：

```bash
python3 autoexpand/generate_expand.py
```

输出目录：
- 收集后的 `.expand`：`autoexpand/expand/`
