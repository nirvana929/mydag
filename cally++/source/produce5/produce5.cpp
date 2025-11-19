// C++ 移植版：基于 mycallyplus/源文件/produce5/main.c 的线程结构
// 目标：保持与原 C 工程相同的任务/线程结构与功能语义（参数传递、线程创建/等待顺序、打印节点）。

#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <iostream>

#include "task.hpp"

// -----------------------------------------------------------------------------
// 线程层次结构：
//   main -> threadtask1 -> threadtask2 -> {threadtask3, threadtask4}
// -----------------------------------------------------------------------------
static pthread_t g_thread0 {};
static pthread_t g_thread1 {};
static pthread_t g_thread2 {};
static pthread_t g_thread3 {};

void* threadtask3(void* arg)
{
    rad2deg(arg);
    std::cout << "task8结束" << std::endl;
    return nullptr;
}

void* threadtask4(void* arg)
{
    prime(arg);
    std::cout << "task9结束" << std::endl;
    return nullptr;
}

void* threadtask2(void* arg)
{
    // 为两个子线程准备参数
    int* task_arg1 = (int*)malloc(sizeof(int));
    int* task_arg2 = (int*)malloc(sizeof(int));
    if (task_arg1) *task_arg1 = 43;
    if (task_arg2) *task_arg2 = 44;

    minver(arg);
    std::cout << "task5结束" << std::endl;

    if (pthread_create(&g_thread2, nullptr, threadtask3, task_arg1) != 0) {
        std::perror("pthread_create threadtask3 failed");
        if (task_arg1) free(task_arg1);
        if (task_arg2) free(task_arg2);
        return nullptr;
    }

    if (pthread_create(&g_thread3, nullptr, threadtask4, task_arg2) != 0) {
        std::perror("pthread_create threadtask4 failed");
        // 若第二个线程创建失败，等待并回收第一个
        pthread_join(g_thread2, nullptr);
        if (task_arg1) free(task_arg1);
        if (task_arg2) free(task_arg2);
        return nullptr;
    }

    ndes(arg);
    std::cout << "task6结束" << std::endl;

    pthread_join(g_thread2, nullptr);
    pthread_join(g_thread3, nullptr);

    // 子线程计算完成后，由父线程统一释放参数，保持与原 C 版本一致的所有权。
    if (task_arg1) free(task_arg1);
    if (task_arg2) free(task_arg2);

    ludcmp(arg);
    std::cout << "task7结束" << std::endl;
    return nullptr;
}

void* threadtask1(void* arg)
{
    int* task_arg1 = (int*)malloc(sizeof(int));
    if (!task_arg1) {
        std::perror("malloc failed");
        return nullptr;
    }
    *task_arg1 = 42;

    Deg2rad(arg);
    std::cout << "task1结束" << std::endl;

    if (pthread_create(&g_thread1, nullptr, threadtask2, task_arg1) != 0) {
        std::perror("pthread_create threadtask2 failed");
        free(task_arg1);
        return nullptr;
    }

    cover(arg);
    std::cout << "task2结束" << std::endl;

    duff(arg);
    std::cout << "task3结束" << std::endl;

    pthread_join(g_thread1, nullptr);
    if (task_arg1) free(task_arg1);

    insertsort(arg);
    std::cout << "task4结束" << std::endl;
    return nullptr;
}

static void threadtask5()
{
    int i = 0;
    while (i < 3) {
        std::cout << "while循环测试" << std::endl;
        ++i;
    }
    do {
        std::cout << "do-while循环测试" << std::endl;
        --i;
    } while (i == 0);
    for (int k = 0; k < 5; ++k) {
        std::cout << "for循环测试" << std::endl;
    }
    int j = 2;
    switch (j) {
    case 1: std::cout << "switch:1测试" << std::endl; break;
    case 2: std::cout << "switch:2测试" << std::endl; break;
    default: std::cout << "hello" << std::endl; break;
    }
}

int main()
{
    threadtask5();

    int* task_arg = (int*)malloc(sizeof(int));
    if (!task_arg) {
        std::perror("malloc failed");
        return 1;
    }
    *task_arg = 41;

    if (pthread_create(&g_thread0, nullptr, threadtask1, task_arg) != 0) {
        std::perror("pthread_create threadtask1 failed");
        free(task_arg);
        return 1;
    }

    if (pthread_join(g_thread0, nullptr) != 0) {
        std::perror("pthread_join failed");
        free(task_arg);
        return 1;
    }

    // 线程已结束，参数在本实现中未被任务接管所有权，这里回收
    free(task_arg);
    std::cout << "主线程已完成" << std::endl;
    return 0;
}
