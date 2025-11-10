#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <chrono>
#include <iostream>
#include <memory>
#include <thread>

// -----------------------------------------------------------------------------
// 简化版任务实现：原始 produce5 依赖 task.h 中的算法例程。
// 这里提供可运行的占位函数，用于构建线程调用图。
// -----------------------------------------------------------------------------
static void simulate_work(const char *name, int value)
{
    std::cout << "[task] " << name << " arg=" << value << std::endl;
    volatile int acc = 0;
    for (int i = 0; i < 10000; ++i) {
        acc += (value + i) % 7;
    }
    (void)acc;
}

void Deg2rad(void *arg)   { simulate_work("Deg2rad",   *static_cast<int *>(arg)); }
void rad2deg(void *arg)   { simulate_work("rad2deg",   *static_cast<int *>(arg)); }
void cover(void *arg)     { simulate_work("cover",     *static_cast<int *>(arg)); }
void duff(void *arg)      { simulate_work("duff",      *static_cast<int *>(arg)); }
void insertsort(void *arg){ simulate_work("insertsort",*static_cast<int *>(arg)); }
void minver(void *arg)    { simulate_work("minver",    *static_cast<int *>(arg)); }
void ndes(void *arg)      { simulate_work("ndes",      *static_cast<int *>(arg)); }
void ludcmp(void *arg)    { simulate_work("ludcmp",    *static_cast<int *>(arg)); }
void prime(void *arg)     { simulate_work("prime",     *static_cast<int *>(arg)); }

// -----------------------------------------------------------------------------
// 线程层次结构：
//   main -> threadTask1 -> threadTask2 -> {threadTask3, threadTask4}
// -----------------------------------------------------------------------------
static pthread_t g_thread_lvl0 {};
static pthread_t g_thread_lvl1 {};
static pthread_t g_thread_lvl2 {};
static pthread_t g_thread_lvl3 {};

void *threadTask3(void *arg)
{
    std::unique_ptr<int> payload(static_cast<int *>(arg));
    rad2deg(payload.get());
    std::cout << "task8 完成" << std::endl;
    return nullptr;
}

void *threadTask4(void *arg)
{
    std::unique_ptr<int> payload(static_cast<int *>(arg));
    prime(payload.get());
    std::cout << "task9 完成" << std::endl;
    return nullptr;
}

void *threadTask2(void *arg)
{
    std::unique_ptr<int> root(static_cast<int *>(arg));

    auto task_arg1 = std::make_unique<int>(43);
    auto task_arg2 = std::make_unique<int>(44);

    minver(root.get());
    std::cout << "task5 完成" << std::endl;

    if (pthread_create(&g_thread_lvl2, nullptr, threadTask3, task_arg1.release()) != 0) {
        std::perror("pthread_create threadTask3 failed");
        return nullptr;
    }

    if (pthread_create(&g_thread_lvl3, nullptr, threadTask4, task_arg2.release()) != 0) {
        std::perror("pthread_create threadTask4 failed");
        return nullptr;
    }

    ndes(root.get());
    std::cout << "task6 完成" << std::endl;

    pthread_join(g_thread_lvl2, nullptr);
    pthread_join(g_thread_lvl3, nullptr);

    ludcmp(root.get());
    std::cout << "task7 完成" << std::endl;
    return nullptr;
}

void *threadTask1(void *arg)
{
    std::unique_ptr<int> root(static_cast<int *>(arg));
    auto nested_arg = std::make_unique<int>(42);

    Deg2rad(root.get());
    std::cout << "task1 完成" << std::endl;

    if (pthread_create(&g_thread_lvl1, nullptr, threadTask2, nested_arg.release()) != 0) {
        std::perror("pthread_create threadTask2 failed");
        return nullptr;
    }

    cover(root.get());
    std::cout << "task2 完成" << std::endl;
    duff(root.get());
    std::cout << "task3 完成" << std::endl;

    pthread_join(g_thread_lvl1, nullptr);

    insertsort(root.get());
    std::cout << "task4 完成" << std::endl;
    return nullptr;
}

void threadTask5()
{
    int i = 0;
    while (i < 3) {
        std::cout << "while 测试: i=" << i << std::endl;
        ++i;
    }

    do {
        std::cout << "do-while 测试" << std::endl;
        --i;
    } while (i == 0);

    for (int j = 0; j < 5; ++j) {
        std::cout << "for 测试 j=" << j << std::endl;
    }

    int j = 2;
    switch (j) {
    case 1:
        std::cout << "switch:1" << std::endl;
        break;
    case 2:
        std::cout << "switch:2" << std::endl;
        break;
    default:
        std::cout << "switch:default" << std::endl;
        break;
    }
}

int main()
{
    threadTask5();

    auto main_arg = std::make_unique<int>(41);
    if (pthread_create(&g_thread_lvl0, nullptr, threadTask1, main_arg.release()) != 0) {
        std::perror("pthread_create threadTask1 failed");
        return 1;
    }

    if (pthread_join(g_thread_lvl0, nullptr) != 0) {
        std::perror("pthread_join lvl0 failed");
        return 1;
    }

    std::cout << "主线程完成" << std::endl;
    return 0;
}
