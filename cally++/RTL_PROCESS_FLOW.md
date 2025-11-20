# RTL 处理流程说明

## 概述

Cally++ 从 C++ 源代码生成调用图的完整流程已经升级，采用了新的处理顺序：**RTL 生成 → 去改编 → 过滤 → 解析 → 生成图**

**关键特性：**
- ✅ 所有中间文件均以 `.expand` 结尾，便于识别和管理
- ✅ 支持从任意阶段的 expand 文件开始生成图
- ✅ 智能检测文件类型，自动跳过已完成的步骤

## 新流程架构

### 处理顺序

```
源文件 (.cpp)
    ↓
[Step 1] RTL 生成
    ↓
原始 RTL (.expand, ~128KB)
    ↓
[Step 2] 符号去改编
    ↓
去改编 RTL (.demangled.expand, ~136KB)  ← 可从这里开始
    ↓
[Step 3] RTL 过滤
    ↓
过滤后 RTL (.filtered.expand, ~29KB)    ← 也可从这里开始
    ↓
[Step 4] RTL 解析
    ↓
调用图数据结构
    ↓
[Step 5] DOT 生成
    ↓
调用图 (.dot, .png)
```

### 文件说明

1. **源文件**: `produce5.cpp` (5.3KB)
   - C++ 源代码

2. **原始 RTL**: `produce5.cpp.233r.expand` (128KB)
   - GCC 编译生成的 RTL 中间表示
   - 包含改编的符号（如 `_Z11threadTask1Pv`）
   - 包含大量编译器内部信息

3. **去改编 RTL**: `produce5.cpp.233r.demangled.expand` (136KB)
   - 符号已经转换为可读形式（如 `threadTask1(void*)`）
   - 保留完整的 RTL 信息
   - 文件稍大是因为可读符号更长
   - **可作为输入直接生成图**

4. **过滤后 RTL**: `produce5.cpp.233r.filtered.expand` (29KB)
   - 只保留函数定义和函数调用信息
   - 过滤掉了 92% 的内容（从 3227 行减少到 256 行）
   - 符号保持可读形式
   - **可作为输入直接生成图**

## 关键改进

### 旧流程的问题

```
RTL 生成 → 过滤 → 解析+去改编
```

**缺点：**
- 中间文件（过滤后的 RTL）包含改编符号，不易人工查看
- 去改编逻辑嵌入在解析器中，耦合度高
- 没有保存去改编后的完整 RTL 文件
- 不支持从中间阶段开始生成图

### 新流程的优势

```
RTL 生成 → 去改编 → 过滤 → 解析
```

**优点：**
1. **中间文件可读性强**：所有中间文件都包含可读符号且以 `.expand` 结尾
2. **模块化设计**：去改编逻辑独立为 `rtl_demangler.py` 模块
3. **完整性**：保存了三个版本的 RTL 文件，便于调试和分析
4. **解析器简化**：RTLParser 不再需要去改编功能（enable_demangle=False）
5. **灵活性高**：支持从任意阶段的 expand 文件开始生成图

### 智能文件检测

系统会自动检测 expand 文件的类型：

| 文件名格式 | 检测结果 | 执行步骤 |
|-----------|---------|---------|
| `*.233r.expand` | 原始 RTL | 去改编 → 过滤 → 解析 → 生成图 |
| `*.demangled.expand` | 已去改编 | 过滤 → 解析 → 生成图 |
| `*.filtered.expand` | 已过滤 | 解析 → 生成图 |

**使用场景：**
- 调试时可以从任意阶段重新开始
- 修改过滤规则后，可以直接使用 `.demangled.expand` 重新过滤
- 多次生成不同的图时，可以重复使用 `.filtered.expand`

## 技术实现

### 核心模块

1. **rtl_generator.py**
   - 从 C++ 源文件生成 RTL
   - 使用 `g++ -fdump-rtl-expand`

2. **rtl_demangler.py** (新增)
   - 独立的去改编模块
   - 使用 `c++filt` 或 `llvm-cxxfilt` 工具
   - 支持批量符号缓存
   - 正则匹配改编符号：`r'\b(_Z[a-zA-Z0-9_]+)\b'`

3. **rtl_rewriter.py**
   - 串联去改编及其他 rewrite 规则
   - 产出可读的 RTL 文件供后续步骤使用

4. **rtl_filter.py**
   - 从 RTL 中提取函数调用关系
   - 过滤掉不相关的编译器信息

5. **rtl_parser.py**
   - 解析过滤后的 RTL，构建调用图
   - 现在不需要去改编（符号已可读）

6. **generate.py**
   - 主控脚本，协调整个流程

## 使用示例

### 从源文件一键生成（推荐）

```bash
python3 generate.py --source produce5.cpp --caller main --simplify-cxx
```

### 从原始 expand 文件生成（完整流程）

