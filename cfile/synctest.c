#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <semaphore.h>
#include <unistd.h>

#define BUFFER_SIZE 5
#define PRODUCE_COUNT 10

int buffer[BUFFER_SIZE];
int count = 0;  // 当前缓冲区元素个数
int done = 0;   // 标志生产结束

pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t cond_full  = PTHREAD_COND_INITIALIZER;
pthread_cond_t cond_empty = PTHREAD_COND_INITIALIZER;
sem_t sem_total;  // 控制总生产数量

void* producer(void* arg)
{
    int id = (int)(long)arg;

    while (1) {
        sem_wait(&sem_total); // 控制总任务数量
        pthread_mutex_lock(&mutex);

        // 等待缓冲区未满
        while (count == BUFFER_SIZE) {
            pthread_cond_wait(&cond_full, &mutex);
        }

        // 生产一个元素
        buffer[count++] = rand() % 100;
        printf("[Producer %d] produced item, count=%d\n", id, count);

        // 唤醒消费者
        pthread_cond_signal(&cond_empty);
        pthread_mutex_unlock(&mutex);
        usleep(100000);  // 模拟耗时
    }

    return NULL;
}

void* consumer(void* arg)
{
    int id = (int)(long)arg;

    while (1) {
        pthread_mutex_lock(&mutex);

        // 当缓冲区空且未结束时等待
        while (count == 0 && !done) {
            pthread_cond_wait(&cond_empty, &mutex);
        }

        // 如果结束且无数据，退出
        if (done && count == 0) {
            pthread_mutex_unlock(&mutex);
            break;
        }

        // 消费一个元素
        int item = buffer[--count];
        printf("    [Consumer %d] consumed item %d, count=%d\n", id, item, count);

        // 唤醒生产者
        pthread_cond_signal(&cond_full);
        pthread_mutex_unlock(&mutex);
        usleep(150000);  // 模拟耗时
    }

    printf("    [Consumer %d] exit.\n", id);
    return NULL;
}

int main()
{
    pthread_t p1, p2, c1, c2;

    sem_init(&sem_total, 0, PRODUCE_COUNT);

    pthread_create(&p1, NULL, producer, (void*)1);
    pthread_create(&p2, NULL, producer, (void*)2);
    pthread_create(&c1, NULL, consumer, (void*)1);
    pthread_create(&c2, NULL, consumer, (void*)2);

    // 等待所有任务生产完毕
    while (1) {
        int sval;
        sem_getvalue(&sem_total, &sval);
        if (sval == 0) break;
        usleep(100000);
    }

    sleep(2); // 等待数据全部被消费
    pthread_mutex_lock(&mutex);
    done = 1;
    pthread_cond_broadcast(&cond_empty);  // 唤醒所有等待消费者
    pthread_mutex_unlock(&mutex);

    pthread_cancel(p1);
    pthread_cancel(p2);

    pthread_join(c1, NULL);
    pthread_join(c2, NULL);

    pthread_mutex_destroy(&mutex);
    pthread_cond_destroy(&cond_full);
    pthread_cond_destroy(&cond_empty);
    sem_destroy(&sem_total);

    printf("\nAll work done. ✅\n");
    return 0;
}
