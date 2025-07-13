#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>   // 声明 malloc、free
#include <pthread.h>  // 声明 pthread_*

// 定义互斥锁
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_t thread, thread1;
// 线程A
void* threadtask1(void* arg) {
    pthread_mutex_lock(&mutex);  // 获取锁，进入临界区
    printf("A");
    pthread_mutex_unlock(&mutex);  // 释放锁，允许其他线程访问
    return NULL;
}

// 线程B
void* threadtask2(void* arg) {
    pthread_mutex_lock(&mutex);  // 获取锁，进入临界区
    printf("B");
    pthread_mutex_unlock(&mutex);  // 释放锁，允许其他线程访问
    return NULL;
}

int main() {
    int* task_arg = malloc(sizeof(int)); // 动态分配内存给任务参数
    if (task_arg == NULL) {
        fprintf(stderr, "内存分配失败\n");
        return 1;
    }
    *task_arg = 41;
    // 创建线程A
    if (pthread_create(&thread, NULL, threadtask1, task_arg) != 0) {
        printf("Failed to create thread A");
        return 1;
    }

    // 创建线程B
    if (pthread_create(&thread1, NULL, threadtask2, task_arg) != 0) {
        printf("Failed to create thread B");
        return 1;
    }

    // 等待线程完成
    pthread_join(thread, NULL);
    pthread_join(thread1, NULL);

    // 销毁互斥锁
    pthread_mutex_destroy(&mutex);

    return 0;
}
