# 测试示例目录说明

## 📁 目录结构

```
测试示例/
├── README_测试文件说明.md          # 本文件
├── test_gui_v3_mutex.py            # GUI v3 互斥锁功能测试（需要GUI环境）
├── verify_gui_v3_structure.py      # GUI v3 代码结构验证（无需GUI）
├── mycally.py                       # 旧版测试脚本
├── test_debug_path.py              # 调试路径测试
├── main.c.233r.expand              # 测试用expand文件
├── main/                           # main测试案例
├── produce5/                       # produce5测试案例
└── ...
```

## 🧪 测试脚本说明

### 1. verify_gui_v3_structure.py
**用途**: 验证GUI v3代码结构和完整性  
**环境**: 无需GUI环境，可在服务器上运行  
**运行**:
```bash
cd /home/chove/桌面/cally
python3 测试示例/verify_gui_v3_structure.py
```

**检查内容**:
- ✅ 语法检查
- ✅ 类方法完整性
- ✅ 实例变量验证
- ✅ view_mutex方法结构
- ✅ 代码统计

**预期输出**:
```
✅ 语法检查通过
✅ 找到类定义: MycallyplusGUIv3
📊 类中共有 31 个方法
✅ 所有关键方法存在
```

---

### 2. test_gui_v3_mutex.py
**用途**: 完整测试GUI v3的互斥锁功能  
**环境**: 需要GUI环境（X11/Xvfb）  
**运行**:
```bash
cd /home/chove/桌面/cally
python3 测试示例/test_gui_v3_mutex.py
```

**测试项目**:
- ✅ 模块导入测试
- ✅ 类结构测试
- ✅ 实例变量测试
- ✅ UI按钮测试

**注意**: 在无GUI环境下会失败（正常现象）

---

## 📝 测试用例

### produce5 测试案例
**位置**: `测试示例/produce5/`  
**文件**:
- `main.c` - 测试源文件
- `main.c.233r.expand` - expand文件
- `debug/` - 调试输出

**用途**: 测试互斥锁分析功能

**操作流程**:
1. 启动GUI: `python3 -m mycallyplus.ui.gui_v3`
2. 选择源文件: `测试示例/produce5/main.c`
3. 选择expand: `测试示例/produce5/main.c.233r.expand`
4. 生成dag图
5. 查看条件节点
6. 查看互斥锁（测试子功能）

---

## 🔧 运行建议

### 快速验证（无GUI）
```bash
# 验证代码结构
python3 测试示例/verify_gui_v3_structure.py
```

### 完整测试（需GUI）
```bash
# 方法1: 直接运行GUI
python3 -m mycallyplus.ui.gui_v3

# 方法2: 运行测试脚本（需要X server）
export DISPLAY=:0
python3 测试示例/test_gui_v3_mutex.py
```

---

## 📊 测试覆盖

| 功能模块 | 验证脚本 | GUI测试 | 状态 |
|---------|---------|---------|------|
| 代码语法 | ✅ | N/A | 通过 |
| 类结构 | ✅ | ✅ | 通过 |
| 方法定义 | ✅ | ✅ | 通过 |
| UI组件 | ⚠️ | ✅ | 需GUI |
| 互斥锁解析 | N/A | 手动 | 待测 |
| 子功能切换 | N/A | 手动 | 待测 |

---

## 🎯 手动测试清单

完整功能测试需要手动操作：

- [ ] 按钮1: 选择源文件
- [ ] 按钮1.5: 选择expand文件（新功能）
- [ ] 按钮2: 生成dag图
- [ ] 按钮3: 查看条件节点
- [ ] 按钮5: 查看互斥锁
  - [ ] 子功能1: 查看互斥锁图（彩色子图）
  - [ ] 子功能2: 查看互斥锁信息（文本显示）
  - [ ] 子功能切换流畅性
- [ ] 错误处理（缺少文件时）

---

## 📚 相关文档

- **技术报告**: `文档/技术报告/GUI_v3_互斥锁子功能升级报告.md`
- **使用指南**: `文档/使用指南/GUI_v3_互斥锁功能使用指南.md`

---

*最后更新: 2025-10-29*
