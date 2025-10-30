# Mycallyplus GUI v3.0 升级完成总结

## 升级日期
2025年10月29日

## 核心改进

### 1. 状态区驱动设计 ✨
- **新增状态区**: 位于右侧显示区上方，实时显示已加载文件
- **文件管理**: 同类型文件新的替换旧的（DOT文件互相替换）
- **清晰可见**: 用户随时知道当前使用哪些文件

### 2. 手动逐步操作 🎯
- **取消自动生成**: 不再一键生成所有，改为手动逐步点击
- **6个按钮**: 按顺序手动执行，流程清晰
- **可控性强**: 每一步都在用户掌控之中

### 3. 文件存储规范 📁
- **工作区统一**: 所有文件生成在 `mycallypro/中间结果/<basename>/`
- **目录结构**: 参考 `produce` 文件夹格式
- **配置分离**: legacy临时文件在 `mycallypro/配置文件/<basename>/`

## 新增功能

### FileState类
```python
class FileState:
    """文件状态管理"""
    - source_file: .c 文件
    - expand_file: .233r.expand 文件
    - dot_file: .dot 文件（最新的）
    - txt_file: circle.txt 文件
    - work_dir: 工作目录
```

### 6个功能按钮

| 按钮 | 功能 | 输入 | 输出 | 状态区更新 |
|------|------|------|------|------------|
| 1️⃣ 选择源文件 | 选择C文件，编译生成expand | 用户选择 | expand文件 | 源文件、Expand文件 |
| 2️⃣ 生成dag图 | 生成线程DAG图 | 状态区expand | dag.dot | DOT文件(新) |
| 3️⃣ 查看条件节点 | 生成完整DAG+配置文件 | 状态区expand | conditions.dot + circle.txt | DOT文件(替换)、配置文件 |
| 4️⃣ 选择配置文件 | 加载文件夹中的配置 | 用户选择文件夹 | 自动扫描 | DOT文件、配置文件 |
| 5️⃣ 查看互斥锁 | 分析互斥锁 | 状态区dot+txt | PNG图片 | 无 |
| 6️⃣ 生成信号量图 | 分析信号量 | 状态区dot+txt | PNG图片 | 无 |

## 文件路径设计

### 工作目录结构
```
mycallypro/中间结果/<basename>/
├── rtl文件/              # expand文件
├── 配置文件/             # （预留）
├── 生成dag图/            # dag.dot, dag.png
├── 查看条件节点/         # conditions.dot, conditions.png
├── 查看互斥锁图/         # mutex图片
├── 生成信号量图/         # semaphore图片
├── debug/
├── images/
├── logs/
└── temp/
```

### Legacy输出目录
```
mycallypro/配置文件/<basename>/
├── <basename>_threads.dot   # --threads-only
├── <basename>_full.dot      # --conditions-only
└── circle.txt               # --export-txt
```

## 状态区设计

### 显示格式
```
┌─────────────────────────────────┐
│ 状态区 - 当前已加载文件         │
├─────────────────────────────────┤
│ 源文件:      main.c             │
│ Expand文件:  main.c.233r.expand │
│ DOT文件:     conditions.dot     │
│ 配置文件:    circle.txt         │
└─────────────────────────────────┘
```

### 更新逻辑
- ✅ 新文件加载 → 直接显示
- ✅ 同类型文件 → 新的替换旧的
- ✅ 颜色区分 → 已加载(黑色)、未加载(灰色)

## 使用流程

### 完整流程示例
```
步骤1: 选择源文件 (main.c)
  ↓ 编译
  状态区: 源文件:main.c, Expand:main.c.233r.expand

步骤2: 生成dag图
  ↓ legacy --threads-only
  状态区: DOT:dag.dot
  显示: dag.png

步骤3: 查看条件节点
  ↓ legacy --conditions-only → --export-txt
  状态区: DOT:conditions.dot (替换), 配置:circle.txt
  显示: conditions.png

步骤4: 查看互斥锁
  ↓ 读取 dot + txt
  显示: 互斥锁图

步骤5: 生成信号量图
  ↓ 读取 dot + txt
  显示: 信号量图
```

## 技术实现

### 核心类
- `FileState`: 文件状态管理
- `MycallyplusGUIv3`: 主GUI类

### 关键方法
```python
# 状态更新
_update_status_display()

# 按钮功能
select_source_file()      # 按钮1
generate_dag()            # 按钮2
view_conditions()         # 按钮3
select_config_folder()    # 按钮4
view_mutex()              # 按钮5 (待完善)
generate_semaphore()      # 按钮6 (待完善)

# 辅助功能
_compile_to_expand()      # 编译C文件
_display_image()          # 显示图片
```

## 待完善功能

### 5. 查看互斥锁
- [ ] 实现互斥锁分析逻辑
- [ ] 生成互斥锁图
- [ ] 保存到正确目录

### 6. 生成信号量图
- [ ] 实现信号量分析逻辑
- [ ] 生成信号量图
- [ ] 保存到正确目录

## 文件清单

### 新增文件
```
mycallyplus/ui/gui_v3.py              # 新GUI实现
GUI_v3_使用说明.md                     # 用户手册
test_gui_v3_state.py                  # 状态测试
```

### 修改文件
```
mycallyplus/cli.py                    # 更新入口
```

### 测试文件
```
test_mycallypro_paths.py              # 路径测试
test_gui_v3_state.py                  # 状态测试
```

## 启动方式

```bash
# 方式1: 模块启动（推荐）
cd ~/桌面/cally
python3 -m mycallyplus

# 方式2: 直接启动
cd ~/桌面/cally
python3 mycallyplus/ui/gui_v3.py
```

## 验证测试

### 测试1: FileState类 ✅
```bash
python3 test_gui_v3_state.py
# 结果: 所有状态管理逻辑正常
```

### 测试2: 路径配置 ✅
```bash
python3 test_mycallypro_paths.py
# 结果: mycallypro路径正确
```

### 测试3: GUI运行
```bash
python3 -m mycallyplus
# 需要在图形界面环境测试
```

## 优势总结

### 相比v2.0
| 特性 | v2.0 | v3.0 |
|------|------|------|
| 生成方式 | 一键自动 | 手动逐步 |
| 状态显示 | 状态栏文本 | 专用状态区 |
| 文件管理 | 隐式 | 显式（状态区） |
| 操作流程 | 自动化 | 可控化 |
| 用户体验 | 快速但不透明 | 清晰且可控 |

### 核心亮点 ✨
1. **状态区可视化**: 随时知道使用哪些文件
2. **手动可控**: 每一步都在掌控中
3. **文件替换**: 新文件自动替换旧文件
4. **统一存储**: mycallypro工作区
5. **流程清晰**: 6个按钮按顺序操作

## 下一步计划

1. **完善按钮5**: 实现互斥锁分析
2. **完善按钮6**: 实现信号量分析
3. **图形界面测试**: 在图形环境测试GUI
4. **用户反馈**: 收集使用体验
5. **功能优化**: 根据反馈调整

## 结论

✅ GUI v3.0已完成核心功能重构
✅ 状态区驱动设计实现
✅ 手动逐步操作流程完成
✅ 文件存储规范统一
⏳ 互斥锁和信号量功能待完善

---

**开发完成时间**: 2025年10月29日  
**版本**: v3.0  
**状态**: 核心功能完成，部分功能待完善
