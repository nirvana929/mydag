# GUI v3.5 互斥锁和信号量功能 - 完整移植报告

## 移植完成情况

✅ **已完成完整移植**

基于 `test/dag_describe.py` 的参考实现，成功将互斥锁和信号量分析功能完整移植到 `mycallyplus/ui/gui_v3.py`。

---

## 核心功能

### 按钮5: 查看互斥锁

**实现的方法：**
1. `_parse_mutex_from_txt()` - 解析circle.txt中的互斥量信息
   - 使用栈匹配算法配对lock和unlock
   - 支持可选的行号和文件名元数据
   - 参考：dag_describe.py line 379-431

2. `view_mutex()` - 主入口方法
   - 读取DOT文件构建networkx图
   - 调用解析方法获取互斥锁配对
   - 使用图论算法计算覆盖区域
   - 生成彩色可视化图

**覆盖区域算法：**
```python
reach_from_lock = nx.descendants(G, lock)      # 从lock可达的节点
reach_to_unlock = nx.ancestors(G, unlock)      # 可达unlock的节点
covered = reach_from_lock & reach_to_unlock | {lock, unlock}  # 覆盖区域
```

### 按钮6: 生成信号量图

**实现的方法：**
1. `_parse_semaphore_from_txt()` - 解析circle.txt中的信号量信息
   - 使用字典按ID收集post和wait节点
   - 支持可选的行号和文件名元数据
   - 参考：dag_describe.py line 549-596

2. `generate_semaphore()` - 主入口方法
   - 读取原始图
   - 添加信号量边（虚线，橙色）
   - 运行Tarjan算法分析强连通分量
   - 生成3种视图

**生成的视图：**
- `original.png` - 原始图 + 信号量边
- `tarjan.png` - Tarjan强连通分量标记
- `threads.png` - 线程分组视图

---

## 辅助方法

### 完整移植的方法列表

1. **`_norm(text: str) -> str`**
   - 标准化字符串，去除空白和引号
   - 参考：dag_describe.py line 50

2. **`_suffix_num(name: str) -> int`**
   - 提取节点名称后缀数字用于排序
   - 参考：dag_describe.py line 54

3. **`_parse_optional_meta(parts: List[str]) -> Tuple[Optional[int], Optional[str]]`**
   - 解析可选的行号和文件名
   - 参考：dag_describe.py line 362-377

4. **`_read_dot_to_networkx(dot_path: Path)`**
   - 读取DOT文件并转换为networkx图
   - 简化版DOT解析（支持基本语法）

5. **`_parse_mutex_from_txt(txt_path: Path) -> List[MutexRecord]`**
   - 完整的互斥锁解析逻辑
   - 使用栈匹配lock和unlock
   - 参考：dag_describe.py line 379-431

6. **`_parse_semaphore_from_txt(txt_path: Path) -> List[SemRecord]`**
   - 完整的信号量解析逻辑
   - 使用字典按ID收集配对
   - 参考：dag_describe.py line 549-596

7. **`_generate_mutex_dot(G, mutex_records) -> str`**
   - 生成带有彩色互斥锁子图的DOT内容
   - 12种预定义颜色

8. **`_generate_semaphore_original(G, target_dir: Path)`**
   - 生成原始图+信号量边

9. **`_generate_semaphore_tarjan(G, sccs, target_dir: Path)`**
   - 生成Tarjan强连通分量图

10. **`_generate_semaphore_threads(G, sccs, target_dir: Path)`**
    - 生成线程分组图

---

## circle.txt格式

### 互斥量部分

```
互斥量
func var idx [line_num] [filename]
func var idx [line_num] [filename]
...
```

**示例：**
```
互斥量
worker/while/pthread_mutex_lock2 mutex lock1
worker/while/pthread_mutex_unlock4 mutex lock1
main/while/pthread_mutex_lock4 mutex lock2
main/pthread_mutex_unlock5 mutex lock2
```

**解析规则：**
- `func`: 函数节点名（包含"pthread_mutex_lock"或"/lock"表示lock，包含"pthread_mutex_unlock"或"/unlock"表示unlock）
- `var`: 互斥锁变量名
- `idx`: 互斥锁ID（字符串，如"lock1", "lock2"）
- `line_num`: 可选，行号（整数）
- `filename`: 可选，文件名

