# GUI v3.5 使用指南

## 版本更新

**GUI v3.5** - 完整功能版本
- ✅ 按钮1-4: 已实现（v3.4）
- ✅ 按钮5: 查看互斥锁 - **新增**
- ✅ 按钮6: 生成信号量图 - **新增**

---

## 新功能说明

### 按钮5: 查看互斥锁

**功能描述：**
- 解析 `circle.txt` 中的互斥量配对信息
- 使用 networkx 分析互斥锁覆盖的代码区域
- 生成带有彩色互斥锁标记的可视化图

**工作流程：**
```
1. 读取按钮3生成的DOT文件
2. 解析circle.txt中的"互斥量"部分
3. 使用图分析计算互斥锁覆盖区域
   - 从lock节点出发的所有后继节点
   - 到unlock节点的所有前驱节点
   - 取交集 + lock和unlock本身
4. 生成彩色子图
   - 每个互斥锁用不同颜色标记
   - LOCK和UNLOCK节点特殊标注
5. 输出到: work_dir/查看互斥锁/mutex.png
```

**circle.txt格式示例：**
```
互斥量
thread1_lock1 thread1_unlock1 mutex_a 0 10 main.c
thread2_lock2 thread2_unlock2 mutex_b 1 20 main.c
```

格式说明：
- `lock_node unlock_node var_name idx [line_number] [filename]`
- 前4列必需，后2列可选

**输出文件：**
- `work_dir/查看互斥锁/mutex.dot` - DOT源文件
- `work_dir/查看互斥锁/mutex.png` - 可视化图像

---

### 按钮6: 生成信号量图

**功能描述：**
- 解析 `circle.txt` 中的信号量配对信息
- 在原始图上添加信号量边（sem_post → sem_wait）
- 运行 Tarjan 算法分析强连通分量
- 生成多种视图的可视化图

**工作流程：**
```
1. 读取按钮3生成的DOT文件
2. 解析circle.txt中的"信号量"部分
3. 添加信号量边（虚线）
   - sem_post → sem_wait
   - 橙色虚线 #FF7043
4. 运行Tarjan算法
   - 使用networkx.strongly_connected_components
   - 找出所有强连通分量（循环）
5. 生成三种视图
   a) original.png - 原始图+信号量边
   b) tarjan.png - 强连通分量标记
   c) threads.png - 线程分组视图
6. 输出到: work_dir/生成信号量图/
```

**circle.txt格式示例：**
```
信号量
thread1_post1 thread2_wait1 sem_x 0 15 main.c
thread2_post2 thread1_wait2 sem_y 1 25 main.c
```

格式说明：
- `post_node wait_node var_name idx [line_number] [filename]`
- 前4列必需，后2列可选

**输出文件：**
- `work_dir/生成信号量图/original.png` - 原始图+信号量边
- `work_dir/生成信号量图/tarjan.png` - 强连通分量图
- `work_dir/生成信号量图/threads.png` - 线程分组图

---

## 完整工作流程

```
┌─────────────────────────────────────────────────────────────┐
│  按钮1: 选择源文件 (main.c)                                  │
│  └─> 显示源文件路径                                          │
└─────────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────────┐
│  按钮2: 生成expand文件                                       │
│  ├─> 智能检测include目录（5种路径）                          │
│  ├─> gcc -fdump-tree-all-graph ...                          │
│  └─> 生成 main.c.233r.expand                                │
└─────────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────────┐
│  按钮3: 生成条件节点图                                       │
│  ├─> python -m mycallypro expand_file                       │
│  ├─> 生成 full.dot (完整图)                                 │
│  └─> 生成 circle.txt (互斥锁/信号量信息)                    │
└─────────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────────┐
│  按钮4: 查看条件节点                                         │
│  └─> 显示完整图（带条件节点）                               │
└─────────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────────┐
│  按钮5: 查看互斥锁 [新功能]                                  │
│  ├─> 解析circle.txt中的互斥量                               │
│  ├─> 分析互斥锁覆盖区域                                     │
│  └─> 生成彩色互斥锁图                                       │
└─────────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────────┐
│  按钮6: 生成信号量图 [新功能]                                │
│  ├─> 解析circle.txt中的信号量                               │
│  ├─> 添加信号量边（虚线）                                   │
│  ├─> 运行Tarjan算法                                         │
│  └─> 生成3种视图（原始/SCC/线程）                           │
└─────────────────────────────────────────────────────────────┘
```

---

## 依赖项

### 必需依赖

```bash
pip install pillow networkx
```

- **pillow**: 图像显示（按钮4-6）
- **networkx**: 图分析（按钮5-6）
  - 图的构建和遍历
  - nx.descendants / nx.ancestors
  - nx.strongly_connected_components

### 系统依赖

- **gcc**: 编译器（按钮2）
- **graphviz**: dot命令（按钮4-6）

```bash
sudo apt install gcc graphviz
```

---

## 使用示例

### 示例1: 完整工作流

```python
from mycallyplus.ui.gui_v3 import MyCallyPlusGUI

# 启动GUI
gui = MyCallyPlusGUI()
gui.mainloop()
```

