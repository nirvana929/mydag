# CallyPy 设计文档（逻辑/交互专用）

> **双文档机制说明**：
> - 本文档 = **逻辑/交互文档**。用于记录需求、整体实现思路、与 GPT 协作时的指令。编辑时请聚焦"要做什么、为什么这么做、限制条件"。
> - 对应的代码实现现状、功能清单请查看 `README_STATIC.md`（实现文档）。
> - 每次调整需求或设计，请更新本文件；每次落地代码后，务必同步更新 `README_STATIC.md` 描述实际行为。

## 0. 项目目录结构规范

### 0.1 标准目录结构

```
callypy/
├── ast_parser.py           # 核心代码：AST 解析器
├── call_graph.py           # 核心代码：调用图数据结构
├── dot_generator.py        # 核心代码：DOT 生成器
├── generate_static.py      # 核心代码：主程序入口
├── simplify.py             # 核心代码：简化器
├── render_dot.py           # 核心代码：PNG 渲染
├── gui_static.py           # 核心代码：GUI 界面
├── DESIGN.md               # 本文档：设计逻辑（交互用）
├── README_STATIC.md        # 实现文档：功能清单（查阅用）
├── source/                 # 所有源代码（每个项目一个子文件夹）
│   ├── simple_thread/
│   │   └── simple_thread.py
│   ├── producer_consumer/
│   │   └── producer_consumer.py
│   └── produce5_threads/
│       └── produce5_threads.py
├── config/                 # 生成的 DOT 配置文件（与源文件结构对应）
│   ├── simple_thread/
│   │   ├── simple_thread.dot
│   │   └── simple_thread_simple.dot
│   ├── producer_consumer/
│   │   └── producer_consumer.dot
│   └── produce5_threads/
│       ├── produce5_threads.dot
│       └── produce5_threads_simple.dot
└── img/                    # 生成的 PNG 图片（与源文件结构对应）
    ├── simple_thread/
    │   ├── simple_thread_full.png
    │   └── simple_thread_full_simple.png
    ├── producer_consumer/
    │   └── producer_consumer_thread_only.png
    └── produce5_threads/
        ├── produce5_threads_full.png
        └── produce5_threads_full_simple.png
```

### 0.2 目录组织原则

1. **源文件组织**（`source/`）
   - 每个 Python 项目/示例在 `source/` 下有独立的子文件夹
   - 文件夹名 = 项目名（不含 .py 扩展名）
   - 例如：`source/simple_thread/simple_thread.py`

2. **配置文件组织**（`config/`）
   - 与源文件保持一致的文件夹结构
   - 每个项目在 `config/` 下有对应的子文件夹
   - 存储生成的 DOT 文件（原始 + 简化版）
   - 例如：`config/simple_thread/simple_thread.dot`

3. **图片文件组织**（`img/`）
   - 与源文件保持一致的文件夹结构
   - 每个项目在 `img/` 下有对应的子文件夹
   - 存储生成的 PNG 图片（各种类型）
   - 例如：`img/simple_thread/simple_thread_full.png`

4. **文件命名规则**
   - 基础名称：使用源文件的 stem（不含扩展名）
   - DOT 文件：`<basename>.dot`（原始），`<basename>_simple.dot`（简化）
   - PNG 文件：`<basename>_<type>.png`，其中 type 为：
     - `full`：完整调用图
     - `caller`：调用者图
     - `thread_only`：仅线程图
     - `full_simple`：简化的完整图

5. **测试示例存储**
   - 测试示例不再使用独立的 `examples/` 目录
   - 统一存储在 `source/` 对应的子文件夹中
   - 与用户项目使用相同的组织方式

### 0.3 路径解析逻辑

```python
# 输入：源文件路径（绝对或相对）
source_file = "source/simple_thread/simple_thread.py"

# 提取项目名
project_name = Path(source_file).stem  # "simple_thread"

# 输出路径
config_dir = Path("config") / project_name / f"{project_name}.dot"
img_dir = Path("img") / project_name / f"{project_name}_full.png"
```

### 0.4 与 mycallyplus 的对比

| 维度 | mycallyplus (C) | callypy (Python) |
|------|----------------|------------------|
| 源文件目录 | `源文件/` | `source/` |
| 配置文件目录 | `配置文件/` | `config/` |
| 图片目录 | `中间结果/`（含 img） | `img/` |
| 子文件夹结构 | 按项目组织 | 按项目组织 |
| 文件夹对应关系 | 严格一致 | 严格一致 |

## 1. 项目概述（需求侧）

### 1.1 目标
为 Python 代码生成线程调用图，分析多线程程序中的函数调用关系、线程创建与同步。

