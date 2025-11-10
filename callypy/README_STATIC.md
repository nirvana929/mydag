# CallyPy Static - Python 线程调用图生成器（实现说明）

> **文档角色**：
> - `DESIGN.md` = 逻辑/交互文档，记录需求、设计、与 GPT 协作的指令。
> - `README_STATIC.md`（本文）= 实现/现状文档，描述当前代码如何工作、有哪些入口。
> - 任何代码改动完成后，记得同步更新本文件的“功能特性/组件/使用方法”部分。

基于 AST 静态分析的 Python 多线程程序调用图生成工具，参考 cally++ 的设计思路。

## 功能特性（当前实现）

- ✅ AST 静态分析：解析 Python 源代码，无需运行
- ✅ 线程识别：`threading.Thread`/线程池 target → 线程入口边
- ✅ 同步语义：Lock/Semaphore/Event acquire/release 节点
- ✅ 调用关系视图：支持 full / caller / thread-only
- ✅ 简化模式：隐藏内建函数、标准库噪声
- ✅ 可视化：生成 Graphviz DOT/PNG，并提供 GUI 预览
- ✅ CLI & GUI：`generate_static.py`、`py_thread_callgraph.py`、`gui_static.py`

## 快速开始（generate_static.py）

```bash
cd /home/chove/Desktop/mydag/callypy

# 生成完整调用图
python3 generate_static.py --source examples/simple_thread.py --full --simplify

# 输出：
# - config/simple_thread/simple_thread.dot         (原始)
# - config/simple_thread/simple_thread_simple.dot  (简化)
# - img/simple_thread_full.png                     (原始)
# - img/simple_thread_full_simple.png              (简化)
```

## CLI 使用方法

```bash
# 1. 完整调用图
python3 generate_static.py --source example.py --full

# 2. 从 main 开始的调用图
python3 generate_static.py --source example.py --caller main

# 3. 简化图（隐藏内建函数）
python3 generate_static.py --source example.py --full --simplify

# 4. 仅显示线程相关
python3 generate_static.py --source example.py --thread-only

# 5. 调试模式
python3 generate_static.py --source example.py --full --debug
```

## 线程语义识别（静态）

### 线程创建
```python
# threading.Thread
t = threading.Thread(target=worker, args=(1, 2))
# -> main --[thread, green]--> worker

# ThreadPoolExecutor
executor.submit(func, args)
# -> main --[pool_submit, green]--> func
```

### 同步原语
```python
lock.acquire()  # -> threading_lock_acquire [gray dashed]
lock.release()  # -> threading_lock_release [gray dashed]

with lock:      # -> 自动识别为 acquire + release
    ...
```

## 输出示例

**simple_thread.py 简化后**：
```
main
├── worker  [thread创建，绿色粗线]
└── (print 等内建函数已隐藏)

worker  [线程入口，绿色背景]
├── threading_lock_acquire  [同步原语，灰色虚线]
├── threading_lock_release
├── process_data
└── save_result
```

## 组件概览

```
callypy/
├── ast_parser.py          # AST 解析器
├── call_graph.py          # 调用图数据结构
├── dot_generator.py       # DOT 生成器
├── simplify.py            # 简化器
├── generate_static.py     # 静态分析主程序（CallyPy Static）
├── py_thread_callgraph.py # 轻量 AST→DOT 脚本（仅线程调用）
├── gui_static.py          # Tk GUI，封装 generate_static
├── DESIGN.md              # 逻辑/交互文档
├── README_STATIC.md       # 实现文档（当前文件）
└── examples/              # 示例脚本（simple_thread.py, producer_consumer.py, produce5 等）
```

## GUI 使用

```bash
python3 gui_static.py
```

操作流程：
1. 选择 Python 源文件与输出目录；
2. 选择视图模式（Caller/Full/Thread Only），Caller 模式填写根函数；
3. 勾选简化/Debug（可选），点击“生成”；
4. 左侧日志展示 `generate_static.py` 输出，右侧画布支持 PNG 预览（可缩放/拖动）。
   - 图片存放在 `<输出目录>/img/<basename>_{mode}[_simple].png`

## 轻量脚本：py_thread_callgraph.py

在无需完整 CallyPy 流水线时，可直接使用：

```bash
python3 py_thread_callgraph.py --input examples/simple_thread.py --output simple_thread_py.dot
dot -Tpng simple_thread_py.dot -o simple_thread_py.png
```

特性：
- 单文件静态分析，识别 `threading.Thread` 的 target 及 `join()` 调用；
- 输出 DOT（线程创建 = 蓝色虚线，join = 红色虚线）；
- 可通过 `--ignore prefix` 过滤节点。

## 与 cally++ 对比

| 特性 | cally++ | callypy |
|------|---------|---------|
| 语言 | C++ | Python |
| 输入 | GCC RTL | Python 源码 |
| 解析 | 正则匹配 | AST 遍历 |
| 线程库 | std::thread | threading |
| 简化 | 隐藏 STL | 隐藏内建函数 |

详见 `DESIGN.md`
