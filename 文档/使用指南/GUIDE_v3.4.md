# GUI v3.4 使用指南

## 🎉 新功能

### 1. 智能Include路径检测
自动检测并使用项目的头文件目录，支持复杂项目结构。

### 2. 完整视图生成
"查看条件节点"现在使用mycallypro完整视图，同时包含线程补边和条件节点。

---

## 🚀 快速开始

### 测试produce5项目

```bash
cd /home/chove/桌面/cally

# 运行改进测试
python3 test_v3.4_improvements.py

# 启动GUI
python3 -m mycallyplus
```

---

## 📖 按钮功能详解

### 按钮1: 选择源文件 ✨新增智能检测

**工作流程**:
```
1. 选择源文件 (如 produce5/main.c)
   ↓
2. 自动检测include目录
   ✅ produce5/include/
   ✅ produce5/includes/
   ✅ ../include/
   ✅ ../includes/
   ✅ produce5/inc/
   ↓
3. 查找已有expand文件
   ✅ 找到 → 直接使用
   ❌ 未找到 → GCC编译
   ↓
4. 复制到工作目录
```

**支持的项目结构**:
```
项目A/              项目B/              项目C/
├── main.c          ├── src/            ├── code/
└── include/        │   └── main.c      │   └── main.c
    └── task.h      └── include/        ├── inc/
                        └── task.h      └── include/
```

**输出示例**:
```
⚙️  未找到已有expand文件，尝试使用gcc编译...
   📁 检测到include目录: produce5/include
   🔨 GCC命令: gcc -O0 -fdump-rtl-expand -I /path/to/include -c main.c -o main.o
✅ 编译成功
```

---

### 按钮3: 查看条件节点 ✨改进逻辑

**新逻辑**:
```python
# v3.3 旧方法
legacy --conditions-only  # 只有条件节点，无线程补边

# v3.4 新方法  
mycallypro <expand>       # 完整视图：条件节点 + 线程补边
```

**生成的图对比**:

**旧方法输出** (41行):
```dot
"main" -> "if/malloc";
"if/malloc" [style=dashed]
"if/malloc" -> "fprintf";
```

**新方法输出** (87行):
```dot
"main" -> "threadtask5";
"while/threadtask5" -> "main/while/malloc2";
"main/while/malloc2" [style=dashed]
"main/while/malloc2" -> "main/fprintf3";
"main/fprintf3" -> "main/pthread_create4";
"main/pthread_create4" -> "threadtask1";
```

**优势**:
- ✅ 保留线程结构（与按钮2一致）
- ✅ 显示条件前缀（if/while/switch）
- ✅ 更完整的调用关系

---

## 🔍 详细对比

### Include检测改进

| 特性 | v3.3 | v3.4 |
|-----|------|------|
| 检测路径数 | 3个 | 5个 |
| 去重检查 | ❌ | ✅ |
| 详细输出 | ❌ | ✅ |
| 列出头文件 | ❌ | ✅ |

**v3.3检测路径**:
```python
include/
includes/
../include/
```

**v3.4检测路径**:
```python
include/      # 同级
includes/     # 同级
../include/   # 上级
../includes/  # 上级
inc/          # 同级（新增）
```

---

### 条件节点生成对比

| 指标 | Legacy --conditions-only | Mycallypro完整视图 |
|-----|-------------------------|-------------------|
| 输出行数 | 41 | 87 |
| 条件节点 | 34个 | 42个 |
| 线程节点 | 29个 | 76个 |
| 线程补边 | ❌ 无 | ✅ 有 |
| pthread_create | ❌ 丢失部分 | ✅ 完整 |
| pthread_join | ❌ 丢失部分 | ✅ 完整 |

**结论**: v3.4生成的图更完整、更准确

---

## 📂 文件输出

### 按钮1输出
```
mycallypro/中间结果/main/rtl文件/
└── main.c.233r.expand  ← 从源目录复制或编译生成
```

### 按钮3输出
```
mycallypro/
├── 配置文件/main.c/
│   ├── main.c_full.dot      ← 完整视图DOT
│   └── circle.txt           ← 配置文件
└── 中间结果/main/查看条件节点/
    ├── conditions.dot       ← 从配置文件复制
    └── conditions.png       ← PNG图像
```

---

## 🧪 测试示例

### 测试1: produce5项目

```bash
# 进入项目目录
cd /home/chove/桌面/cally

# 运行测试脚本
python3 test_v3.4_improvements.py
```

