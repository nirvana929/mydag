# mycallypro GUI - "生成配置文件"功能说明

## 🎉 新增功能

在mycallypro的GUI中新增了**"生成配置文件"**按钮，实现一键生成所有需要的配置文件。

## 🖼️ GUI界面布局

```
┌─────────────────────────────────────────────────────────────┐
│  MyCally 助手                                         ╳ □ ─  │
├──────────────┬──────────────────────────────────────────────┤
│              │  C 文件：<未选择>                            │
│  按钮区域    │  expand 文件：<未选择>                       │
│              │                                              │
│ ┌──────────┐ │  ┌────────────────────────────────────────┐ │
│ │读入C文件 │ │  │                                        │ │
│ └──────────┘ │  │                                        │ │
│              │  │         图像显示区域                    │ │
│ ┌──────────┐ │  │                                        │ │
│ │读入expand│ │  │                                        │ │
│ └──────────┘ │  │                                        │ │
│              │  │                                        │ │
│ ┌──────────┐ │  └────────────────────────────────────────┘ │
│ │生成dag图 │ │                                              │
│ └──────────┘ │                                              │
│              │                                              │
│ ┌──────────┐ │                                              │
│ │查看条件  │ │                                              │
│ │  节点    │ │                                              │
│ └──────────┘ │                                              │
│              │                                              │
│ ┌──────────┐ │                                              │
│ │生成配置  │ ← 新增按钮！                                   │
│ │  文件    │ │                                              │
│ └──────────┘ │                                              │
└──────────────┴──────────────────────────────────────────────┘
```

## 📋 功能说明

点击**"生成配置文件"**按钮后，系统将自动执行以下操作：

### 1️⃣ 生成dag图（线程视图）
- 文件名：`dag.dot` 和 `dag.png`
- 模式：`--threads-only`
- 特点：只显示线程边，不显示条件节点
- 用途：清晰展示线程调用关系

### 2️⃣ 生成条件节点图（完整视图）
- 文件名：`dag_full.dot` 和 `dag_full.png`
- 模式：完整模式
- 特点：包含if/while/switch等条件节点
- 用途：完整的程序控制流分析

### 3️⃣ 生成circle.txt配置
- 文件名：`circle.txt`
- 内容：互斥锁和信号量信息
- 格式：5列数据（节点名、类型、编号、行号、文件名）
- 用途：供dag_describe工具分析使用

## 📂 输出目录结构

所有文件保存在项目根目录下：

```
项目根目录/
├── 配置文件/
│   └── <basename>/          # 根据输入文件名自动创建
│       ├── dag.dot          # 线程视图DOT文件
│       ├── dag.png          # 线程视图图片
│       ├── dag_full.dot     # 完整视图DOT文件
│       ├── dag_full.png     # 完整视图图片
│       └── circle.txt       # dag_describe配置文件
│
└── 中间结果/
    └── <basename>/
        └── debug/           # 调试信息（JSON快照等）
            ├── *_control_prefix.json
            ├── *_post_parse.json
            └── *_post_callee_info.json
```

## 🚀 使用步骤

### 步骤1: 启动GUI

```bash
# 方法1: 使用模块方式
python3 -m mycallypro.gui

# 方法2: 直接运行
cd mycallypro && python3 gui.py
```

### 步骤2: 选择文件

**选项A：从C文件开始**
1. 点击"读入 C 文件"按钮
2. 选择你的 `.c` 源文件
3. 系统自动编译生成 expand 文件

**选项B：直接使用expand文件**
1. 点击"读入 expand 文件"按钮
2. 选择已有的 `.expand` 文件

### 步骤3: 生成配置文件

1. 点击**"生成配置文件"**按钮
2. 等待进度提示框：
   - "正在生成 dag 图（线程视图）..."
   - "正在生成条件节点图（完整视图）..."
   - "正在生成 circle.txt 配置文件..."
3. 完成后显示生成结果

### 步骤4: 查看结果

生成完成后会显示：
```
所有配置文件已生成！

配置文件目录：
/path/to/项目根目录/配置文件/main/

生成的文件：
✓ dag.dot
✓ dag.png
✓ dag_full.dot
✓ dag_full.png
✓ circle.txt
```

## 🔗 与dag_describe集成

生成的配置文件可以直接被dag_describe使用：

### 方法1: 手动选择
1. 启动dag_describe：`cd test && python3 ../cally/dag_describe.py`
2. 点击"选择配置文件夹"
3. 选择：`项目根目录/配置文件/<basename>/`
4. 开始分析

### 方法2: 命令行
```bash
# 假设配置文件在 /home/user/cally/配置文件/main/
cd test
python3 ../cally/dag_describe.py --config /home/user/cally/配置文件/main/
```

## 💡 功能对比