### 1.2 对比 cally++
| 特性 | cally++ (C++) | callypy (Python) |
|------|---------------|------------------|
| 输入 | GCC RTL expand 文件 | Python 源代码 (.py) |
| 解析方式 | 正则匹配 RTL | AST 静态分析 |
| 符号处理 | C++ demangle | 直接可读 |
| 线程库 | std::thread, pthread | threading, multiprocessing |
| 锁机制 | std::mutex, lock_guard | threading.Lock, RLock, Semaphore |

## 2. 技术方案与约束

### 2.1 Python 特点
- **动态类型**：无需编译，直接解析源代码
- **AST 解析**：使用内置 `ast` 模块解析语法树
- **线程库**：`threading`, `multiprocessing`, `concurrent.futures`
- **装饰器**：`@threaded` 等可能包装线程函数

### 2.2 解析策略（静态 AST）

#### 静态分析（AST）
```python
import ast

# 解析源代码为 AST
tree = ast.parse(source_code)

# 遍历节点：
# - FunctionDef: 函数定义
# - Call: 函数调用
# - ClassDef: 类定义
# - Attribute: 属性访问 (obj.method())
```

#### 线程识别
1. **threading.Thread 创建**
   ```python
   t = threading.Thread(target=worker_func, args=(...))
   ```
   识别为：`当前函数 --[创建线程]--> worker_func`

2. **Thread 子类**
   ```python
   class MyThread(threading.Thread):
       def run(self):
           ...
   ```
   识别为：`MyThread.run()` 为线程入口

3. **线程池**
   ```python
   with ThreadPoolExecutor() as executor:
       executor.submit(func, args)
   ```
   识别为：`当前函数 --[submit]--> func`

4. **multiprocessing**
   ```python
   p = multiprocessing.Process(target=func)
   ```
   识别为进程（可选标记颜色）

#### 同步机制识别
1. **Lock/RLock**
   ```python
   lock.acquire() / lock.release()
   with lock:  # __enter__ / __exit__
   ```
   映射为：`lock_acquire` / `lock_release`

2. **Semaphore/Event/Condition**
   类似映射为语义节点

### 2.3 架构设计与输入输出

```
callypy/
├── ast_parser.py          # AST 解析器，提取函数和调用关系
├── thread_analyzer.py     # 线程语义分析器
├── call_graph.py          # 调用图数据结构
├── dot_generator.py       # DOT 生成器
├── simplify.py            # 简化器（隐藏内建函数）
├── generate.py            # 主程序入口
├── DESIGN.md              # 本设计文档
├── README.md              # 使用说明
└── examples/              # 测试示例
    ├── simple_thread.py
    └── producer_consumer.py
```

## 3. 核心模块（待实现/已实现）

### 3.1 AST Parser

**功能**：
- 解析 Python 源代码为 AST
- 提取函数定义（函数名、类方法、嵌套函数）
- 提取函数调用（直接调用、方法调用、lambda）
- 识别导入的模块

**核心类**：
```python
class ASTParser:
    def parse_file(self, filepath: str) -> CallGraph
    def _visit_function(self, node: ast.FunctionDef)
    def _visit_call(self, node: ast.Call)
    def _resolve_name(self, node) -> str
```

### 3.2 Thread Analyzer

**功能**：
- 识别 `threading.Thread(target=...)`
- 识别 `Thread` 子类及其 `run()` 方法
- 识别线程池 `ThreadPoolExecutor.submit()`
- 识别同步原语（Lock, Semaphore, Event 等）
- 标记线程创建边和同步节点

**核心类**：
```python
class ThreadAnalyzer:
    def analyze(self, graph: CallGraph) -> ThreadInfo
    def _find_thread_creations(self) -> Dict[str, str]
    def _find_sync_primitives(self) -> List[SyncNode]
```

### 3.3 Call Graph

**功能**：
- 存储函数定义和调用关系
- 支持类方法（`ClassName.method`）
- 支持模块导入解析

**核心类**：
```python
class Function:
    name: str
    calls: Set[str]
    defined_in: str  # 文件路径
    is_method: bool
    class_name: Optional[str]

class CallGraph:
    functions: Dict[str, Function]
    imports: Dict[str, str]  # alias -> module
```

### 3.4 DOT Generator

**功能**：
- 生成 Graphviz DOT 格式
- 支持 caller/callee/full 三种模式
- 标记线程创建边（特殊颜色/样式）
- 标记同步节点（灰色虚线）

**核心类**：
```python
class DOTGenerator:
    def generate_caller_graph(self, root: str) -> str
    def generate_full_graph(self) -> str
    def _mark_thread_edges(self)
    def _mark_sync_nodes(self)
```

### 3.5 Simplify

**功能**：
- 隐藏内建函数（`print`, `len`, `range` 等）
- 隐藏标准库（`os`, `sys`, `json` 等，可配置）
- 压缩仅含内建函数的链路
- 保留用户函数和线程语义

