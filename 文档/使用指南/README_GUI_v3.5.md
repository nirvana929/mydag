# MyCallyPlus GUI v3.5 - 完整版

> **状态**: ✅ 生产就绪 | **版本**: v3.5 | **发布日期**: 2025-01-23

---

## 📋 概述

MyCallyPlus GUI v3.5 是一个完整的C代码静态分析工具，提供从源码到可视化的完整工作流。本版本实现了全部6个功能按钮，包括互斥锁分析和信号量图生成。

### 核心特性

✅ **智能编译** - 自动检测include目录，支持复杂项目结构  
✅ **完整可视化** - 调用图、条件节点、互斥锁、信号量  
✅ **图论分析** - 互斥锁覆盖区域、Tarjan强连通分量  
✅ **多视图展示** - 原始图、SCC分析、线程分组  
✅ **易于使用** - 6按钮工作流，一键式操作  

---

## 🚀 快速开始

### 安装依赖

```bash
# Python包
pip install pillow networkx

# 系统工具
sudo apt install gcc graphviz
```

### 启动GUI

```bash
python -m mycallyplus.ui.gui_v3
```

### 基本使用

1. 点击**"选择源文件"** → 选择你的C源文件
2. 点击**"生成expand文件"** → 自动编译和预处理
3. 点击**"生成条件节点图"** → 生成完整调用图
4. 点击**"查看条件节点"** → 查看可视化结果
5. 点击**"查看互斥锁"** → 分析互斥锁覆盖区域
6. 点击**"生成信号量图"** → Tarjan分析和线程可视化

---

## 📚 详细功能

### 按钮1: 选择源文件

- 打开文件选择对话框
- 支持单个.c文件
- 自动设置工作目录

### 按钮2: 生成expand文件

**智能include检测（5种路径）：**
1. 源文件同目录下的 `include/`
2. 源文件同目录下的 `../include/`
3. 项目根目录的 `include/`
4. Makefile中的include路径
5. 系统include路径

**编译命令：**
```bash
gcc -fdump-tree-all-graph -O0 \
    -I/path/to/include1 \
    -I/path/to/include2 \
    source.c
```

### 按钮3: 生成条件节点图

**使用mycallypro生成完整图：**
```bash
python -m mycallypro expand_file \
    --dot full.dot \
    --json full.json
```

**生成文件：**
- `full.dot` - 完整调用图（带条件节点）
- `full.json` - 结构化数据
- `circle.txt` - 互斥锁和信号量信息

### 按钮4: 查看条件节点

- 将DOT转换为PNG
- 在GUI中显示图像
- 支持滚动和缩放

### 按钮5: 查看互斥锁 ⭐ 新功能

**功能：**
- 解析circle.txt中的互斥量配对
- 使用图论计算互斥锁覆盖区域
- 生成彩色可视化图

**算法：**
```
覆盖区域 = descendants(lock) ∩ ancestors(unlock) ∪ {lock, unlock}
```

**输出：**
- `work_dir/查看互斥锁/mutex.png`

**示例：**
```
互斥量配对1 (mutex_a):
  🔒 thread1_lock1
  📦 thread1_node2
  📦 thread1_node3
  🔓 thread1_unlock1

互斥量配对2 (mutex_b):
  🔒 thread2_lock2
  📦 thread2_node4
  🔓 thread2_unlock2
```

### 按钮6: 生成信号量图 ⭐ 新功能

**功能：**
- 解析circle.txt中的信号量配对
- 添加信号量边（sem_post → sem_wait）
- 运行Tarjan算法分析强连通分量
- 生成3种视图

**算法：**
1. 在原始图上添加信号量边（虚线）
2. 运行 `nx.strongly_connected_components()`
3. 识别循环和死锁风险

**输出文件：**
- `original.png` - 原始图 + 信号量边（橙色虚线）
- `tarjan.png` - 强连通分量标记
- `threads.png` - 按线程分组的视图

