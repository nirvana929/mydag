# Mycallyplus GUI v3.0 使用说明

## 设计概述

v3.0采用**状态区驱动**设计，所有操作按顺序手动执行，文件状态通过状态区实时显示。

## 界面布局

```
┌─────────────────────────────────────────────────────────────┐
│  Mycallyplus v3.0 - 状态区驱动                              │
├──────────┬──────────────────────────────────────────────────┤
│          │  ┌─────────────────────────────────────────┐     │
│  操作    │  │  状态区 - 当前已加载文件                │     │
│          │  ├─────────────────────────────────────────┤     │
│ 1.选择源 │  │  源文件:      main.c                    │     │
│   文件   │  │  Expand文件:  main.c.233r.expand        │     │
│          │  │  DOT文件:     conditions.dot            │     │
│ 2.生成dag│  │  配置文件:    circle.txt                │     │
│   图     │  └─────────────────────────────────────────┘     │
│          │                                                   │
│ 3.查看条 │  ┌─────────────────────────────────────────┐     │
│   件节点 │  │                                         │     │
│          │  │                                         │     │
│ 4.选择配 │  │          图片显示区（Canvas）           │     │
│   置文件 │  │                                         │     │
│          │  │                                         │     │
│ 5.查看互 │  └─────────────────────────────────────────┘     │
│   斥锁   │                                                   │
│          │                                                   │
│ 6.生成信 │                                                   │
│   号量图 │                                                   │
└──────────┴───────────────────────────────────────────────────┘
```

## 功能流程

### 按钮1：选择源文件
**操作**: 点击按钮 → 选择.c文件

**功能**:
1. 加载源文件到状态区
2. 创建工作目录: `mycallypro/中间结果/<basename>/`
3. 创建子目录: rtl文件、配置文件、生成dag图、查看条件节点、查看互斥锁图、生成信号量图、debug、images、logs、temp
4. 编译生成expand文件 → `mycallypro/中间结果/<basename>/rtl文件/`
5. expand文件加载到状态区

**状态区更新**:
- 源文件: `main.c`
- Expand文件: `main.c.233r.expand`

---

### 按钮2：生成dag图
**前置条件**: 已选择源文件

**操作**: 点击按钮

**功能**:
1. 读取状态区的expand文件
2. 调用legacy `--threads-only --output-base mycallypro`
3. 从 `mycallypro/配置文件/<basename>/` 复制 `<basename>_threads.dot`
4. 保存到 `mycallypro/中间结果/<basename>/生成dag图/dag.dot`
5. 生成PNG并显示

**状态区更新**:
- DOT文件: `dag.dot` *(新文件)*

---

### 按钮3：查看条件节点
**前置条件**: 已选择源文件

**操作**: 点击按钮

**功能**:
1. 读取状态区的expand文件
2. **步骤A**: 生成dot文件
   - 调用legacy `--conditions-only --output-base mycallypro`
   - 从 `mycallypro/配置文件/<basename>/` 获取 `<basename>_full.dot`
   - 保存到两个位置:
     - `mycallypro/中间结果/<basename>/查看条件节点/conditions.dot`
     - `mycallypro/配置文件/<basename>/` (已在此处)
   - 生成PNG并显示
3. **步骤B**: 生成txt文件
   - 调用legacy `--export-txt --output-base mycallypro`
   - 生成 `mycallypro/配置文件/<basename>/circle.txt`

**状态区更新**:
- DOT文件: `conditions.dot` *(替换旧的)*
- 配置文件: `circle.txt` *(新文件)*

---

### 按钮4：选择配置文件
**操作**: 点击按钮 → 选择文件夹

**功能**:
1. 自动扫描文件夹中的 `.dot` 和 `.txt` 文件
2. 加载到状态区（同类型文件新的替换旧的）
3. 如果有dot文件，尝试生成并显示PNG

**状态区更新**:
- DOT文件: `<found>.dot` *(替换)*
- 配置文件: `<found>.txt` *(替换)*

---

### 按钮5：查看互斥锁
**前置条件**: 状态区有DOT文件和配置文件

**操作**: 点击按钮

**功能**:
1. 读取状态区的 dot + txt 文件
2. 分析互斥锁
3. 生成图片 → `mycallypro/中间结果/<basename>/查看互斥锁图/`
4. 显示图片

**状态区更新**: 无（不加载新文件）

---

### 按钮6：生成信号量图
**前置条件**: 状态区有DOT文件和配置文件

**操作**: 点击按钮

**功能**:
1. 读取状态区的 dot + txt 文件
2. 分析信号量
3. 生成图片 → `mycallypro/中间结果/<basename>/生成信号量图/`
4. 显示图片

**状态区更新**: 无（不加载新文件）

---

## 文件结构示例

```
mycallypro/
├── 中间结果/
│   └── main/                    # basename
│       ├── rtl文件/
│       │   └── main.c.233r.expand
│       ├── 配置文件/
│       ├── 生成dag图/
│       │   ├── dag.dot
│       │   └── dag.png
│       ├── 查看条件节点/
│       │   ├── conditions.dot
│       │   └── conditions.png
│       ├── 查看互斥锁图/
│       │   └── mutex_*.png
│       ├── 生成信号量图/
│       │   └── semaphore_*.png
│       ├── debug/
│       ├── images/
│       ├── logs/
│       └── temp/
└── 配置文件/
    └── main/                    # legacy生成位置
        ├── main_threads.dot     # 按钮2生成
        ├── main_full.dot        # 按钮3生成
        └── circle.txt           # 按钮3生成
```

## 状态区逻辑

### 文件替换规则
- **同类型文件**: 新的替换旧的
  - DOT文件: 只保留最新的一个（dag.dot → conditions.dot）
  - 配置文件: 只保留最新的一个

### 显示格式
```
源文件:      main.c
Expand文件:  main.c.233r.expand
DOT文件:     conditions.dot
配置文件:    circle.txt
```

## 使用场景示例

### 场景1：完整流程
```
1. 点击"选择源文件" → 选择 main.c
   状态区: 源文件:main.c, Expand:main.c.233r.expand

2. 点击"生成dag图"
   状态区: DOT:dag.dot
   显示: dag.png

3. 点击"查看条件节点"
   状态区: DOT:conditions.dot, 配置:circle.txt
   显示: conditions.png

4. 点击"查看互斥锁"
   显示: 互斥锁图

5. 点击"生成信号量图"
   显示: 信号量图
```

### 场景2：使用已有配置
```
1. 点击"选择配置文件" → 选择文件夹
   状态区: DOT:xxx.dot, 配置:circle.txt

2. 点击"查看互斥锁"
   显示: 互斥锁图

3. 点击"生成信号量图"
   显示: 信号量图
```

## 启动方式

```bash
# 方式1: 通过模块启动
cd ~/桌面/cally
python3 -m mycallyplus

# 方式2: 直接运行
cd ~/桌面/cally
python3 mycallyplus/ui/gui_v3.py
```

## 注意事项

1. **手动逐步操作**: 不再有自动生成，所有功能需要手动点击
2. **状态区依赖**: 后续按钮依赖状态区中的文件
3. **文件替换**: 同类型文件会被新文件替换
4. **工作目录**: 所有文件生成在 `mycallypro/中间结果/<basename>/`
5. **配置目录**: legacy临时文件在 `mycallypro/配置文件/<basename>/`