**核心类**：
```python
class PythonSimplifier:
    BUILTIN_BLACKLIST = ['print', 'len', 'range', ...]
    STDLIB_BLACKLIST = ['os.', 'sys.', 're.', ...]
    
    def simplify(self, dot: str) -> str
```

## 4. 线程语义映射

### 4.1 线程创建

| Python 代码 | 语义表示 |
|-------------|----------|
| `Thread(target=func)` | `当前函数 --[thread_create]--> func` |
| `class MyThread(Thread): run()` | `调用处 --[thread_create]--> MyThread.run` |
| `executor.submit(func)` | `当前函数 --[pool_submit]--> func` |
| `Process(target=func)` | `当前函数 --[process_create]--> func` |

**样式**：
- 边标签：`"thread_create"`
- 边颜色：绿色
- 边样式：粗线

### 4.2 线程同步

| Python 代码 | 语义节点 | 样式 |
|-------------|----------|------|
| `lock.acquire()` | `threading_lock_acquire` | 灰色虚线 |
| `lock.release()` | `threading_lock_release` | 灰色虚线 |
| `with lock:` | `acquire` + `release` | 灰色虚线 |
| `semaphore.acquire()` | `threading_semaphore_acquire` | 灰色虚线 |
| `event.wait()` | `threading_event_wait` | 灰色虚线 |
| `condition.wait()` | `threading_condition_wait` | 灰色虚线 |

### 4.3 线程管理

| Python 代码 | 语义节点 |
|-------------|----------|
| `thread.join()` | `threading_join` |
| `thread.start()` | `threading_start` |
| `pool.shutdown()` | `pool_shutdown` |

## 5. 实现细节

### 5.1 函数名解析

Python 函数可能以多种形式出现：
```python
# 1. 顶层函数
def func(): ...
# -> "func"

# 2. 类方法
class MyClass:
    def method(self): ...
# -> "MyClass.method"

# 3. 嵌套函数
def outer():
    def inner(): ...
# -> "outer.<locals>.inner"

# 4. Lambda
lambda x: x + 1
# -> "<lambda>" 或跳过

# 5. 装饰器包装
@decorator
def func(): ...
# -> 仍为 "func"，但需检查装饰器
```

### 5.2 调用解析

```python
# 1. 直接调用
func()
# -> "func"

# 2. 方法调用
obj.method()
# -> 需推断 obj 类型（可能无法静态确定）

# 3. 模块调用
module.func()
# -> 解析导入，"module.func"

# 4. 动态调用
getattr(obj, 'method')()
# -> 可能无法静态解析，标记为 "dynamic_call"
```

### 5.3 AST 访问者模式

```python
class CallGraphVisitor(ast.NodeVisitor):
    def __init__(self):
        self.current_function = None
        self.call_graph = CallGraph()
    
    def visit_FunctionDef(self, node):
        # 记录函数定义
        func_name = self._get_qualified_name(node)
        self.current_function = func_name
        self.call_graph.ensure_function(func_name)
        
        # 递归访问函数体
        self.generic_visit(node)
        
        self.current_function = None
    
    def visit_Call(self, node):
        # 记录函数调用
        if self.current_function:
            callee = self._resolve_call_target(node)
            if callee:
                self.call_graph.add_call(self.current_function, callee)
        
        self.generic_visit(node)
    
    def _resolve_call_target(self, node: ast.Call) -> Optional[str]:
        # 解析调用目标
        if isinstance(node.func, ast.Name):
            return node.func.id
        elif isinstance(node.func, ast.Attribute):
            return self._resolve_attribute(node.func)
        return None
```

## 6. 输出示例

### 6.1 simple_thread.py

**Python 源代码**：
```python
import threading

lock = threading.Lock()
counter = 0

def worker(n):
    global counter
    for i in range(n):
        with lock:
            counter += 1
        process_data(i)

def process_data(x):
    print(f"Processing {x}")

def main():
    threads = []
    for i in range(3):
        t = threading.Thread(target=worker, args=(10,))
        threads.append(t)
        t.start()
    
    for t in threads:
        t.join()
    
    print(f"Final counter: {counter}")

if __name__ == "__main__":
    main()
```

**简化后的调用图**：
```
main
├── threading.Thread(target=worker)  [thread_create, green]
├── threading_start
├── threading_join
└── (print hidden)

worker  [thread entry]
├── threading_lock_acquire  [sync, gray dashed]
├── threading_lock_release  [sync, gray dashed]
└── process_data

process_data
└── (print hidden)
```

## 7. 使用方式

