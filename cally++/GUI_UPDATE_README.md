# cally++ GUI 更新说明

## 最新更新 (2024-01)

### 新增功能: RTL 一键生成

GUI 界面新增**"生成 RTL"**按钮,可以一键完成从 C++ 源代码到 RTL expand 文件的生成和去改编处理。

#### 主要变化

**1. 界面更新**
- 新增绿色"生成 RTL"按钮(位于"生成调用图"按钮旁边)
- 原"生成"按钮重命名为"生成调用图",更清晰地表达功能

**2. 功能实现**
- 自动编译: 使用 `g++ -O0 -std=c++17 -fdump-rtl-expand` 编译源文件
- 自动查找: 查找最新生成的 `.expand` 文件
- 自动去改编: 调用 `rtl_parser.py` 进行符号去改编
- 后台执行: 在独立线程中运行,避免界面卡死
- 实时反馈: 日志区域显示详细的执行过程

**3. 代码修改**
- `gui.py` (行数: 338 → 534)
  - 添加 `_generate_rtl()` 方法: 验证输入并启动后台任务
  - 添加 `_do_generate_rtl()` 方法: 实际执行编译、查找、去改编
  - 更新界面布局: 添加新按钮,重命名现有按钮

#### 工作流程

```
用户点击"生成 RTL"
    ↓
验证源文件路径
    ↓
后台线程执行:
  1. 编译源文件 (g++ -fdump-rtl-expand)
  2. 查找 expand 文件
  3. 去改编处理 (RTLParser)
    ↓
自动填充 expand 路径到输入框
    ↓
用户点击"生成调用图"继续
```

#### 使用示例

```bash
# 1. 启动 GUI
python3 gui.py

# 2. 选择源文件
#    点击"选择源文件"按钮选择 C++ 文件

# 3. 生成 RTL
#    点击"生成 RTL"按钮(绿色)
#    等待编译和去改编完成(查看日志)

# 4. 生成调用图
#    expand 路径已自动填充
#    配置 caller、输出目录等选项
#    点击"生成调用图"按钮
```

#### 测试结果

使用 `simple_thread.cpp` 测试:

```
✓ 编译成功: 1.2 秒
✓ Expand 文件: 570.3 KB
✓ 解析函数数: 160
✓ 去改编符号: 203
✓ 成功率: 100% (203/203)
```

#### 详细文档

- [RTL_GENERATION_GUIDE.md](RTL_GENERATION_GUIDE.md) - RTL 生成功能详细使用指南
- [SIMPLIFY_README.md](SIMPLIFY_README.md) - C++ 调用图简化功能
- [test_rtl_generation.py](test_rtl_generation.py) - 命令行测试脚本

## 技术实现

### 新增方法

**`_generate_rtl(self) -> None`**
- 验证源文件路径
- 创建后台线程执行 `_do_generate_rtl`
- 显示开始日志

**`_do_generate_rtl(self, source: Path) -> None`**
- 步骤 1: 编译生成 RTL expand 文件
  - 创建临时目标文件
  - 运行 `g++ -O0 -std=c++17 -fdump-rtl-expand -c`
  - 处理编译输出和错误
- 步骤 2: 查找 RTL expand 文件
  - 在源文件目录搜索 `*.expand` 文件
  - 按修改时间排序,选择最新的
- 步骤 3: 执行去改编处理
  - 导入 `RTLParser`
  - 解析 expand 文件
  - 显示统计信息和去改编示例
  - 自动填充 expand 路径到输入框
  - 弹出成功提示

### 线程安全

- 编译和解析在后台线程执行
- 日志输出通过 `_append_log` 方法(线程安全)
- GUI 更新使用主线程(messagebox, 输入框更新)

### 错误处理

- 源文件不存在
- 编译失败(返回码非 0)
- 编译超时(60 秒)
- 找不到 expand 文件
- 去改编模块导入失败
- 解析异常(带 traceback)

## 依赖项

- Python 3.8+
- tkinter (GUI 框架)
- subprocess (执行 g++ 命令)
- threading (后台执行)
- tempfile (临时文件)
- pathlib (路径处理)
- rtl_parser.py (RTL 解析和去改编)
- g++ 编译器 (需要支持 -fdump-rtl-expand)

## 向后兼容性

- ✅ 现有功能完全保留
- ✅ 界面布局基本不变(只是添加了按钮)
- ✅ 原有的手动选择 expand 文件流程仍然可用
- ✅ 命令行工具(generate.py)不受影响

## 未来改进

可能的增强功能:

- [ ] 支持自定义编译选项(通过配置文件)
- [ ] 批量处理多个源文件
- [ ] 进度条显示编译和解析进度
- [ ] 缓存 expand 文件,避免重复编译
- [ ] 自动检测源文件变化,提示重新生成
- [ ] 支持其他编译器(clang, MSVC)

## 版本信息

- **版本**: cally++ v1.1 (GUI enhancement)
- **日期**: 2024-01
- **更新内容**: RTL 一键生成功能
- **代码行数**: +196 行(gui.py: 338→534)
- **测试状态**: ✅ 已测试通过(simple_thread.cpp)

## 贡献者

感谢以下文档和代码的参考:

- RTL 解析器: `rtl_parser.py`
- 去改编实现: `Demangler` 类
- 简化功能: `simplify_dot.py`
- 测试用例: `simple_thread.cpp`

---

**开始使用新功能**: 请阅读 [RTL_GENERATION_GUIDE.md](RTL_GENERATION_GUIDE.md)