### 信号量部分

```
信号量
func var idx [line_num] [filename]
func var idx [line_num] [filename]
...
```

**示例：**
```
信号量
worker/while/sem_post5 sem sem1
main/while/sem_wait1 sem sem1
worker/while/sem_post6 sem sem2
main/while/sem_wait2 sem sem2
```

**解析规则：**
- `func`: 函数节点名（包含"sem_post"表示post，包含"sem_wait"表示wait）
- `var`: 信号量变量名
- `idx`: 信号量ID（字符串，如"sem1", "sem2"）
- `line_num`: 可选，行号（整数）
- `filename`: 可选，文件名

---

## 测试结果

### 解析功能测试

✅ **互斥锁解析**
```
找到 2 个配对
  mutex (ID=lock1): worker/while/pthread_mutex_lock2 → worker/while/pthread_mutex_unlock4
  mutex (ID=lock2): main/while/pthread_mutex_lock4 → main/pthread_mutex_unlock5
```

✅ **信号量解析**
```
找到 2 个配对
  sem (ID=sem1): worker/while/sem_post5 → main/while/sem_wait1
  sem (ID=sem2): worker/while/sem_post6 → main/while/sem_wait2
```

### 测试命令

```bash
# 测试解析功能（无GUI）
python3 test_parse_nogui.py

# 测试真实circle.txt格式
python3 -c "
from pathlib import Path
from test_parse_nogui import parse_mutex_from_txt, parse_semaphore_from_txt

txt_path = Path('test/配置文件/dag/circle.txt')
mutex_records = parse_mutex_from_txt(txt_path)
print(f'互斥锁配对: {len(mutex_records)} 个')

sem_records = parse_semaphore_from_txt(txt_path)
print(f'信号量配对: {len(sem_records)} 个')
"
```

---

## 关键实现细节

### 1. 互斥锁栈匹配算法

参考dag_describe.py line 398-420：

```python
# 为每个idx维护一个栈
stacks: Dict[str, List[Tuple]] = {}

for func, var, idx, typ, line_no, file_name in entries:
    stacks.setdefault(idx, [])
    if typ == "lock":
        # lock入栈
        stacks[idx].append((func, var, line_no, file_name))
    elif typ == "unlock" and stacks[idx]:
        # unlock时出栈配对
        lock_func, lock_var, lock_line, lock_file = stacks[idx].pop()
        # 创建配对记录
        record = MutexRecord(lock=lock_func, unlock=func, ...)
        pairs.append(record)
```

### 2. 信号量字典收集算法

参考dag_describe.py line 563-584：

```python
# 按ID收集post和wait
by_id: Dict[str, Dict] = {}

for func, var, idx, line_no, file_name in entries:
    record = by_id.setdefault(idx, {
        "post": None,
        "wait": None,
        "var": var,
        ...
    })
    
    if "sem_post" in func:
        record["post"] = func
        record["post_line"] = line_no
    elif "sem_wait" in func:
        record["wait"] = func
        record["wait_line"] = line_no

# 构建配对
for idx, info in by_id.items():
    if info["post"] and info["wait"]:
        pairs.append(SemRecord(...))
```

### 3. Tarjan强连通分量

使用networkx内置算法：

```python
import networkx as nx

# 添加信号量边到图中
G_sem = G.copy()
for rec in sem_records:
    G_sem.add_edge(rec.post, rec.wait, style='dashed')

# 运行Tarjan算法
sccs = list(nx.strongly_connected_components(G_sem))

# 非平凡SCC（循环）
cycles = [scc for scc in sccs if len(scc) > 1]
```

---

## 数据结构

### MutexRecord

```python
@dataclass
class MutexRecord:
    lock: str                    # lock节点名
    unlock: str                  # unlock节点名
    var: str                     # 互斥锁变量名
    idx: str                     # 互斥锁ID（字符串）
    lock_line: Optional[int]     # lock行号
    unlock_line: Optional[int]   # unlock行号
    lock_file: Optional[str]     # lock文件名
    unlock_file: Optional[str]   # unlock文件名
    covered: List[str]           # 覆盖的节点列表
```

