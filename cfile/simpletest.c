#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>
#include <unistd.h>

pthread_mutex_t mutex;   // 互斥锁
sem_t sem;               // 信号量

void* worker(void* arg)
{
    for (int i = 0; i < 5; i++) {
        pthread_mutex_lock(&mutex);    // 加锁，保护打印区
        printf("[Worker] Working... step %d\n", i + 1);
        pthread_mutex_unlock(&mutex);  // 解锁

        sleep(1);                      // 模拟耗时
        sem_post(&sem);                // 通知主线程：完成一次工作
    }
    return NULL;
}

int main()
{
    pthread_t tid;
    pthread_mutex_init(&mutex, NULL);
    sem_init(&sem, 0, 0);  // 初始化信号量，初值0
    pthread_create(&tid, NULL, worker, NULL);

    for (int i = 0; i < 5; i++) {
        sem_wait(&sem);                // 等待工作完成信号
        pthread_mutex_lock(&mutex);
        printf("    [Main] Received signal %d from worker ✅\n", i + 1);
        pthread_mutex_unlock(&mutex);
    }

    pthread_join(tid, NULL);

    sem_destroy(&sem);
    pthread_mutex_destroy(&mutex);
    printf("All work done.\n");
    return 0;
}
