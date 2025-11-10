# Cally++ - C++ 调用图生成工具

基于 RTL 解析的 C++ 调用图生成工具，集成符号去改编（demangle）功能。

## 核心特性

- ✅ **RTL 阶段去改编**：解析时直接处理 C++ 混淆符号
- ✅ **独立实现**：不依赖 mycallyplus/mycallypro
- ✅ **自动检测**：支持 c++filt 和 llvm-cxxfilt
- ✅ **高效缓存**：避免重复去改编

## 项目结构

```
cally++/
├── rtl_parser.py          # RTL 解析器（集成去改编）
├── dot_generator.py       # DOT 图生成器
├── generate.py            # 主程序
├── 源代码/                # 输入 expand 文件
├── 配置文件/              # 输出 DOT 文件
│   └── <basename>/
│       └── <basename>.dot
└── img/                   # 输出 PNG 图片
    └── <basename>_caller.png
```

## 安装依赖

```bash
sudo apt install binutils graphviz g++
```

## 快速开始

```bash
cd /home/chove/Desktop/mydag/cally++

# 基本用法
python3 generate.py \
    --expand 源代码/BatterySimulator/BatterySimulator.cpp.233r.expand \
    --caller "BatterySimulator::Run()"

# 查看结果
cat 配置文件/BatterySimulator.cpp/BatterySimulator.cpp.dot
xdg-open img/BatterySimulator.cpp_caller.png
```

## 使用方法

```bash
python3 generate.py --expand <file.expand> --caller <function_name> [options]
```

### 参数

- `--expand FILE`：RTL expand 文件路径（必需）
- `--caller FUNCTION`：根函数名（必需）
- `--output-base DIR`：输出目录（默认：当前目录）
- `--debug`：调试模式

### 示例

```bash
# 使用可读函数名
python3 generate.py --expand file.expand --caller "Foo::bar()"

# 使用混淆名（自动去改编）
python3 generate.py --expand file.expand --caller "_ZN3Foo3barEv"

# 调试模式
python3 generate.py --expand file.expand --caller "main" --debug
```

## 生成 RTL expand 文件

如果没有 expand 文件，可以从 C++ 源文件生成：

```bash
g++ -O0 -std=c++17 -fdump-rtl-expand -c your_file.cpp -o /tmp/temp.o
# 生成的 .expand 文件在当前目录
```

## 去改编对比

**传统方式**（混淆符号）：
```dot
"_ZN3Foo3barEv" -> "_ZN3Foo3bazEi";
```

**Cally++**（可读符号）：
```dot
"Foo::bar()" -> "Foo::baz(int)";
```

## 常见问题

### 找不到 c++filt

```bash
sudo apt install binutils
c++filt --version
```

### 图片未生成

```bash
sudo apt install graphviz
dot -V
```

### 函数未找到

查看可用函数：
```bash
python3 generate.py --expand file.expand --caller "WrongName" 2>&1 | grep "  -"
```

## 技术细节

- `CXX_to_Callgraph_Pipeline.md`：C++ 到调用图的整体流程与注意事项
- `CXX_Thread_Callgraph_Simplification.md`：C++ 线程调用图简化方案（将 std::thread/lock_guard 等库细节折叠为简洁语义）

## 参考

基于 mycallyplus 和 mycallypro 的算法实现。