**预期输出**:
```
======================================================================
  测试1: Include路径智能检测
======================================================================
✅ 找到: produce5/include
   - task.h

======================================================================
  测试2: 完整视图生成（mycallypro不带--threads-only）
======================================================================
✅ 生成成功
   总行数: 87
   条件节点: 42 个
   线程节点: 76 个

🎉 所有测试通过！
```

### 测试2: 手动验证

```bash
# 1. 测试include检测
cd mycallypro/源文件/produce5
ls include/  # 应该看到 task.h

# 2. 测试完整视图生成
python3 -m mycallypro \
  mycallypro/中间结果/main/rtl文件/main.c.233r.expand \
  | grep -E "threadtask|/if/|/while/|/switch" | wc -l
# 应该显示较大的数字（表示包含线程和条件节点）

# 3. 对比legacy模式
python3 -m mycallyplus.generation.legacy \
  --conditions-only \
  mycallypro/中间结果/main/rtl文件/main.c.233r.expand \
  | grep -E "threadtask|/if/|/while/|/switch" | wc -l
# 应该显示较小的数字（只有条件节点）
```

---

## 🐛 故障排除

### Q1: Include检测失败？

**问题**: 输出显示"未找到include目录"

**解决**:
1. 检查include目录是否存在
   ```bash
   ls -la mycallypro/源文件/produce5/include/
   ```

2. 如果include在其他位置，手动指定
   ```bash
   gcc -O0 -fdump-rtl-expand -I /custom/path/include -c main.c
   ```

3. 将生成的expand文件放到源文件目录
   ```bash
   mv main.c.233r.expand mycallypro/源文件/produce5/
   ```

---

### Q2: 完整视图生成失败？

**问题**: 点击"查看条件节点"报错

**检查**:
1. 确认expand文件存在
   ```bash
   ls mycallypro/中间结果/main/rtl文件/main.c.233r.expand
   ```

2. 手动测试mycallypro命令
   ```bash
   python3 -m mycallypro \
     mycallypro/中间结果/main/rtl文件/main.c.233r.expand
   ```

3. 查看错误信息
   - GUI会显示详细的stderr输出

---

### Q3: Circle.txt为空？

**解答**: 这是正常的！

如果程序没有条件循环（或循环很简单），circle.txt可能为空或只有空行。

**验证**:
```bash
cat mycallypro/配置文件/main.c/circle.txt
# 空文件或空行都是正常的
```

---

## 📊 性能对比

### 编译时间

| 项目 | 文件大小 | Include检测 | GCC编译 | 总时间 |
|-----|---------|-----------|---------|--------|
| 简单C | < 1KB | < 0.1s | < 0.5s | < 1s |
| produce5 | ~2KB | < 0.1s | < 1s | < 2s |
| 大型项目 | > 10KB | < 0.2s | 2-5s | 3-6s |

### 图生成时间

| 操作 | v3.3 | v3.4 | 差异 |
|-----|------|------|------|
| 按钮2 (DAG) | ~1s | ~1s | 无变化 |
| 按钮3 (条件) | ~1s | ~1.5s | +0.5s |

**说明**: v3.4生成更完整的图，时间略有增加但可接受。

---

## ✅ 验收清单

### 安装检查
- [ ] Python 3.8+
- [ ] tkinter可用
- [ ] PIL/Pillow已安装
- [ ] graphviz已安装
- [ ] gcc可用

### 功能检查
- [ ] 按钮1能检测include目录
- [ ] 按钮1能自动编译expand
- [ ] 按钮3生成完整视图
- [ ] 按钮3包含线程和条件节点
- [ ] circle.txt能正常生成

### 测试检查
- [ ] test_v3.4_improvements.py 通过
- [ ] 所有4个测试项都显示✅
- [ ] 无异常或错误

---

## 🎓 技术参考

### mycallypro命令对比

```bash
# 线程视图（按钮2）
python3 -m mycallypro --threads-only <expand>
# 输出: 只有线程节点和函数调用

# 完整视图（按钮3 - v3.4新方法）
python3 -m mycallypro <expand>
# 输出: 线程节点 + 条件节点 + 函数调用

# 条件视图（v3.3旧方法）
python3 -m mycallyplus.generation.legacy --conditions-only <expand>
# 输出: 只有条件节点（无线程补边）
```

### 相关文档
- `CHANGELOG_v3.4.md` - 详细更新日志
- `CHANGELOG_v3.3.md` - 上一版本历史
- `mycallypro/gui.py` - 参考实现

---

**版本**: v3.4  
**最后更新**: 2025-10-29  
**状态**: ✅ 稳定可用