**示例：**
```
SCC 1 (可能的死锁):
  thread1_post1 → thread2_wait1
  thread2_post2 → thread1_wait2
  形成循环！
```

---

## 📊 输出文件结构

```
work_dir/
└── debug/
    ├── 20250123_123456_full.dot
    ├── 20250123_123456_full.json
    ├── circle.txt
    │
    ├── 查看互斥锁/
    │   ├── mutex.dot
    │   └── mutex.png
    │
    └── 生成信号量图/
        ├── original.dot    # 原始图+信号量边
        ├── original.png
        ├── tarjan.dot      # Tarjan SCC
        ├── tarjan.png
        ├── threads.dot     # 线程分组
        └── threads.png
```

---

## 🔧 技术细节

### circle.txt格式

**互斥量部分：**
```
互斥量
lock_node unlock_node var_name idx [line_num] [filename]
thread1_lock1 thread1_unlock1 mutex_a 0 10 main.c
thread2_lock2 thread2_unlock2 mutex_b 1 20 main.c
```

**信号量部分：**
```
信号量
post_node wait_node var_name idx [line_num] [filename]
thread1_post1 thread2_wait1 sem_x 0 15 main.c
thread2_post2 thread1_wait2 sem_y 1 25 main.c
```

### 数据结构

```python
@dataclass
class MutexRecord:
    lock: str           # lock节点名
    unlock: str         # unlock节点名
    var: str            # 互斥锁变量名
    idx: int            # 互斥锁ID
    lock_line: int      # lock行号（可选）
    unlock_line: int    # unlock行号（可选）
    lock_file: str      # lock文件名（可选）
    unlock_file: str    # unlock文件名（可选）
    covered: List[str]  # 覆盖的节点列表

@dataclass
class SemRecord:
    post: str          # post节点名
    wait: str          # wait节点名
    var: str           # 信号量变量名
    idx: int           # 信号量ID
    post_line: int     # post行号（可选）
    wait_line: int     # wait行号（可选）
    post_file: str     # post文件名（可选）
    wait_file: str     # wait文件名（可选）
```

### 核心算法

**互斥锁覆盖区域：**
```python
# 从lock可达的所有节点
reach_from_lock = nx.descendants(G, lock)

# 可达unlock的所有节点
reach_to_unlock = nx.ancestors(G, unlock)

# 覆盖区域 = 交集 + lock + unlock
covered = reach_from_lock & reach_to_unlock | {lock, unlock}
```

**Tarjan强连通分量：**
```python
# 添加信号量边
G_sem = G.copy()
for rec in sem_records:
    G_sem.add_edge(rec.post, rec.wait, style='dashed')

# 运行Tarjan
sccs = list(nx.strongly_connected_components(G_sem))

# 非平凡SCC（循环）
cycles = [scc for scc in sccs if len(scc) > 1]
```

---

## 🧪 测试

### 运行自动化测试

```bash
# 测试按钮5和按钮6
python test_buttons_5_6.py
```

### 测试流程

1. ✅ 选择测试文件 `测试示例/produce5/main.c`
2. ✅ 生成expand文件（智能include检测）
3. ✅ 生成条件节点图（mycallypro）
4. ✅ 测试互斥锁分析
5. ✅ 测试信号量图生成
6. ✅ 验证输出文件
7. ✅ 显示测试总结

### 手动测试示例

```python
from mycallyplus.ui.gui_v3 import MyCallyPlusGUI

# 启动GUI
gui = MyCallyPlusGUI()
gui.mainloop()

# 操作：
# 1. 选择 测试示例/produce5/main.c
# 2. 依次点击按钮1→2→3→4→5→6
# 3. 查看生成的图像
```

---

## 📖 文档

### 完整文档列表

1. **GUIDE_v3.5.md** - 详细使用指南
   - 每个按钮的详细说明
   - 完整工作流程图
   - 技术细节和算法
   - 故障排除

