# FixedwingRateControl 调用图中“非源码显式调用”归因说明

依据：`mycallyplus/中间结果/FixedwingRateControldemangled/生成dag图/dag.dot`。目标：列出 dot 中出现、但 `mycallyplus/源文件/FixedwingRateControl/FixedwingRateControl.cpp` 未直接书写的调用，并说明来源，便于阅读对照。

## 1. 构造/析构链
- 基类构造：`px4::WorkItem::WorkItem(const char*, const px4::wq_config_t&)`，由构造函数初始化列表的 `ScheduledWorkItem(MODULE_NAME, ...)` 触发。
- 订阅自动注册/反注册：多次 `uORB::Subscription::subscribe()` / `unsubscribe()` 来自成员 `_vehicle_angular_velocity_sub` 等的构造/析构内联。
- 发布清理：`uORB::Manager::orb_get_queue_size`、`orb_unadvertise` 源于 `uORB::PublicationBase` 析构的内联释放。
- 回调注销：`uORB::Manager::unregister_callback` 在 `SubscriptionCallbackWorkItem` 析构时调用。
- 性能计数器：`perf_alloc` / `perf_free` 为 `_loop_perf` 的创建与释放（构造/析构内联）。
- 删除运算符：`operator delete` 为析构路径自动插入的默认释放。
- ScheduledWorkItem 析构：`px4::ScheduledWorkItem::~ScheduledWorkItem()`，析构链尾部自动调用。

## 2. 参数系统（ModuleParams 与 DEFINE_PARAMETERS）
- 自动生成的参数访问：`param_get` / `param_set_used` / `param_type` / `param_name` / `px4_log_modulename`，出现在构造阶段和 `updateParamsImpl()`，由 ModuleParams 宏展开内联，源码无显式调用。
- 栈保护插桩：`__stack_chk_fail` 出现在参数更新函数末尾，为编译器自动添加的保护。

## 3. uORB 收发封装
- 轮询：`uORB::Manager::updates_available`、`orb_data_copy` 来自 `Subscription::updated()/copy()` 的内联封装（如 `vehicle_land_detected_poll()`、`vehicle_manual_poll()`）。
- 发布：`orb_advertise`、`uORB::Manager::orb_publish` 由 `_rate_sp_pub.publish` 等内联封装触发（`vehicle_manual_poll()` 中）。
- 回调入队：`px4::WorkQueue::Add` 在 `uORB::SubscriptionCallbackWorkItem::call()` 内联中，将回调提交到工作队列。
- 回调辅助：`uORB::SubscriptionInterval::updated()`，在 `SubscriptionCallbackWorkItem::call()` 内联中调用以检查更新。
- 时间戳获取：`hrt_absolute_time()`，在手动轮询发布路径的 publish 封装内联调用。
- 元信息获取：`get_orb_meta(ORB_ID)`，publish 内联封装中使用。

## 4. 运行时与 CLI 框架
- 线程/同步：`pthread_mutex_lock` / `pthread_mutex_unlock` / `px4_task_delete` / `px4_usleep` 出现在 `ModuleBase` 的命令处理流程（`main` / `stop_command` / `status_command`）中，为框架代码，源码未显式书写。
- 字符串比较：`strcmp`，`ModuleBase::main` 解析 CLI 子命令时调用。
- 应用入口：`ModuleBase<FixedwingRateControl>::main` / `status_command` / `stop_command` / `print_status` / `print_usage` / `~ModuleBase`，这些均定义在模板基类/头文件中，`FixedwingRateControl.cpp` 仅通过模板实例化触发。
- 参数类析构：`ModuleParams::~ModuleParams()`，模板基类的析构内联。

## 5. 阅读提示
- 节点名尾部的 `…()/数字`（如 `/subscribe()2`）仅为编译器区分调用点的标签，不映射到源码行号。
- 以上调用均源自头文件内联、框架基类或编译器插桩，并非 `FixedwingRateControl.cpp` 中的显式函数调用。

## 6. 快速对照清单（dot 中出现且源码未直接书写的函数/符号）
- 框架构造/析构：`px4::WorkItem::WorkItem`、`px4::ScheduledWorkItem::~ScheduledWorkItem`、`operator delete`
- uORB 注册类：`uORB::Subscription::subscribe` / `unsubscribe`、`uORB::Manager::unregister_callback`、`uORB::SubscriptionCallbackWorkItem::call`、`uORB::SubscriptionInterval::updated`、`uORB::Manager::updates_available`、`uORB::Manager::orb_data_copy`
- 发布清理：`uORB::Manager::orb_get_queue_size`、`uORB::Manager::orb_unadvertise`、`uORB::PublicationBase::~PublicationBase`
- 性能计数：`perf_alloc`、`perf_free`
- 参数系统：`param_get`、`param_set_used`、`param_type`、`param_name`、`px4_log_modulename`、`__stack_chk_fail`
- 发布封装：`orb_advertise`、`uORB::Manager::orb_publish`、`get_orb_meta`、`hrt_absolute_time`
- CLI/线程：`pthread_mutex_lock`、`pthread_mutex_unlock`、`px4_task_delete`、`px4_usleep`、`strcmp`
- 模板基类：`ModuleBase<FixedwingRateControl>::main`、`status_command`、`stop_command`、`print_status`、`print_usage`、`ModuleParams::~ModuleParams`
