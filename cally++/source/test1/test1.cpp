#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// ----------------------------------------------------------------------------- 
// 任务实现
// ----------------------------------------------------------------------------- 
void Deg2rad(void *arg)
{
    (void)arg;
    int value = 0;
    printf("[task] Deg2rad\n");
    volatile int acc = 0;
    for (int i = 0; i < 10000; ++i) {
        acc += (value + i) % 7;
    }
    (void)acc;
}

void rad2deg(void *arg)
{
    (void)arg;
    int value = 0;
    printf("[task] rad2deg\n");
    volatile int acc = 0;
    for (int i = 0; i < 10000; ++i) {
        acc += (value + i) % 7;
    }
    (void)acc;
}

void cover(void *arg)
{
    (void)arg;
    int value = 0;
    printf("[task] cover\n");
    volatile int acc = 0;
    for (int i = 0; i < 10000; ++i) {
        acc += (value + i) % 7;
    }
    (void)acc;
}

void duff(void *arg)
{
    (void)arg;
    int value = 0;
    printf("[task] duff\n");
    volatile int acc = 0;
    for (int i = 0; i < 10000; ++i) {
        acc += (value + i) % 7;
    }
    (void)acc;
}

void insertsort(void *arg)
{
    (void)arg;
    int value = 0;
    printf("[task] insertsort\n");
    volatile int acc = 0;
    for (int i = 0; i < 10000; ++i) {
        acc += (value + i) % 7;
    }
    (void)acc;
}

void minver(void *arg)
{
    (void)arg;
    int value = 0;
    printf("[task] minver\n");
    volatile int acc = 0;
    for (int i = 0; i < 10000; ++i) {
        acc += (value + i) % 7;
    }
    (void)acc;
}

void ndes(void *arg)
{
    (void)arg;
    int value = 0;
    printf("[task] ndes\n");
    volatile int acc = 0;
    for (int i = 0; i < 10000; ++i) {
        acc += (value + i) % 7;
    }
    (void)acc;
}

void ludcmp(void *arg)
{
    (void)arg;
    int value = 0;
    printf("[task] ludcmp\n");
    volatile int acc = 0;
    for (int i = 0; i < 10000; ++i) {
        acc += (value + i) % 7;
    }
    (void)acc;
}

void prime(void *arg)
{
    (void)arg;
    int value = 0;
    printf("[task] prime\n");
    volatile int acc = 0;
    for (int i = 0; i < 10000; ++i) {
        acc += (value + i) % 7;
    }
    (void)acc;
}

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
    int *payload = (int *)arg;
    rad2deg(payload);
    printf("task8 完成\n");
    if (payload) free(payload); // 在线程内释放自己拥有的参数
    return NULL;
}

void *threadTask4(void *arg)
{
    int *payload = (int *)arg;
    prime(payload);
    printf("task9 完成\n");
    if (payload) free(payload);
    return NULL;
}

void *threadTask2(void *arg)
{
    int *root = (int *)arg;

    // 为子线程准备参数（使用 malloc 分配，子线程内释放）
    int *task_arg1 = (int *)malloc(sizeof(int));
    int *task_arg2 = (int *)malloc(sizeof(int));
    if (task_arg1) *task_arg1 = 43;
    if (task_arg2) *task_arg2 = 44;

    minver(root);
    printf("task5 完成\n");

    if (pthread_create(&g_thread_lvl2, NULL, threadTask3, task_arg1) != 0) {
        perror("pthread_create threadTask3 failed");
        if (task_arg1) free(task_arg1);
        if (task_arg2) free(task_arg2);
        if (root) free(root);
        return NULL;
    }

    if (pthread_create(&g_thread_lvl3, NULL, threadTask4, task_arg2) != 0) {
        perror("pthread_create threadTask4 failed");
        // 回收前一个已创建线程
        pthread_join(g_thread_lvl2, NULL);
        if (task_arg2) free(task_arg2);
        if (root) free(root);
        return NULL;
    }

    ndes(root);
    printf("task6 完成\n");

    pthread_join(g_thread_lvl2, NULL);
    pthread_join(g_thread_lvl3, NULL);

    ludcmp(root);
    printf("task7 完成\n");

    if (root) free(root);
    return NULL;
}

void *threadTask1(void *arg)
{
    int *root = (int *)arg;

    // 为下一级线程准备参数
    int *nested_arg = (int *)malloc(sizeof(int));
    if (nested_arg) *nested_arg = 42;

    Deg2rad(root);
    printf("task1 完成\n");

    if (pthread_create(&g_thread_lvl1, NULL, threadTask2, nested_arg) != 0) {
        perror("pthread_create threadTask2 failed");
        if (nested_arg) free(nested_arg);
        if (root) free(root);
        return NULL;
    }

    cover(root);
    printf("task2 完成\n");

    duff(root);
    printf("task3 完成\n");

    pthread_join(g_thread_lvl1, NULL);

    insertsort(root);
    printf("task4 完成\n");

    if (root) free(root);
    return NULL;
}

void threadTask5()
{
    int i = 0;
    while (i < 3) {
        printf("while 测试: i=%d\n", i);
        ++i;
    }

    do {
        printf("do-while 测试\n");
        --i;
    } while (i == 0);

    for (int j = 0; j < 5; ++j) {
        printf("for 测试 j=%d\n", j);
    }

    int j = 2;
    switch (j) {
    case 1:
        printf("switch:1\n");
        break;
    case 2:
        printf("switch:2\n");
        break;
    default:
        printf("switch:default\n");
        break;
    }
}

int main()
{
    threadTask5();

    int *main_arg = (int *)malloc(sizeof(int));
    if (main_arg) *main_arg = 41;

    if (pthread_create(&g_thread_lvl0, NULL, threadTask1, main_arg) != 0) {
        perror("pthread_create threadTask1 failed");
        if (main_arg) free(main_arg);
        return 1;
    }

    if (pthread_join(g_thread_lvl0, NULL) != 0) {
        perror("pthread_join lvl0 failed");
        return 1;
    }

    printf("主线程完成\n");
    return 0;
}
