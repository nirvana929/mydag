#include <stdio.h>
#include <pthread.h>
#include <unistd.h>   // for sleep()

// ====== 全局变量与同步原语 ======
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t  cond  = PTHREAD_COND_INITIALIZER;
int ready = 0; // 共享状态

// ====== Watcher 线程函数 ======
void* watcher(void* arg)
{
    int id = (int)(long)arg;
    pthread_mutex_lock(&mutex);

    while (!ready) {
        printf("[Watcher %d] waiting for signal...\n", id);
        pthread_cond_wait(&cond, &mutex);  // 自动解锁并等待，唤醒后自动加锁
    }

    printf("[Watcher %d] received signal! ready=%d ✅\n", id, ready);
    pthread_mutex_unlock(&mutex);
    return NULL;
}

// ====== Producer 线程函数 ======
void* producer(void* arg)
{
    sleep(2); // 模拟耗时操作
    pthread_mutex_lock(&mutex);
    ready = 1;
    printf("[Producer] produced item, sending signal...\n");
    pthread_cond_signal(&cond); // 唤醒一个等待线程
    pthread_mutex_unlock(&mutex);
    return NULL;
}

// ====== 主函数 ======
int main(void)
{
    pthread_t t1, t2, t3;

    pthread_create(&t1, NULL, watcher, (void*)1);
    pthread_create(&t2, NULL, watcher, (void*)2);
    pthread_create(&t3, NULL, producer, NULL);

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);
    pthread_join(t3, NULL);

    pthread_mutex_destroy(&mutex);
    pthread_cond_destroy(&cond);
    return 0;
}
