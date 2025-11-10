# CallyPy Static - Python 线程调用图生成器（静态分析）

基于 AST 静态分析的 Python 多线程程序调用图生成工具，参考 cally++ 的设计思路。

## 功能特性

- ✅ **AST 静态分析**：解析 Python 源代码，无需运行
- ✅ **线程识别**：自动识别 `threading.Thread` 创建
- ✅ **同步原语**：识别 Lock/Semaphore/Event 等
- ✅ **调用关系**：提取函数调用关系
- ✅ **简化模式**：隐藏内建函数和标准库
- ✅ **多种视图**：full/caller/thread-only
- ✅ **可视化**：生成 Graphviz DOT 和 PNG

## 快速开始

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

## 使用方法

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

## 线程语义识别

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

## 项目结构

```
callypy/
├── ast_parser.py          # AST 解析器
├── call_graph.py          # 调用图数据结构
├── dot_generator.py       # DOT 生成器
├── simplify.py            # 简化器
├── generate_static.py     # 静态分析主程序
├── DESIGN.md              # 设计文档
├── README_STATIC.md       # 本文档
└── examples/
    └── simple_thread.py   # 示例代码
```

## 与 cally++ 对比

| 特性 | cally++ | callypy |
|------|---------|---------|
| 语言 | C++ | Python |
| 输入 | GCC RTL | Python 源码 |
| 解析 | 正则匹配 | AST 遍历 |
| 线程库 | std::thread | threading |
| 简化 | 隐藏 STL | 隐藏内建函数 |

详见 `DESIGN.md`
