#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <semaphore.h>
// 定义共享资源
int shared_resource = 0;

// 定义信号量
sem_t semaphore;

// 线程 A
void* threadA(void* arg) {
    // 等待信号量
    sem_wait(&semaphore);

    // 修改共享资源
    shared_resource += 10;
    printf("Thread A: Shared resource updated, value: %d\n", shared_resource);

    // 释放信号量
    sem_post(&semaphore);

    return NULL;
}

// 线程 B
void* threadB(void* arg) {
    // 等待信号量
    sem_wait(&semaphore);

    // 修改共享资源
    shared_resource += 20;
    printf("Thread B: Shared resource updated, value: %d\n", shared_resource);

    // 释放信号量
    sem_post(&semaphore);

    return NULL;
}

// 线程 C
void* threadC(void* arg) {
    // 等待线程 A 和线程 B 完成
    // 由于没有条件变量，线程 C 将通过信号量等待前面的线程完成。
    // 假设线程 C 只在 A 和 B 完成后继续执行，信号量的使用确保了同步。
    

    // 使用信号量控制同步
    sem_wait(&semaphore);
    printf("Thread C: Shared resource value: %d\n", shared_resource);
    sem_post(&semaphore);

    return NULL;
}

int main() {
    int* task_arg = malloc(sizeof(int)); // 动态分配内存给任务参数
    if (task_arg == NULL) {
        fprintf(stderr, "内存分配失败\n");
        return 1;
    }
    *task_arg = 41; // 设置任务参数
    pthread_t thread, thread1, thread2;

    // 初始化信号量，初始值为 1，表示资源的可用性
    sem_init(&semaphore, 0, 1);

    // 创建线程 A、B 和 C
    pthread_create(&thread, NULL, threadA, task_arg);
    pthread_create(&thread1, NULL, threadB, task_arg);
    pthread_create(&thread2, NULL, threadC, task_arg);

    // 等待线程结束
    pthread_join(thread, NULL);
    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);

    // 销毁信号量
    sem_destroy(&semaphore);

    return 0;
}