```bash
python3 generate.py --expand produce5.cpp.233r.expand --caller main
```
输出：
- `produce5.cpp.233r.demangled.expand` (去改编)
- `produce5.cpp.233r.filtered.expand` (过滤)
- DOT 和 PNG 文件

### 从去改编的 expand 文件生成（跳过去改编）

```bash
python3 generate.py --expand produce5.cpp.233r.demangled.expand --caller main
```
输出：
- `produce5.cpp.233r.filtered.expand` (过滤)
- DOT 和 PNG 文件

### 从过滤后的 expand 文件直接生成图（最快）

```bash
python3 generate.py --expand produce5.cpp.233r.filtered.expand --caller main
```
输出：
- 仅生成 DOT 和 PNG 文件

### 调试模式

```bash
python3 generate.py --source produce5.cpp --caller main --debug
```

## 输出文件

### RTL 相关文件（所有均为 .expand 格式）

```
source/produce5_cpp/
├── produce5.cpp                              # 源文件 (5.3KB)
├── produce5.cpp.233r.expand                  # 原始 RTL (128KB)
├── produce5.cpp.233r.demangled.expand        # 去改编 RTL (136KB) ← 可作为输入
└── produce5.cpp.233r.filtered.expand         # 过滤后 RTL (29KB)  ← 可作为输入
```

### 调用图文件

```
config/produce5_cpp/
├── produce5.cpp.dot                          # 完整调用图 DOT
└── produce5.cpp_simple.dot                   # 简化调用图 DOT

img/produce5_cpp/
├── produce5.cpp_caller.png                   # 完整调用图 PNG (92KB)
└── produce5.cpp_caller_simple.png            # 简化调用图 PNG (27KB)
```

## 性能统计

### 去改编统计

- 发现符号：29 个
- 成功去改编：29/29 (100%)
- 文件增长：128KB → 136KB (+6%)

示例符号转换：
```
_Z11threadTask1Pv → threadTask1(void*)
_ZL13simulate_workPKci → simulate_work(char const*, int)
_ZSt4cout → std::cout
```

### 过滤统计

- 原始行数：3227 行
- 过滤后行数：256 行
- 压缩比：92.1%
- 文件减小：136KB → 29KB (-79%)

### 解析统计

- 解析函数数：18 个
- 生成节点数：10 个（用户函数）
- 生成边数：11 条（调用关系）

## 工作流程示例

### 场景1：首次生成调用图

```bash
# 从源文件生成
python3 generate.py --source produce5.cpp --caller main

# 生成的文件：
# - produce5.cpp.233r.expand
# - produce5.cpp.233r.demangled.expand
# - produce5.cpp.233r.filtered.expand
# - produce5.cpp.dot
# - produce5.cpp_caller.png
```

### 场景2：修改过滤规则后重新生成

```bash
# 直接使用去改编的 expand 文件，避免重新去改编
python3 generate.py --expand produce5.cpp.233r.demangled.expand --caller main

# 只需重新执行：
# - 过滤步骤
# - 解析步骤
# - 生成图步骤
```

### 场景3：生成不同根函数的调用图

```bash
# 使用过滤后的 expand 文件，直接生成不同的图
python3 generate.py --expand produce5.cpp.233r.filtered.expand --caller threadTask1
python3 generate.py --expand produce5.cpp.233r.filtered.expand --caller threadTask2
python3 generate.py --expand produce5.cpp.233r.filtered.expand --full

# 最快速度，避免重复处理
```

## 调试技巧

### 查看去改编后的符号

```bash
head -n 50 produce5.cpp.233r.demangled.expand | grep "Function"
```

### 比较改编前后

```bash
# 改编符号
grep "_Z" produce5.cpp.233r.expand | head -n 5

# 去改编符号
grep "Function" produce5.cpp.233r.demangled.expand | head -n 5
```

### 验证过滤效果

```bash
wc -l produce5.cpp.233r.demangled.expand
wc -l produce5.cpp.233r.filtered.expand
```

### 检查所有生成的 expand 文件

```bash
ls -lh source/produce5_cpp/*.expand
```

### 快速查看文件类型

```bash
# 原始 RTL - 包含 _Z 开头的改编符号
grep "_Z" produce5.cpp.233r.expand | head -n 3

# 去改编 RTL - 函数名可读
grep "Function" produce5.cpp.233r.demangled.expand | head -n 3

# 过滤后 RTL - 仅包含函数调用信息，体积小
wc -l produce5.cpp.233r.filtered.expand
```

## 未来改进

1. 支持增量去改编（只处理新增符号）
2. 添加符号缓存持久化（避免重复去改编）
3. 支持自定义去改编工具（如 `addr2line`）
4. 添加 RTL 文件版本兼容性检查

## 相关文档

- [使用指南](文档/使用指南/RTL_expand_guide.md)
- [架构设计](mycallypro/ARCHITECTURE_CN.md)
- [完整功能指南](mycallyplus/FULL_FEATURE_GUIDE_CN.md)
