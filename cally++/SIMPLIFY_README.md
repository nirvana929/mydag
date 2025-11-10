# C++ 调用图简化功能说明

## 功能概述

cally++ 的 `--simplify-cxx` 选项可以将包含大量 STL 模板实现细节的 C++ 调用图简化为用户友好的形式，专注于业务逻辑和线程/锁语义。

## 使用方法

```bash
python3 generate.py --expand <file.expand> --full --simplify-cxx --source <source.cpp>
```

### 参数说明

- `--expand <file>`: RTL expand 文件（必需）
- `--full`: 生成完整调用图（所有函数）
- `--caller <func>`: 生成从指定函数出发的 caller 图
- `--simplify-cxx`: 启用 C++ 简化（隐藏 STL 内部实现）
- `--source <file>`: 源代码文件，用于线程函数推断（可选）
- `--debug`: 调试模式

## 简化效果

### simple_thread.cpp 示例

**原始图**（329 行）：
- 包含 150 个节点，219 条边
- 充满 `std::thread::thread<...>`、`std::unique_ptr<...>`、`std::_Tuple_impl<...>` 等模板细节
- 文件大小：1.7 MB PNG

**简化后**（39 行）：
- 仅保留 11 个用户节点 + 10 个语义节点
- 隐藏 129 个 STL 库节点
- 文件大小：186 KB PNG
- **减少 88-89%** 的复杂度

## 简化规则

### 1. 隐藏的库前缀

以下前缀的符号会被隐藏：
- `std::__` - STL 内部实现
- `std::_` - STL 辅助类
- `__gnu_cxx::` - GNU C++ 扩展
- `__cxxabiv1::` - C++ ABI
- `__gthread` - gthread 包装
- `__stack_chk` - 栈检查

### 2. 语义映射

| C++ 原始 | 简化后语义 | 样式 |
|----------|------------|------|
| `std::thread::join()` | `pthread_join` | 灰色虚线 |
| `std::mutex::lock()` | `pthread_mutex_lock` | 灰色虚线 |
| `std::lock_guard<...>::lock_guard()` | `pthread_mutex_lock` | 灰色虚线 |
| `std::mutex::unlock()` | `pthread_mutex_unlock` | 灰色虚线 |
| `std::lock_guard<...>::~lock_guard()` | `pthread_mutex_unlock` | 灰色虚线 |
| `std::thread::thread<...>(workerThread, ...)` | → `workerThread` | 推断工作函数 |

### 3. 保留的节点

- **用户函数**：你编写的所有函数
- **语义节点**：线程创建/等待、互斥锁加解锁
- **外部函数**：`operator new/delete`、异常处理等（虚线标记）

## 输出文件

假设输入为 `simple_thread.cpp.233r.expand`：

### 完整调用图（--full）
- `配置文件/simple_thread.cpp/simple_thread.cpp.dot` - 原始 DOT
- `配置文件/simple_thread.cpp/simple_thread.cpp_simple.dot` - 简化 DOT
- `img/simple_thread.cpp_full.png` - 原始图
- `img/simple_thread.cpp_full_simple.png` - 简化图

### Caller 图（--caller main）
- `配置文件/simple_thread.cpp/simple_thread.cpp.dot` - 原始 DOT
- `配置文件/simple_thread.cpp/simple_thread.cpp_simple.dot` - 简化 DOT
- `img/simple_thread.cpp_caller.png` - 原始图
- `img/simple_thread.cpp_caller_simple.png` - 简化图

## 简化示例

### simple_thread.cpp 简化后的调用关系

```
main
├── ThreadManager::ThreadManager(int)
├── ThreadManager::start()
│   ├── ThreadManager::createThreads()
│   │   └── [线程创建，推断] → workerThread(int, int)
│   ├── ThreadManager::waitForCompletion()
│   │   └── pthread_join  [语义节点]
│   └── ThreadManager::printSummary()
│       ├── pthread_mutex_lock  [语义节点]
│       └── pthread_mutex_unlock  [语义节点]
└── ThreadManager::~ThreadManager()

workerThread(int, int)  [工作线程函数]
├── Task::Task(int)
└── Task::execute()
    ├── Task::processData()
    │   ├── pthread_mutex_lock  [语义节点]
    │   └── pthread_mutex_unlock  [语义节点]
    └── Task::saveResult()
```

## 技术细节

### 链路压缩算法

简化器使用 DFS 跳过库节点链路：

```
用户函数A → [std::thread::...] → [std::unique_ptr::...] → 用户函数B
压缩为：
用户函数A → 用户函数B
```

### 工作函数推断

1. **从调用图推断**：查找包含 "worker" 或 "thread" 的用户函数
2. **从源代码推断**：解析 `std::thread(workerThread, ...)` 的第一个参数
3. **后备策略**：如果无法推断，保留线程创建节点

## 限制与注意事项

1. **Lambda 和 std::bind**：当前版本对 lambda 和 std::bind 的支持有限
2. **内联函数**：高度内联的函数可能不出现在调用图中
3. **模板特化**：复杂的模板特化可能导致符号识别失败

## 禁用简化

如果需要查看完整的 STL 实现细节，不加 `--simplify-cxx` 选项即可：

```bash
python3 generate.py --expand file.expand --full
```

## 参考

详细设计与更新请参阅 `README.md` 中的“线程简化逻辑”章节（与 `CXX_to_Callgraph_Pipeline.md` 搭配使用）。