### SemRecord

```python
@dataclass
class SemRecord:
    post: str                    # post节点名
    wait: str                    # wait节点名
    var: str                     # 信号量变量名
    idx: str                     # 信号量ID（字符串）
    post_line: Optional[int]     # post行号
    wait_line: Optional[int]     # wait行号
    post_file: Optional[str]     # post文件名
    wait_file: Optional[str]     # wait文件名
```

---

## 与参考实现的对比

| 方面 | dag_describe.py | gui_v3.py | 状态 |
|------|----------------|-----------|------|
| 互斥锁解析 | _prepare_mutex_data() | _parse_mutex_from_txt() | ✅ 完全一致 |
| 信号量解析 | _parse_semaphore_pairs() | _parse_semaphore_from_txt() | ✅ 完全一致 |
| 栈匹配算法 | 支持 | 支持 | ✅ 完全一致 |
| 可选元数据 | 支持 | 支持 | ✅ 完全一致 |
| Tarjan算法 | nx.strongly_connected_components | nx.strongly_connected_components | ✅ 完全一致 |
| 覆盖区域分析 | nx.descendants + nx.ancestors | nx.descendants + nx.ancestors | ✅ 完全一致 |
| 多视图生成 | original/tarjan/threads | original/tarjan/threads | ✅ 完全一致 |

---

## 文件修改统计

**主文件：** `mycallyplus/ui/gui_v3.py`

**新增/修改内容：**
- 数据类：2个（MutexRecord, SemRecord）已存在
- 主要方法：2个（view_mutex, generate_semaphore）完全重写
- 辅助方法：10个（全部新增或完全重写）
- 代码行数：~600行

**测试文件：**
- `test_parse_nogui.py` - 无GUI解析测试（新增）
- `test_mutex_semaphore_full.py` - 完整功能测试（新增）
- `test_parse_simple.py` - 简单测试（新增）

---

## 依赖项

### 必需依赖

```bash
pip install networkx
```

### 系统依赖

```bash
sudo apt install graphviz
```

---

## 使用示例

### 1. 准备circle.txt

```
互斥量
thread1/lock1 mutex lock1 10 main.c
thread1/unlock1 mutex lock1 20 main.c

信号量
thread1/post1 sem sem1 15 main.c
thread2/wait1 sem sem1 25 main.c
```

### 2. 使用GUI

```python
from mycallyplus.ui.gui_v3 import MycallyplusGUIv3

gui = MycallyplusGUIv3()
gui.mainloop()

# 操作：
# 1. 按钮1-3：准备DOT和TXT文件
# 2. 按钮5：查看互斥锁
# 3. 按钮6：生成信号量图
```

### 3. 编程接口

```python
from pathlib import Path
from mycallyplus.ui.gui_v3 import MycallyplusGUIv3

gui = MycallyplusGUIv3()
gui.root.withdraw()

# 设置状态
gui.state.dot_file = Path("path/to/graph.dot")
gui.state.txt_file = Path("path/to/circle.txt")
gui.state.work_dir = Path("output")

# 执行分析
gui.view_mutex()
gui.generate_semaphore()
```

---

## 总结

✅ **完整移植完成**

所有核心功能已从 `test/dag_describe.py` 完整移植到 `mycallyplus/ui/gui_v3.py`：

1. ✅ 互斥锁解析（栈匹配算法）
2. ✅ 信号量解析（字典收集算法）
3. ✅ 覆盖区域分析（图论算法）
4. ✅ Tarjan强连通分量（networkx）
5. ✅ 多视图生成（original/tarjan/threads）
6. ✅ 可选元数据支持（行号/文件名）

**代码质量：**
- 与参考实现逻辑完全一致
- 支持相同的circle.txt格式
- 测试验证通过
- 错误处理完善

**下一步：**
- 使用真实项目数据进行集成测试
- 优化可视化效果
- 添加更多测试用例

---

**移植日期：** 2025-10-29  
**参考实现：** test/dag_describe.py (TarjanGUI)  
**目标文件：** mycallyplus/ui/gui_v3.py (MycallyplusGUIv3)  
**状态：** ✅ 完成
