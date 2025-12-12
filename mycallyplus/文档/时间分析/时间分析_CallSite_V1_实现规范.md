
# MyCallyPlus 时间分析机制说明（最新）

本文聚合了时间分析相关的实现规则与使用方式，仅保留一份文档，便于维护。

## 1. 目标与范围
- 基于 `mycalls_meta_internal.json` 中的调用点信息，对 C 源代码逐调用点插桩计时。
- 支持条件内调用：`if/while/for` 条件里的函数会被就地包裹计时，保持原有布尔语义。
- 仅限 `.c` 文件；当前不处理头文件插桩。

## 2. 输入与输出
- 输入：`mycalls_meta_internal.json`，键为调用点唯一名（如 `threadtask2/pthread_create5`），字段含 `file/line/col/extern`。
- 插桩产物：`中间结果/<basename>/时间分析/<项目>/` 内的修改后源码、`time_stat.c/h`、可执行 `app`。
- 结果：
  - `time_result.json`：按调用点键统计 `total_ns/count/avg_ns/max_ns/min_ns`（单位均为纳秒 ns）。
  - `mycalls_meta_internal.json` 回写计时字段：`miss`（计时失败标记）、`executed`（运行是否触达）、`skip_reason`。
  - `thread_time_summary.json`：按顶层键（线程/任务入口）汇总 `miss=false` 的 `total_ns/count`。

## 3. 插桩规则
- 定位：按 JSON 中的 `file/line` 找到语句结束（括号深度 + 分号）。
- 条件内调用：将调用替换为 GNU 语句表达式包裹，示例：
  ```c
  if ((__extension__({ uint64_t t = now_ns();
    __auto_type r = pthread_create(...);
    time_account("threadtask2/pthread_create5", now_ns() - t);
    r;
  })) != 0) { ... }
  ```
  结果保持原返回值，计时必执行。
- 普通调用：在语句前插入 `TA_BEGIN`，后插入 `TA_END` 记录耗时；变量名基于调用点键生成安全标识。
- 去重：若同一调用点已存在 `TA_BEGIN` 标记则跳过。
- 自动补充 `#include "time_stat.h"  // TA_INCLUDE`。

## 4. 运行与回写
- 自动拷贝 `time_stat.c/h`，编译为 `app`（`gcc -O2 -std=c11 -pthread -I. -Iinclude`），运行后生成 `time_result.json`。
- 回写规则：
  - 找到匹配键（优先 JSON 原键，兼容 `func@file:line`），写入计时字段（单位 ns），`miss=false`，`executed=true`。
  - 插桩但未执行：`miss=true`，`executed=false`，计时字段为 0。
  - 未插桩（文件缺失/非 C 等）：`miss=true`，`executed=false`，`skip_reason=not_instrumented`。
- 线程汇总：按顶层键聚合 `miss=false` 的 `total_ns/count`，输出 `thread_time_summary.json`。

## 5. 时间统计库（time_stat）
- 提供 `now_ns()`（CLOCK_MONOTONIC 纳秒）与 `time_account(key, dur_ns)`。
- 内部用 `pthread_mutex` 保护，进程退出时自动生成 `time_result.json`。

## 6. 开发/调试提示
- 插桩按行号降序执行，避免前插导致行偏移。
- 条件内包裹使用 GNU 语句表达式；若需纯 C11，可改用临时变量重写条件。
- 如需细化 `skip_reason`，可在插桩阶段对未插入的调用点设置原因（例如定位失败）。
