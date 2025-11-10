# RTL 生成功能使用指南

## 功能说明

cally++ GUI 现在提供了一键生成 RTL expand 文件的功能。点击"生成 RTL"按钮后,系统会自动:

1. 编译 C++ 源文件生成 RTL expand 文件
2. 解析 RTL 文件并进行去改编处理
3. 将生成的 expand 文件自动填充到输入框

## 使用步骤

### 1. 启动 GUI

```bash
cd /path/to/cally++
python3 gui.py
```

### 2. 选择源文件

- 点击"选择源文件"按钮,选择你的 C++ 源代码文件
- 或者直接在"源文件"输入框中输入/粘贴文件路径

### 3. 生成 RTL 文件

- 点击**"生成 RTL"**按钮(绿色背景)
- 系统会在后台执行以下操作:
  - 使用 `g++ -O0 -std=c++17 -fdump-rtl-expand -c` 编译源文件
  - 查找生成的 `.expand` 文件
  - 使用 rtl_parser 进行去改编处理
  - 将 expand 文件路径自动填充到 expand 输入框

### 4. 查看日志

在界面底部的日志区域可以看到详细的处理过程:

```
[时间] ============================================================
[时间] 开始为 simple_thread.cpp 生成 RTL expand 文件...
[时间] 步骤 1/3: 编译生成 RTL expand 文件...
[时间]   运行: g++ -O0 -std=c++17 -fdump-rtl-expand -c simple_thread.cpp -o tmp.o
[时间] ✓ 编译成功
[时间] 步骤 2/3: 查找 RTL expand 文件...
[时间] ✓ 找到 expand 文件: simple_thread.cpp.233r.expand
[时间]   文件大小: 570.3 KB
[时间] 步骤 3/3: 执行去改编处理...
[时间] ✓ 解析完成，共 160 个函数
[时间]   去改编缓存: 203 个符号
[时间]   去改编示例:
[时间]     _ZnwmPv
[时间]     → operator new(unsigned long, void*)
[时间] ============================================================
[时间] ✓ RTL 文件生成并去改编完成！
[时间]   文件路径: /path/to/simple_thread.cpp.233r.expand
[时间]   可以点击「生成调用图」继续处理
[时间] ============================================================
```

### 5. 生成调用图

- RTL 文件生成后会自动填充到 expand 输入框
- 配置输出目录和其他选项(caller、模式、简化等)
- 点击**"生成调用图"**按钮继续生成 DOT/PNG 文件

## 编译选项说明

生成 RTL 时使用的 g++ 选项:

- `-O0`: 禁用优化,保留所有函数调用信息
- `-std=c++17`: 使用 C++17 标准
- `-fdump-rtl-expand`: 生成 RTL expand 阶段的中间文件
- `-c`: 只编译不链接

## 常见问题

### Q: 编译失败怎么办?

A: 检查日志区域的编译输出,常见问题:
- 源文件有语法错误
- 缺少必要的头文件
- 需要额外的编译选项(目前不支持自定义选项)

### Q: 找不到 expand 文件?

A: expand 文件生成在源文件的同一目录下,名称格式为 `源文件名.NNNr.expand`,其中 NNN 是编译阶段编号(通常是 233 或类似数字)

### Q: 去改编失败?

A: 确保:
- `rtl_parser.py` 文件存在于 cally++ 目录
- Python 环境正确配置
- 启用了 Debug 模式可以看到更详细的错误信息

## 命令行替代方案

如果不使用 GUI,也可以直接运行测试脚本:

```bash
cd /path/to/cally++
python3 test_rtl_generation.py
```

该脚本会对 `源代码/simple_thread/simple_thread.cpp` 执行完整的 RTL 生成和去改编流程。

## 技术细节

### 编译过程

```python
g++ -O0 -std=c++17 -fdump-rtl-expand -c 源文件.cpp -o 临时文件.o
```

### 去改编过程

使用 `rtl_parser.py` 中的 `RTLParser` 类:

```python
from rtl_parser import RTLParser

parser = RTLParser(enable_demangle=True, debug=False)
graph = parser.parse_file(expand_文件路径)
```

### 统计信息

- 编译耗时: 通常 < 5 秒
- Expand 文件大小: 几百 KB 到几 MB
- 去改编符号数: 通常 100-500 个(取决于代码复杂度)
- 解析函数数: 通常 50-300 个

## 示例输出

使用 `simple_thread.cpp` 的测试结果:

```
编译成功: 1.2 秒
Expand 文件: simple_thread.cpp.233r.expand (570.3 KB)
解析函数数: 160
去改编符号: 203
去改编示例:
  _ZN13ThreadManagerC2Ei → ThreadManager::ThreadManager(int)
  _ZNSt6threadC1IRFviiEJRiiEvEEOT_DpOT0_ → std::thread::thread<void (&)(int, int), int&, int, void>(...)
  _ZNSt5mutex4lockEv → std::mutex::lock()
```

## 下一步

RTL 文件生成后:

1. 检查日志确认生成成功
2. 配置输出目录(默认当前目录)
3. 选择 caller 函数(如 main)
4. 选择生成模式:
   - Full Graph: 完整调用图
   - Caller Graph: 从 caller 出发的调用图
5. 启用简化选项(推荐):
   - 简化 C++ 模板名称
   - 隐藏 STL 实现细节
   - 映射线程语义
6. 点击"生成调用图"

## 更新日志

### 2024-01 新增功能

- ✅ GUI 添加"生成 RTL"按钮
- ✅ 自动编译 C++ 源文件
- ✅ 自动查找并解析 expand 文件
- ✅ 集成去改编处理
- ✅ 实时日志显示
- ✅ 后台线程执行,避免界面卡死
- ✅ 自动填充 expand 路径到输入框
- ✅ 详细的统计信息和去改编示例

## 相关文档

- [SIMPLIFY_README.md](SIMPLIFY_README.md) - C++ 调用图简化功能
- [README.md](README.md) - cally++ 使用说明
- [rtl_parser.py](rtl_parser.py) - RTL 解析器实现
- [gui.py](gui.py) - GUI 源代码