操作步骤：
1. 点击"选择源文件" → 选择 `produce5/main.c`
2. 点击"生成expand文件" → 自动检测include目录
3. 点击"生成条件节点图" → 生成完整图
4. 点击"查看条件节点" → 查看完整图（带条件）
5. 点击"查看互斥锁" → 查看互斥锁覆盖区域
6. 点击"生成信号量图" → 查看信号量和Tarjan分析

### 示例2: 命令行测试

```bash
# 测试按钮5和按钮6
python test_buttons_5_6.py
```

---

## 技术细节

### 互斥锁分析算法

```python
# 1. 读取DOT文件构建有向图G
G = networkx.DiGraph()

# 2. 对每个互斥锁配对(lock, unlock)
for lock, unlock in mutex_pairs:
    # 3. 计算从lock可达的所有节点
    reach_from_lock = nx.descendants(G, lock)
    
    # 4. 计算可达unlock的所有节点
    reach_to_unlock = nx.ancestors(G, unlock)
    
    # 5. 覆盖区域 = 交集 + lock + unlock
    covered = reach_from_lock & reach_to_unlock | {lock, unlock}
    
    # 6. 生成彩色子图
    subgraph = create_colored_subgraph(covered, color)
```

### Tarjan算法应用

```python
# 1. 原始图G + 信号量边
G_sem = G.copy()
for post, wait in semaphore_pairs:
    G_sem.add_edge(post, wait, style='dashed')

# 2. 运行Tarjan算法
sccs = list(nx.strongly_connected_components(G_sem))

# 3. 可视化
for scc in sccs:
    if len(scc) > 1:  # 非平凡SCC（循环）
        highlight_nodes(scc, color)
```

### 线程分组算法

```python
# 从节点名提取线程信息
for node in G.nodes():
    if '_' in node:
        thread = node.split('_')[0]  # 例如: thread1_xxx → thread1
    else:
        thread = 'main'
    
    thread_map[thread].append(node)

# 为每个线程创建子图
for thread, nodes in thread_map.items():
    create_subgraph(thread, nodes, color)
```

---

## 故障排除

### 问题1: "需要安装networkx库"

**原因：** 缺少networkx依赖

**解决：**
```bash
pip install networkx
```

### 问题2: "未找到互斥锁配对信息"

**原因：** circle.txt中没有"互斥量"部分

**解决：**
1. 检查circle.txt是否存在
2. 确认文件中有"互斥量"标题
3. 确认互斥锁数据格式正确

### 问题3: "节点不存在"

**原因：** circle.txt中的节点名与DOT文件不匹配

**解决：**
1. 检查circle.txt和DOT文件是否匹配
2. 确认节点名称一致
3. 重新生成条件节点图（按钮3）

### 问题4: 信号量图未生成

**原因：** circle.txt中没有"信号量"部分

**解决：**
1. 检查circle.txt中是否有"信号量"标题
2. 确认信号量数据格式正确

---

## 输出文件结构

```
work_dir/
├── debug/
│   ├── 20250123_123456_full.dot          # 按钮3生成
│   ├── 20250123_123456_full.json         # 按钮3生成
│   ├── circle.txt                         # 互斥锁/信号量数据
│   │
│   ├── 查看互斥锁/                        # 按钮5生成
│   │   ├── mutex.dot
│   │   └── mutex.png
│   │
│   └── 生成信号量图/                      # 按钮6生成
│       ├── original.dot
│       ├── original.png
│       ├── tarjan.dot
│       ├── tarjan.png
│       ├── threads.dot
│       └── threads.png
```

---

## 参考实现

本实现参考了 `test/dag_describe.py` 中的 `TarjanGUI` 类：

- **互斥锁分析**: `_prepare_mutex_data()`
- **信号量分析**: `_parse_semaphore_pairs()`
- **Tarjan算法**: `_run_tarjan_from_intermediate()`
- **线程分组**: `_generate_threads_from_intermediate()`

---

## 更新日志

### v3.5 (2025-01-23)

**新增功能：**
- ✅ 按钮5: 查看互斥锁
  - 互斥锁配对解析
  - 覆盖区域分析（graph reachability）
  - 彩色子图可视化
  
- ✅ 按钮6: 生成信号量图
  - 信号量配对解析
  - 信号量边添加（虚线）
  - Tarjan强连通分量分析
  - 多视图生成（原始/SCC/线程）

**技术改进：**
- 添加 networkx 依赖
- 添加 MutexRecord 和 SemRecord 数据类
- 实现图分析辅助方法
- 支持可选的行号和文件名解析

### v3.4 (2025-01-22)

**功能改进：**
- ✅ 智能include检测（5种路径）
- ✅ 使用mycallypro完整视图
- ✅ Include路径去重修复

### v3.3 (2025-01-21)

**初始版本：**
- ✅ 按钮1-3: 基础工作流
- ✅ 按钮4: 查看条件节点

---

## 联系方式

如有问题或建议，请参考：
- 项目文档：`文档/mycally_gpt交互规范_v1.0.txt`
- 架构说明：`mycallypro/ARCHITECTURE_CN.md`
- 测试脚本：`test_buttons_5_6.py`
