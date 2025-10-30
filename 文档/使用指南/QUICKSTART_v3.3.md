# GUI v3.3 快速启动指南

## 🚀 快速开始

### 1. 启动GUI
```bash
cd /home/chove/桌面/cally
python3 -m mycallyplus
```

### 2. 测试所有功能
```bash
# 运行完整测试
python3 test_gui_all_buttons.py

# 查看测试报告
python3 test_report_v3.3.py
```

---

## 📖 使用步骤

### 步骤1: 选择源文件 (按钮1)
1. 点击 **「1. 选择源文件」**
2. 浏览到 `mycallypro/源文件/produce5/`
3. 选择 `main.c`

**预期结果**:
- ✅ 自动检测到 `main.c.233r.expand`
- ✅ 复制到 `中间结果/main/rtl文件/`
- ✅ 状态区显示文件路径

---

### 步骤2: 生成DAG图 (按钮2)
1. 点击 **「2. 生成dag图」**
2. 等待Legacy处理（约1秒）

**预期结果**:
- ✅ 生成 `配置文件/main.c/main.c_threads.dot`
- ✅ 复制到 `中间结果/main/生成dag图/dag.dot`
- ✅ 生成并显示 `dag.png`

**生成的图包含**:
- 线程节点: `main`, `threadtask1-5`
- 函数调用: `pthread_create`, `pthread_join`
- 标准库调用: `printf`, `malloc`, `free`

---

### 步骤3: 查看条件节点 (按钮3)
1. 点击 **「3. 查看条件节点」**
2. 等待Legacy处理（约1秒）

**预期结果**:
- ✅ 生成 `配置文件/main.c/main.c_full.dot`
- ✅ 生成 `配置文件/main.c/circle.txt`
- ✅ 复制到 `中间结果/main/查看条件节点/conditions.dot`
- ✅ 生成并显示 `conditions.png`

**生成的图包含**:
- 所有线程调用（同dag图）
- 条件前缀节点: `if`, `while`, `switch`
- 虚线表示条件分支

---

### 步骤4: 选择配置文件夹 (按钮4)
1. 点击 **「4. 选择配置文件夹」**
2. 浏览到 `mycallypro/配置文件/main.c/`
3. 选择该文件夹

**预期结果**:
- ✅ 加载已有的DOT文件
- ✅ 加载circle.txt配置
- ✅ 状态区更新

**文件夹包含**:
```
配置文件/main.c/
├── main.c.233r.expand     (expand文件备份)
├── main.c_threads.dot     (线程DAG)
├── main.c_full.dot        (完整DAG)
└── circle.txt             (配置文件)
```

---

## 🔍 常见问题

### Q1: 编译expand文件失败？
**A**: produce5/main.c已有expand文件，会自动使用。如果没有：
```bash
cd mycallypro/源文件/produce5
gcc -O0 -fdump-rtl-expand -I include/ -c main.c -o main.o
# 会生成 main.c.233r.expand
```

### Q2: 未找到配置目录？
**A**: 确保Legacy成功执行。检查：
```bash
ls mycallypro/配置文件/
# 应该看到 main.c/ 目录
```

### Q3: PNG图片不显示？
**A**: 确保安装了graphviz：
```bash
sudo apt install graphviz  # Ubuntu/Debian
# 或
brew install graphviz      # macOS
```

### Q4: circle.txt为空？
**A**: 这是正常的。如果程序没有条件循环，circle.txt可能只有空行。

---

## 📁 文件位置速查

### 源文件
```
mycallypro/源文件/produce5/main.c
```

### Expand文件
```
# 原始位置
mycallypro/源文件/produce5/main.c.233r.expand

# 工作副本
mycallypro/中间结果/main/rtl文件/main.c.233r.expand
```

### DOT文件
```
# Legacy生成 (配置文件)
mycallypro/配置文件/main.c/main.c_threads.dot
mycallypro/配置文件/main.c/main.c_full.dot

# GUI使用 (中间结果)
mycallypro/中间结果/main/生成dag图/dag.dot
mycallypro/中间结果/main/查看条件节点/conditions.dot
```

### PNG图片
```
mycallypro/中间结果/main/生成dag图/dag.png
mycallypro/中间结果/main/查看条件节点/conditions.png
```

### 配置文件
```
mycallypro/配置文件/main.c/circle.txt
```

---

## 🛠️ 调试技巧

### 启用Debug输出
```bash
# 修改 mycallyplus/generation/legacy.py
# 添加 --debug 参数
python3 -m mycallyplus.generation.legacy \
    --debug \
    --threads-only \
    --output-base mycallypro \
    mycallypro/中间结果/main/rtl文件/main.c.233r.expand
```

### 查看Legacy调试文件
```bash
# 调试文件位置（如果启用了debug）
ls mycallypro/源文件/produce5/debug/
# 包含时间戳的JSON和DOT文件
```

### 手动验证Legacy
```bash
# 测试threads生成
python3 -m mycallyplus.generation.legacy \
    --threads-only \
    --output-base mycallypro \
    mycallypro/中间结果/main/rtl文件/main.c.233r.expand \
    | head -20

# 测试conditions生成
python3 -m mycallyplus.generation.legacy \
    --conditions-only \
    --output-base mycallypro \
    mycallypro/中间结果/main/rtl文件/main.c.233r.expand \
    | head -20
```

---

## ⚙️ 高级用法

### 批量处理多个文件
```python
# 创建脚本 batch_process.py
from pathlib import Path
from mycallyplus.ui.gui_v3 import MyCallyPlusGUI

source_files = [
    "mycallypro/源文件/produce5/main.c",
    "mycallypro/源文件/produce/produce.c",
    # 添加更多文件
]

for source in source_files:
    # 处理逻辑
    pass
```

### 自定义工作目录
```python
# 修改 base_dir
base_dir = Path("/自定义/路径/mycallypro")
```

---

## 📊 性能参考

### 典型性能指标
| 操作 | 时间 | 内存 |
|-----|------|------|
| 加载GUI | < 0.5s | ~50MB |
| 选择源文件 | < 0.1s | +5MB |
| 生成DAG | < 1s | +10MB |
| 生成Conditions | < 1s | +10MB |
| PNG渲染 | < 0.5s | +5MB |

### 大型项目估算
- **1000行代码**: ~2秒
- **5000行代码**: ~5秒
- **10000行代码**: ~10秒

---

## ✅ 验证清单

### 首次运行检查
- [ ] Python 3.8+ 已安装
- [ ] tkinter 可用 (`python3 -m tkinter`)
- [ ] PIL/Pillow 已安装
- [ ] graphviz 已安装
- [ ] mycallypro目录结构正确

### 测试检查
- [ ] `test_gui_all_buttons.py` 通过
- [ ] `test_report_v3.3.py` 显示全部✅
- [ ] GUI能正常启动
- [ ] 所有4个按钮可点击

---

## 🎓 学习资源

### 相关文档
- `CHANGELOG_v3.3.md` - 技术细节
- `SUMMARY_v3.3.md` - 完整总结
- `两阶段渲染功能说明.md` - 功能设计

### 示例项目
- `mycallypro/源文件/produce5/` - 推荐测试项目
- `mycallypro/test/` - 简单测试用例

---

**最后更新**: 2024  
**版本**: v3.3  
**状态**: ✅ 稳定