| 按钮 | 生成内容 | 文件位置 | 用途 |
|------|---------|---------|------|
| **生成dag图** | dag.dot/png | test/<basename>/ | 快速查看线程视图 |
| **查看条件节点** | dag_full.dot/png | test/<basename>/ | 快速查看完整视图 |
| **生成配置文件** | 所有文件 | 配置文件/<basename>/ | 完整配置，供dag_describe使用 |

## ⚙️ 技术实现

### 核心方法

#### `generate_config_files()`
主方法，协调整个生成流程：
```python
def generate_config_files(self):
    # 1. 创建配置文件和中间结果目录
    # 2. 生成dag图（threads-only）
    # 3. 生成条件节点图（完整版）
    # 4. 生成circle.txt
    # 5. 显示成功消息
```

#### `_build_dag_to_config()`
生成DAG并保存到配置文件目录：
```python
def _build_dag_to_config(self, expand_path, config_dir, threads_only=False):
    # 调用 python -m mycallypro [--threads-only] <expand>
    # 保存 DOT 和 PNG 到 config_dir
```

#### `_generate_circle_txt()`
生成circle.txt配置文件：
```python
def _generate_circle_txt(self, expand_path, config_dir):
    # 调用 python -m mycallypro <expand> --export-txt <path> --output-base <base>
    # 生成包含互斥锁和信号量信息的txt文件
```

## 🐛 故障排查

### 问题1: 按钮点击无反应

**可能原因**：未选择expand文件

**解决方案**：
1. 先点击"读入 expand 文件"
2. 选择有效的 .expand 文件
3. 再点击"生成配置文件"

### 问题2: 提示"未找到 dot 命令"

**可能原因**：未安装Graphviz

**解决方案**：
```bash
# Ubuntu/Debian
sudo apt-get install graphviz

# CentOS/RHEL
sudo yum install graphviz

# macOS
brew install graphviz
```

### 问题3: circle.txt为空

**可能原因**：代码中没有互斥锁或信号量

**解决方案**：
- 确认源代码使用了 `pthread_mutex_*` 或 `sem_*` 函数
- 编译时链接pthread：`gcc -lpthread`

### 问题4: GUI无法启动

**可能原因**：缺少GUI环境或tkinter

**解决方案**：
```bash
# 安装tkinter
sudo apt-get install python3-tk

# 设置DISPLAY（远程连接时）
export DISPLAY=:0
```

## 📊 完整工作流示例

```bash
# 1. 准备源代码
cat > test.c << 'EOF'
#include <pthread.h>
#include <stdio.h>

pthread_mutex_t lock;

void* thread_func(void* arg) {
    pthread_mutex_lock(&lock);
    printf("Critical section\n");
    pthread_mutex_unlock(&lock);
    return NULL;
}

int main() {
    pthread_t thread;
    pthread_mutex_init(&lock, NULL);
    pthread_create(&thread, NULL, thread_func, NULL);
    pthread_join(thread, NULL);
    pthread_mutex_destroy(&lock);
    return 0;
}
EOF

# 2. 编译生成expand文件
gcc -fdump-rtl-expand -g test.c -lpthread -o test

# 3. 启动GUI
python3 -m mycallypro.gui

# 4. 在GUI中：
#    - 点击"读入 expand 文件"，选择 test.c.233r.expand
#    - 点击"生成配置文件"
#    - 等待完成

# 5. 查看结果
tree 配置文件/test/
# 配置文件/test/
# ├── dag.dot
# ├── dag.png
# ├── dag_full.dot
# ├── dag_full.png
# └── circle.txt

# 6. 使用dag_describe分析
cd test && python3 ../cally/dag_describe.py
# 在GUI中选择：配置文件/test/
```

## 🎯 优势特点

✅ **一键操作**：无需多次点击，自动完成所有生成  
✅ **完整配置**：包含所有dag_describe需要的文件  
✅ **目录规范**：使用标准的配置文件目录结构  
✅ **进度提示**：每个步骤都有明确的进度提示  
✅ **错误处理**：详细的错误信息，便于排查问题  
✅ **自动显示**：生成完成后自动显示完整视图图片  

## 📝 注意事项

1. **文件覆盖**：重复生成会覆盖之前的配置文件
2. **目录命名**：配置文件目录名由输入文件自动决定
3. **依赖检查**：需要安装Graphviz（dot命令）
4. **内存使用**：大型项目可能需要较多内存和时间

## 🔄 更新记录

**v1.1.0 - 2025-10-23**
- ✅ 新增"生成配置文件"按钮
- ✅ 实现一键生成所有配置功能
- ✅ 支持自动目录结构创建
- ✅ 添加详细的进度提示
- ✅ 优化文件保存路径

---

**快速开始**：`python3 -m mycallypro.gui` 🚀
