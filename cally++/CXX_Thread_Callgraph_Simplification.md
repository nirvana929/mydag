# C++ 线程调用图简化方案（适配 simple_thread.cpp 等）

目的：将 C++ 源（std::thread/lock_guard 等）生成的调用图，简化为接近 C 版本的“简洁明了”形态，仅保留对读者有价值的用户函数与线程/锁语义节点。

适用范围：mydag/cally++ 流水线生成的 DOT，在 demangle（去改编）之后的后处理阶段。

## 1. 背景与问题

- C++ 使用 std::thread/lock_guard/std::mutex 等标准库实现，生成的 DOT 充满模板与实现细节：unique_ptr/tuple/impl、__gthread/pthread 包装等，阅读成本高。
- 示例 simple_thread.cpp 中，`ThreadManager::createThreads()` 触发大量 `std::thread::thread<...>` 内部节点；`waitForCompletion()` 遍历 `join()`；`processData()` 经 `lock_guard/mutex` 间接落到 `__gthread/pthread`。
- 目标：将图压缩为 main → ThreadManager → workerThread → Task::execute → {processData, saveResult}，并以统一语义展示“创建线程/等待线程、加锁/解锁”。

## 2. 总体方案（后处理“简化器”）

在 DOT 生成后做一次“语义保留 + 噪声折叠”的后处理，输出一个简化 DOT：

1) 统一与清洗：
   - 已在 `generate.py` 增加了去改编，保证函数名可读（`_ZN...` → `ns::Class::Func()`）
   - 节点名规范化（去引号、trim），便于规则匹配。

2) 过滤库实现：
   - 隐藏/跳过前缀：`std::`, `std::__`, `std::_`, `__gnu_cxx::`, `__gthread*`, `__cxxabiv1::` 等；
   - 少量“锚点”例外（用于语义识别）：`std::thread::thread<...>`, `std::thread::join()`, `std::mutex::lock/unlock`, `std::lock_guard<...>::(ctor/dtor)`。

3) 线程语义映射与链路压缩：
   - 将 `std::thread::thread<...>` 识别为“线程创建”，压缩中间链路；
   - 将 `std::thread::join()` 识别为“线程等待”；
   - 将 `lock_guard/mutex/__gthread/pthread` 的加解锁统一映射为 `pthread_mutex_lock/unlock` 语义节点；
   - 对“仅由库节点组成”的链路进行传递压缩：用户/语义节点 →（跳过库节点）→ 用户/语义节点。

4) 输出简化图：
   - 仅保留“用户节点 + 语义节点”，隐藏其余库节点；
   - 主入口（如 `main`）高亮；
   - 语义节点（join/lock/unlock）使用灰色虚线风格，保持与 C 版一致。

## 3. 语义映射规则

- 线程创建（create）：
  - 识别：`X -> std::thread::thread<...>`；
  - 目标入口：
    - 优先在 DOT 中寻找工作函数（如 `workerThread(int,int)`）；若没有，从源代码中解析 `std::thread(workerThread, ...)` 的第一个参数；
  - 建立语义边：`X -> workerThread(...)`；可选对边加 label（如 thread i）。

- 线程等待（join）：
  - 识别：`X -> std::thread::join()`；
  - 映射：节点视为 `pthread_join` 语义或保留名但用“语义样式”。

- 互斥锁（lock/unlock）：
  - 识别：`std::lock_guard<...>::lock_guard()` / `~lock_guard()`，`std::mutex::lock()` / `unlock()`，以及 `__gthread_mutex_*` / `pthread_mutex_*`；
  - 统一映射：`pthread_mutex_lock` / `pthread_mutex_unlock` 两个语义节点；
  - 样式：灰色虚线。

## 4. 实现步骤（建议）

1) 新增后处理脚本 `simplify_dot.py`（或在 `generate.py` 增加 `--simplify-cxx`）：
   - 读取 DOT：优先 `nx.nx_pydot.read_dot`，失败回退 `pydot` 转换，再回退正则解析（仓库已有通用实现可复用）。
   - 节点分类：
     - lib：命中库前缀；
     - semantic：命中创建/等待/锁的关键正则；
     - user：其余。

2) 构造“线程创建”的语义边：
   - 遍历边 `src -> dst`，若 `dst` 匹配 `std::thread::thread<...>`：
     - 在图或源中推断工作函数名（如 `workerThread`），添加 `src -> workerThread`；
     - 标记该边为 `thread-start` 样式。

3) 构造“线程等待”的语义边：
   - 将 `src -> std::thread::join()` 统一设为 `src -> pthread_join`（或保留原名 + 语义样式）。

4) 构造“加解锁”的语义边：
   - 将所有 lock 系列统一连到 `pthread_mutex_lock`，unlock 系列连到 `pthread_mutex_unlock`；
   - 可将 `lock_guard` ctor/dtor 映射为 lock/unlock。

5) 压缩库链路：
   - 对每个用户/语义节点，沿后继跳过库节点直到用户/语义节点，添加直接边；
   - 移除库节点；去重边。

6) 输出：
   - 仅输出用户/语义节点；
   - `main` 高亮；join/lock/unlock 灰色虚线；
   - 生成 `<basename>_simple.dot`（预览无误后可开启 `--inplace` 覆盖）。

## 5. 需要解决的具体问题

- 工作函数名缺失：当 `workerThread` 未出现在 DOT 中时，从源代码补充推断（解析 `std::thread(IDENT, ...)`）。
- 库前缀黑名单与语义白名单的稳定维护，避免误伤用户节点。
- 链路压缩的正确性：仅压缩“全库节点链路”，遇到用户/语义节点即停止。
- 与 GUI/工具兼容：
  - 我们已修复 `nx_pydot` 与 `pydot` 的 get_strict() 兼容问题；
  - 简化后的 DOT 仍符合现有查看器的解析规则。

## 6. 期望输出（以 simple_thread.cpp 为例）

```
"main" -> "ThreadManager::start()"
"ThreadManager::start()" -> "ThreadManager::createThreads()"
"ThreadManager::createThreads()" -> "workerThread(int, int)"   # 由语义推断
"workerThread(int, int)" -> "Task::execute()"
"Task::execute()" -> "Task::processData()"
"Task::execute()" -> "Task::saveResult()"
"Task::processData()" -> "pthread_mutex_lock"     # 语义映射
"Task::processData()" -> "pthread_mutex_unlock"   # 语义映射
"ThreadManager::start()" -> "ThreadManager::waitForCompletion()"
"ThreadManager::waitForCompletion()" -> "pthread_join"         # 语义映射
```

样式建议：

- root（main）：蓝色填充；
- 语义节点（join/lock/unlock）：灰色虚线；
- 线程创建边：可加 label（如 thread i），按需实现。

## 7. 落地计划与开关

- 第 1 阶段：实现 `simplify_dot.py` 并在 `generate.py` 后置调用，输出 `_simple.dot` 供对比；
- 第 2 阶段：加 `--simplify-cxx` 与 `--inplace` 开关，默认开启简化但不覆盖，确认后再改为覆盖；
- 第 3 阶段：扩展“工作函数名推断”对 `lambda/std::bind` 情况的支持。

## 8. 限制与扩展

- 复杂模板/内联可能导致工作函数未入图，此时依赖“源代码推断”；
- 过度压缩会牺牲细节，可提供 `--no-simplify` 回退原图；
- 规则需要按工程风格迭代（前缀/正则可配置）。