2. **CHANGELOG_v3.5.md** - 版本更新日志
   - 新功能详细描述
   - 代码修改统计
   - 向后兼容性说明

3. **README_GUI_v3.5.md** - 本文档
   - 快速开始指南
   - 功能概览
   - 使用示例

---

## ⚠️ 故障排除

### 问题1: "需要安装networkx库"

**解决：**
```bash
pip install networkx
```

### 问题2: "未找到互斥锁配对信息"

**原因：** circle.txt中没有"互斥量"部分

**解决：**
1. 确认按钮3已成功运行
2. 检查 `work_dir/debug/circle.txt` 是否存在
3. 确认文件中有"互斥量"标题

### 问题3: "节点不存在"

**原因：** circle.txt中的节点名与DOT文件不匹配

**解决：**
1. 重新运行按钮3生成新的DOT和circle.txt
2. 确保两个文件来自同一次生成

### 问题4: include检测失败

**解决：**
1. 手动检查项目的include目录位置
2. 在源文件目录创建 `include/` 软链接
3. 或者修改Makefile添加 `-I` 参数

---

## 🎯 使用场景

### 场景1: 多线程程序分析

**目标：** 分析多线程程序的互斥锁和信号量使用

**步骤：**
1. 准备多线程C源代码
2. 使用按钮1-3生成基础图
3. 使用按钮5查看互斥锁保护区域
4. 使用按钮6分析信号量同步
5. 检查Tarjan图中的强连通分量（潜在死锁）

### 场景2: 死锁检测

**目标：** 识别代码中的潜在死锁

**步骤：**
1. 生成信号量图（按钮6）
2. 查看 `tarjan.png` 中的强连通分量
3. 分析循环中的信号量依赖
4. 如果存在 `thread1→thread2→thread1` 循环，可能存在死锁

### 场景3: 代码重构

**目标：** 理解复杂代码结构以便重构

**步骤：**
1. 使用按钮4查看完整调用图
2. 使用按钮5查看互斥锁保护范围
3. 识别可以拆分的代码块
4. 确保重构不会破坏同步逻辑

---

## 🔄 版本历史

### v3.5 (2025-01-23) - 当前版本
- ✅ 按钮5: 查看互斥锁
- ✅ 按钮6: 生成信号量图
- ✅ 完整的6按钮工作流

### v3.4 (2025-01-22)
- ✅ 智能include检测（5种路径）
- ✅ 使用mycallypro完整视图
- ✅ Include路径去重修复

### v3.3 (2025-01-21)
- ✅ 基础GUI框架
- ✅ 按钮1-4实现

---

## 🤝 贡献

### 参考实现

本项目参考了 `test/dag_describe.py` 的实现：
- 互斥锁分析算法
- Tarjan SCC算法
- 线程分组可视化

### 改进建议

如果你有改进建议：
1. 测试新功能
2. 报告bug
3. 提出功能请求
4. 贡献代码

---

## 📝 许可证

请参考项目根目录的LICENSE文件。

---

## 📞 联系方式

- **项目文档**: `文档/mycally_gpt交互规范_v1.0.txt`
- **架构说明**: `mycallypro/ARCHITECTURE_CN.md`
- **测试脚本**: `test_buttons_5_6.py`

---

## 🎉 总结

GUI v3.5 提供了完整的C代码静态分析工具链：

1. **编译预处理** - 智能include检测
2. **调用图生成** - mycallypro完整视图
3. **条件节点** - 控制流可视化
4. **互斥锁分析** - 覆盖区域计算
5. **信号量分析** - Tarjan SCC + 死锁检测
6. **多视图展示** - 原始/SCC/线程分组

这是一个功能完整、易于使用的生产就绪工具！🚀

---

**快速链接：**
- [安装](#-快速开始)
- [使用指南](#-详细功能)
- [测试](#-测试)
- [文档](#-文档)
- [故障排除](#️-故障排除)
