需求重述（面向实现）

- 背景：已有 C 版本的 produce5 示例位于 `mydag/mycallyplus/源文件/produce5/`，主程序 `main.c` 通过 `include/task.h` 调用多个任务函数（位于 `src/*.c`）。
- 目标：将该工程迁移为标准 C++ 源文件组织，保持与 C 版本相同的线程/任务结构与功能语义（参数传递、线程创建和 join 顺序、输出节点）。
- 产出：在 `mydag/cally++/source/produce5/` 下提供 C++ 版本的入口与线程组织代码，后续可逐步把各任务函数从 C 迁移为独立的 C++ 源文件。

目录与文件

- `produce5.cpp`
  - 用 C++ 实现了与 `main.c` 等价的线程拓扑：`main -> threadtask1 -> threadtask2 -> {threadtask3, threadtask4}`。
  - 保留任务函数调用顺序：`Deg2rad → cover → duff → insertsort` 与 `minver → ndes → ludcmp`，以及并发的 `rad2deg`、`prime`。
- `task.hpp`
  - 声明九个任务函数（`void* name(void*)`），供线程例程复用。
- `deg2rad.cpp`、`rad2deg.cpp`、`cover.cpp`、`duff.cpp`、`insertsort.cpp`、`minver.cpp`、`ndes.cpp`、`ludcmp.cpp`、`prime.cpp`
  - 从 `src/*.c` 迁移而来，按照 C++ 语法调整 include/返回值/指针处理，但算法、全局变量与 `_Pragma` 注解保持不变，确保和原 C 工程一致的行为。

编译运行建议

- 在 `mydag/cally++/source/produce5/` 下执行  
  `g++ -std=c++17 -pthread *.cpp -o produce5 && ./produce5`
- 需要 pthread 支持，输出与原 C 工程一致（含线程创建/结束日志）。