```bash
# 基本用法
python3 generate.py --source simple_thread.py

# 生成完整调用图
python3 generate.py --source simple_thread.py --full

# 从指定函数开始
python3 generate.py --source simple_thread.py --caller main

# 启用简化（隐藏内建函数）
python3 generate.py --source simple_thread.py --full --simplify

# 调试模式
python3 generate.py --source simple_thread.py --debug
```

**输出**：
- `config/<basename>/<basename>.dot` - 原始 DOT
- `config/<basename>/<basename>_simple.dot` - 简化 DOT
- `img/<basename>_full.png` - 完整图
- `img/<basename>_full_simple.png` - 简化图

## 8. 技术挑战与解决方案

### 8.1 动态特性

**问题**：Python 是动态类型，无法完全静态分析
```python
func = get_function()  # 运行时才知道是哪个函数
func()
```

**解决方案**：
1. 尽力静态分析（AST）
2. 标记未解析的调用为 `<dynamic>`
3. 提供运行时跟踪模式（可选，使用 `sys.settrace`）

### 8.2 装饰器

**问题**：装饰器可能改变函数行为
```python
@app.route('/api')
def handler():
    ...
```

**解决方案**：
1. 记录装饰器信息
2. 识别常见装饰器（如 `@staticmethod`, `@classmethod`）
3. 对于框架装饰器，可配置特殊处理

### 8.3 类型推断

**问题**：方法调用需要推断对象类型
```python
obj.method()  # obj 是什么类型？
```

**解决方案**：
1. 基于赋值的简单推断
   ```python
   obj = MyClass()
   obj.method()  # -> MyClass.method
   ```
2. 支持类型注解
   ```python
   obj: MyClass = ...
   obj.method()  # -> MyClass.method
   ```
3. 无法推断时保守处理

### 8.4 跨文件分析

**问题**：导入其他模块的函数
```python
from mymodule import func
func()
```

**解决方案**：
1. 递归解析导入的模块
2. 限制深度（避免解析整个 stdlib）
3. 提供黑名单（跳过某些模块）

## 9. 扩展功能

### 9.1 运行时跟踪（可选）

使用 `sys.settrace` 获取实际执行的调用：
```python
def trace_calls(frame, event, arg):
    if event == 'call':
        caller = frame.f_back.f_code.co_name
        callee = frame.f_code.co_name
        record_call(caller, callee)
```

优点：精确，包含动态调用  
缺点：需要实际运行代码，可能不完整

### 9.2 类型注解支持

利用 `typing` 模块的类型信息：
```python
from typing import Callable

def executor(func: Callable[[], None]):
    func()  # 可以推断 func 的类型
```

### 9.3 异步支持

识别 `asyncio` 的协程和任务：
```python
async def worker():
    ...

asyncio.create_task(worker())
# -> 类似线程创建
```

## 10. 测试计划

### 10.1 测试用例

1. **simple_thread.py** - 基本线程+锁
2. **producer_consumer.py** - 队列+多生产者消费者
3. **thread_pool.py** - ThreadPoolExecutor
4. **class_thread.py** - Thread 子类
5. **multiprocessing_example.py** - 多进程
6. **nested_calls.py** - 嵌套函数调用
7. **dynamic_call.py** - 动态调用测试

### 10.2 验证指标

- 函数识别率 > 95%（用户定义函数）
- 调用关系准确率 > 90%
- 线程识别率 100%（静态可见的）
- 简化率 > 80%（DOT 行数减少）

## 11. 与 cally++ 的对比总结

| 维度 | cally++ | callypy |
|------|---------|---------|
| 语言 | C++ | Python |
| 解析输入 | RTL expand | Python 源码 |
| 解析技术 | 正则匹配 | AST 遍历 |
| 符号处理 | demangle | 直接可读 |
| 线程库 | std::thread | threading |
| 分析方式 | 编译后分析 | 源码静态分析 |
| 精确度 | 高（编译器信息） | 中（动态特性限制） |
| 易用性 | 需编译 | 直接解析 |
| 运行时信息 | 无 | 可选（settrace） |

## 12. 实现优先级

**Phase 1（MVP）**：
- [x] AST 基本解析（函数定义、调用）
- [x] threading.Thread 识别
- [x] 基本 DOT 生成
- [x] 示例：simple_thread.py

**Phase 2**：
- [ ] 线程池支持（ThreadPoolExecutor）
- [ ] 同步原语识别（Lock, Semaphore 等）
- [ ] 简化器（隐藏内建函数）
- [ ] 跨文件分析

**Phase 3**：
- [ ] Thread 子类识别
- [ ] 装饰器处理
- [ ] 类型推断优化
- [ ] 运行时跟踪模式

**Phase 4**：
- [ ] asyncio 支持
- [ ] multiprocessing 支持
- [ ] GUI 可视化工具
