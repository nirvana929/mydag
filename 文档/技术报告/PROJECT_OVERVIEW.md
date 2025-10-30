# mycallypro 项目概览

> 基于GCC RTL的C程序调用图分析工具

## 🚀 快速开始

```bash
# 1. 生成配置文件
python3 -m mycallypro <expand_file> --export-txt circle.txt

# 2. 使用图形界面
python3 -m mycallypro.gui

# 3. 查看帮助
python3 -m mycallypro --help
```

📖 **详细教程**: [`文档/使用说明/集成快速开始.md`](文档/使用说明/集成快速开始.md)

---

## 📚 文档导航

| 类型 | 位置 | 说明 |
|------|------|------|
| 📖 **文档索引** | [`文档/README.md`](文档/README.md) | 所有文档的快速查找指南 |
| 📁 **目录结构** | [`目录结构说明.md`](目录结构说明.md) | 完整的项目目录说明 |
| 🚀 **快速开始** | [`文档/使用说明/集成快速开始.md`](文档/使用说明/集成快速开始.md) | 5分钟上手教程 |
| 🏗️ **架构设计** | [`文档/架构设计/`](文档/架构设计/) | 系统架构和设计文档 |

---

## 🎯 核心功能

### ✅ 已实现功能

- ✅ **RTL解析**: 解析GCC生成的expand文件
- ✅ **调用图生成**: 生成函数调用关系图
- ✅ **线程分析**: 推断pthread_create/join边
- ✅ **条件节点**: 识别if/while/switch控制流
- ✅ **配置文件导出**: 生成circle.txt配置
- ✅ **GUI界面**: 图形化操作界面
- ✅ **冗余处理**: 智能检测、清理重建模式
- ✅ **三阶段架构**: 输入-处理-输出分离

### 🎨 特色功能

- 🔥 **智能模式** (`--smart`): 跳过未修改的文件
- 🧹 **清理模式** (`--clean`): 完全重建输出目录
- 🎯 **线程视图**: 只显示线程调用关系
- 📊 **完整视图**: 包含条件节点的完整图
- 🖼️ **可视化**: DOT图自动渲染为PNG

---

## 📁 项目结构

```
cally/
├── 目录结构说明.md         # 📄 完整目录说明（你在这里）
├── mycallypro/             # 💻 主程序代码
├── 文档/                   # 📚 项目文档（已分类）
├── 其他文件/               # 🔧 测试脚本和临时数据
├── 测试示例/               # 📝 测试用例
├── test/                   # 🧪 测试工具（dag_describe）
└── 程序迭代图/             # 📊 开发历程可视化
```

---

## 🛠️ 使用示例

### 基础用法

```bash
# 生成配置文件（默认模式）
python3 -m mycallypro file.expand --export-txt circle.txt
```

### 智能模式

```bash
# 跳过未修改的文件（节省时间）
python3 -m mycallypro file.expand --export-txt circle.txt --smart
```

### 清理重建

```bash
# 删除旧目录后重新生成
python3 -m mycallypro file.expand --export-txt circle.txt --clean
```

### GUI界面

```bash
# 启动图形界面
python3 -m mycallypro.gui
```

---

## 📊 输出文件

### 配置文件目录 (`mycallypro/配置文件/<basename>/`)

```
配置文件/produce.c/
├── circle.txt              # ⭐ 主配置文件（5列格式）
├── produce.c.dot           # 线程视图DAG图
├── produce.c_full.dot      # 完整视图DAG图
├── produce.c               # 源代码副本
└── produce.c.233r.expand   # expand文件副本
```

### 中间结果目录 (`mycallypro/中间结果/<basename>/`)

```
中间结果/produce.c/
├── debug/                  # 调试JSON文件
├── images/                 # PNG图片
├── temp/                   # 临时DOT文件
└── logs/                   # 日志文件
```

---

## 🔧 开发工具

### 测试脚本 (`其他文件/测试脚本/`)

- `test_redundancy.sh` - 冗余处理机制测试
- `test_config_generation.py` - 配置文件生成测试
- `test_integration.py` - 集成测试
- `使用示例.sh` - 使用示例演示

运行测试：
```bash
cd 其他文件/测试脚本/
./test_redundancy.sh
```

---

## 📖 学习路径

### 新手用户

1. 📖 [`文档/README.md`](文档/README.md) - 了解文档结构
2. 🚀 [`文档/使用说明/集成快速开始.md`](文档/使用说明/集成快速开始.md) - 5分钟上手
3. 🖥️ [`文档/使用说明/GUI配置文件功能说明.md`](文档/使用说明/GUI配置文件功能说明.md) - GUI使用

### 进阶用户

4. ⚙️ [`文档/使用说明/配置文件生成说明.md`](文档/使用说明/配置文件生成说明.md) - 配置文件详解
5. 🔄 [`文档/使用说明/冗余处理机制说明.md`](文档/使用说明/冗余处理机制说明.md) - 高级功能

### 开发者

6. 🏗️ [`文档/架构设计/三阶段文件划分说明.md`](文档/架构设计/三阶段文件划分说明.md) - 架构设计
7. 📐 [`文档/架构设计/配置文件结构说明.md`](文档/架构设计/配置文件结构说明.md) - 数据结构
8. 📝 [`文档/开发记录/更新日志.md`](文档/开发记录/更新日志.md) - 开发历史

---

## 🤝 贡献指南

### 添加新文档

1. 确定文档类型：架构设计 / 使用说明 / 开发记录 / 规范文档
2. 放入对应的 `文档/` 子目录
3. 更新 `文档/README.md` 索引

### 添加测试脚本

1. 放入 `其他文件/测试脚本/`
2. 为Shell脚本添加执行权限: `chmod +x script.sh`

### 提交代码

1. 确保代码通过测试
2. 更新相关文档
3. 提交Pull Request

---

## 🐛 常见问题

### Q: 如何生成expand文件？

```bash
gcc -fdump-rtl-expand -c source.c
```

### Q: circle.txt是什么格式？

5列格式：节点名、类型、变量名、行号、文件名  
详见：[`文档/架构设计/配置文件结构说明.md`](文档/架构设计/配置文件结构说明.md)

### Q: 如何跳过未修改的文件？

使用 `--smart` 参数：
```bash
python3 -m mycallypro file.expand --export-txt circle.txt --smart
```

### Q: 如何完全重建？

使用 `--clean` 参数：
```bash
python3 -m mycallypro file.expand --export-txt circle.txt --clean
```

---

## 📞 联系方式

- **项目**: mydag
- **仓库**: nirvana929/mydag
- **分支**: new-branch
- **文档**: [`文档/README.md`](文档/README.md)

---

## 📅 最近更新

- **2025-10-27**: 实现冗余处理机制（智能模式、清理模式）
- **2025-10-27**: 完成文档分类整理和目录优化
- **2025-10-27**: 三阶段架构和扁平化配置文件结构
- **2025-10-26**: 配置文件生成功能完善

详见：[`文档/开发记录/更新日志.md`](文档/开发记录/更新日志.md)

---

**Happy Coding! 🎉**
