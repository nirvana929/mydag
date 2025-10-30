# GUI v3.3 更新日志

## 更新日期
2024年（根据测试时间戳）

## 测试基础
- **测试文件**: `mycallypro/源文件/produce5/main.c`
- **测试目的**: 验证完整工作流程，修复路径连通性问题

## 主要修复

### 1. Expand文件查找逻辑修正
**文件**: `mycallyplus/ui/gui_v3.py` - `_compile_to_expand()`

**问题**:
```python
# ❌ 错误：只能匹配 main.*.expand
existing_expand = list(source_file.parent.glob(f"{source_file.stem}.*.expand"))
```

**修复**:
```python
# ✅ 正确：可以匹配 main.c.233r.expand
existing_expand = list(source_file.parent.glob(f"{source_file.name}.*.expand"))
```

**原因**: 
- `source_file.stem` 返回 "main" （去掉所有后缀）
- `source_file.name` 返回 "main.c" （保留文件名）
- GCC生成的expand文件格式是 `<filename>.233r.expand`，需要完整文件名匹配

---

### 2. Legacy --output-base 参数修正
**文件**: `mycallyplus/ui/gui_v3.py` - `generate_dag()`, `view_conditions()`

**问题**:
```python
# ❌ 错误：传递子目录路径
"--output-base", str(dag_dir / source_file.stem)
```

**修复**:
```python
# ✅ 正确：传递基础目录
"--output-base", str(self.base_dir)
```

**原因**:
- `--output-base` 参数是指定输出根目录
- Legacy模块会自动创建 `配置文件/<source_name>/` 子目录
- 传递子目录会导致目录结构混乱

---

### 3. Legacy --export-txt 参数补全
**文件**: `mycallyplus/ui/gui_v3.py` - `view_conditions()`

**问题**:
```python
# ❌ 错误：缺少路径参数
"--export-txt",
"--output-base", str(self.base_dir)
```

**修复**:
```python
# ✅ 正确：提供完整路径
"--export-txt", str(txt_output_path),
"--output-base", str(self.base_dir)
```

**原因**:
- `--export-txt` 需要一个PATH参数指定输出位置
- 缺少参数会导致 argparse 错误

---

### 4. 配置目录定位策略统一
**文件**: `mycallyplus/ui/gui_v3.py` - `generate_dag()`, `view_conditions()`

**修改前**:
```python
# 使用basename查找
source_basename = self.state.source_file.stem  # "main"
config_dir = config_base / source_basename     # "配置文件/main"
```

**修改后**:
```python
# 使用source_name查找
source_name = self.state.source_file.name      # "main.c"
config_dir = self.base_dir / "配置文件" / source_name  # "配置文件/main.c"
```

**原因**:
- Legacy模块使用源文件名（含.c）创建配置目录
- 保持一致性，避免查找失败

---

## 路径架构说明

### Legacy输出结构
```
mycallypro/
├── 配置文件/
│   └── main.c/                    ← Legacy自动创建（使用源文件名）
│       ├── main.c.233r.expand     ← 复制的expand文件
│       ├── main.c_threads.dot     ← --threads-only 生成
│       ├── main.c_full.dot        ← --conditions-only 生成
│       └── circle.txt             ← --export-txt 生成
└── 中间结果/
    └── main/                      ← GUI创建（使用basename）
        ├── rtl文件/
        │   └── main.c.233r.expand ← 编译或复制的expand
        ├── 生成dag图/
        │   ├── dag.dot            ← 从配置文件复制
        │   └── dag.png            ← dot命令生成
        └── 查看条件节点/
            ├── conditions.dot     ← 从配置文件复制
            └── conditions.png     ← dot命令生成
```

### 关键区别
- **配置文件目录名**: 使用源文件名（main.c）
- **中间结果目录名**: 使用basename（main）
- **文件流向**: 配置文件 → 中间结果 → PNG生成

---

## 测试验证

### 测试脚本
1. **test_produce5_workflow.py**: 路径连通性测试
2. **test_gui_all_buttons.py**: 完整按钮功能测试
3. **test_report_v3.3.py**: 综合测试报告

### 测试结果
```
✅ 按钮1: 选择源文件 - 通过
✅ 按钮2: 生成dag图 - 通过
✅ 按钮3: 查看前缀条件 - 通过
✅ 按钮4: 选择配置文件夹 - 通过

通过率: 4/4 (100%)
```

---

## 遗留问题

### 按钮5和6未实现
- **按钮5**: 查看互斥变量（占位实现）
- **按钮6**: 生成信号量（占位实现）

### 后续任务
1. 实现互斥变量分析逻辑
2. 实现信号量生成逻辑
3. 完善错误处理和用户提示
4. 添加智能模式支持（--smart, --clean）

---

## 版本历史

- **v3.0**: 初始设计，状态区驱动的6按钮架构
- **v3.1**: 修复legacy basename计算（main vs main.c）
- **v3.2**: 简化文件查找逻辑（模糊匹配）
- **v3.3**: 修正legacy参数和expand文件查找 ✅ **当前版本**

---

## 代码质量

### 静态分析
```bash
# 无编译错误
python3 -m py_compile mycallyplus/ui/gui_v3.py
# 成功
```

### 测试覆盖
- ✅ 路径连通性
- ✅ Legacy调用
- ✅ 文件复制
- ✅ PNG生成
- ⏳ 互斥变量分析（待实现）
- ⏳ 信号量生成（待实现）

---

## 相关文档
- `两阶段渲染功能说明.md`: 功能设计文档
- `模块升级.md`: 升级计划
- `文档/mycally_gpt交互规范_v1.0.txt`: 交互规范

---

## 贡献者
- 测试和修复基于produce5/main.c实际项目验证
- 所有修改均经过完整测试流程验证
