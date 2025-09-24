#include <stdio.h>
#include <pthread.h>
#include <unistd.h>

// 定义互斥锁
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

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
    pthread_t t1, t2;

    // 创建线程A
    if (pthread_create(&t1, NULL, threadtask1, NULL) != 0) {
        printf("Failed to create thread A");
        return 1;
    }

    // 创建线程B
    if (pthread_create(&t2, NULL, threadtask2, NULL) != 0) {
        printf("Failed to create thread B");
        return 1;
    }

    // 等待线程完成
    pthread_join(t1, NULL);
    pthread_join(t2, NULL);


    // 销毁互斥锁
    pthread_mutex_destroy(&mutex);

    return 0;
}
