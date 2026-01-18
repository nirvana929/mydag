#define _GNU_SOURCE
#include <pthread.h>
#include <sched.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <time.h>

/* 把“描述中的耗时”直接换成等价的忙等待，缩小 10 倍。
 * 例如描述写“数据计算();执行0.5s”，这里用 0.05s 的忙等待模拟。
 * 每个线程单独一个函数，不用数组生成，保持 10 个线程函数 + 1 个 main。
 */

/* 原始耗时（秒）占位，可按需要修改；实际等待 = 原始耗时 * 0.1 */
#define T0 0.50
#define T1 0.80
#define T2 1.00
#define T3 1.20
#define T4 1.50
#define T5 1.80
#define T6 2.00
#define T7 2.50
#define T8 3.00
#define T9 3.50

/* 前置声明，便于在线程内部调用其他线程函数 */
static void *thread0(void *arg);
static void *thread1(void *arg);
static void *thread2(void *arg);
static void *thread3(void *arg);
static void *thread4(void *arg);
static void *thread5(void *arg);
static void *thread6(void *arg);
static void *thread7(void *arg);
static void *thread8(void *arg);
static void *thread9(void *arg);

/* 矩阵计算模拟耗时，缩放系数可按需要调整 */
#define MAT_N 64
#ifndef WORK_SCALE
#define WORK_SCALE 25000 /* 同步放大所有线程的工作量：原始秒数 * 0.1 * WORK_SCALE 作为重复次数 */
#endif

static double A[MAT_N][MAT_N];
static double B[MAT_N][MAT_N];
static double C[MAT_N][MAT_N];

static void init_matrices(void)
{
    for (int i = 0; i < MAT_N; ++i) {
        for (int j = 0; j < MAT_N; ++j) {
            A[i][j] = (double)(i + j + 1);
            B[i][j] = (double)(i * 2 + j + 3);
            C[i][j] = 0.0;
        }
    }
}

static void busy_wait_seconds(double seconds)
{
    int repeat = (int)(seconds * WORK_SCALE);
    if (repeat < 1) repeat = 1;
    for (int r = 0; r < repeat; ++r) {
        for (int i = 0; i < MAT_N; ++i) {
            for (int j = 0; j < MAT_N; ++j) {
                double acc = 0.0;
                for (int k = 0; k < MAT_N; ++k) {
                    acc += A[i][k] * B[k][j];
                }
                C[i][j] = acc;
            }
        }
    }
}

static double elapsed_seconds(const struct timespec *start, const struct timespec *end)
{
    long long ns = (end->tv_sec - start->tv_sec) * 1000000000LL +
                   (end->tv_nsec - start->tv_nsec);
    return (double)ns / 1e9;
}

static struct timespec g_prog_start;

static double since_prog_start(void)
{
    struct timespec now;
    clock_gettime(CLOCK_MONOTONIC, &now);
    return elapsed_seconds(&g_prog_start, &now);
}

static void *thread0(void *arg)
{
    struct timespec ts_start, ts_end;
    pthread_t t2, t3, t4;
    (void)arg;
    printf("thread0 start (CPU %d) at %.3fs\n", sched_getcpu(), since_prog_start());
    clock_gettime(CLOCK_MONOTONIC, &ts_start);
    busy_wait_seconds(T0 * 0.1);
    clock_gettime(CLOCK_MONOTONIC, &ts_end);
    printf("thread0 done (CPU %d, target %.3fs, real %.3fs)\n",
           sched_getcpu(), T0 * 0.1, elapsed_seconds(&ts_start, &ts_end));
    pthread_create(&t2, NULL, thread2, NULL);
    pthread_create(&t3, NULL, thread3, NULL);
    pthread_create(&t4, NULL, thread4, NULL);
    pthread_join(t2, NULL);
    pthread_join(t3, NULL);
    pthread_join(t4, NULL);
    return NULL;
}

static void *thread1(void *arg)
{
    struct timespec ts_start, ts_end;
    pthread_t t5, t6, t7;
    (void)arg;
    printf("thread1 start (CPU %d) at %.3fs\n", sched_getcpu(), since_prog_start());
    clock_gettime(CLOCK_MONOTONIC, &ts_start);
    busy_wait_seconds(T1 * 0.1);
    clock_gettime(CLOCK_MONOTONIC, &ts_end);
    printf("thread1 done (CPU %d, target %.3fs, real %.3fs)\n",
           sched_getcpu(), T1 * 0.1, elapsed_seconds(&ts_start, &ts_end));
    pthread_create(&t5, NULL, thread5, NULL);
    pthread_create(&t6, NULL, thread6, NULL);
    pthread_create(&t7, NULL, thread7, NULL);
    pthread_join(t5, NULL);
    pthread_join(t6, NULL);
    pthread_join(t7, NULL);
    return NULL;
}

static void *thread2(void *arg)
{
    struct timespec ts_start, ts_end;
    (void)arg;
    printf("thread2 start (CPU %d) at %.3fs\n", sched_getcpu(), since_prog_start());
    clock_gettime(CLOCK_MONOTONIC, &ts_start);
    busy_wait_seconds(T2 * 0.1);
    clock_gettime(CLOCK_MONOTONIC, &ts_end);
    printf("thread2 done (CPU %d, target %.3fs, real %.3fs)\n",
           sched_getcpu(), T2 * 0.1, elapsed_seconds(&ts_start, &ts_end));
    return NULL;
}

static void *thread3(void *arg)
{
    struct timespec ts_start, ts_end;
    (void)arg;
    printf("thread3 start (CPU %d) at %.3fs\n", sched_getcpu(), since_prog_start());
    clock_gettime(CLOCK_MONOTONIC, &ts_start);
    busy_wait_seconds(T3 * 0.1);
    clock_gettime(CLOCK_MONOTONIC, &ts_end);
    printf("thread3 done (CPU %d, target %.3fs, real %.3fs)\n",
           sched_getcpu(), T3 * 0.1, elapsed_seconds(&ts_start, &ts_end));
    return NULL;
}

static void *thread4(void *arg)
{
    struct timespec ts_start, ts_end;
    (void)arg;
    printf("thread4 start (CPU %d) at %.3fs\n", sched_getcpu(), since_prog_start());
    clock_gettime(CLOCK_MONOTONIC, &ts_start);
    busy_wait_seconds(T4 * 0.1);
    clock_gettime(CLOCK_MONOTONIC, &ts_end);
    printf("thread4 done (CPU %d, target %.3fs, real %.3fs)\n",
           sched_getcpu(), T4 * 0.1, elapsed_seconds(&ts_start, &ts_end));
    return NULL;
}

static void *thread5(void *arg)
{
    struct timespec ts_start, ts_end;
    (void)arg;
    printf("thread5 start (CPU %d) at %.3fs\n", sched_getcpu(), since_prog_start());
    clock_gettime(CLOCK_MONOTONIC, &ts_start);
    busy_wait_seconds(T5 * 0.1);
    clock_gettime(CLOCK_MONOTONIC, &ts_end);
    printf("thread5 done (CPU %d, target %.3fs, real %.3fs)\n",
           sched_getcpu(), T5 * 0.1, elapsed_seconds(&ts_start, &ts_end));
    return NULL;
}

static void *thread6(void *arg)
{
    struct timespec ts_start, ts_end;
    (void)arg;
    printf("thread6 start (CPU %d) at %.3fs\n", sched_getcpu(), since_prog_start());
    clock_gettime(CLOCK_MONOTONIC, &ts_start);
    busy_wait_seconds(T6 * 0.1);
    clock_gettime(CLOCK_MONOTONIC, &ts_end);
    printf("thread6 done (CPU %d, target %.3fs, real %.3fs)\n",
           sched_getcpu(), T6 * 0.1, elapsed_seconds(&ts_start, &ts_end));
    return NULL;
}

static void *thread7(void *arg)
{
    struct timespec ts_start, ts_end;
    (void)arg;
    printf("thread7 start (CPU %d) at %.3fs\n", sched_getcpu(), since_prog_start());
    clock_gettime(CLOCK_MONOTONIC, &ts_start);
    busy_wait_seconds(T7 * 0.1);
    clock_gettime(CLOCK_MONOTONIC, &ts_end);
    printf("thread7 done (CPU %d, target %.3fs, real %.3fs)\n",
           sched_getcpu(), T7 * 0.1, elapsed_seconds(&ts_start, &ts_end));
    return NULL;
}

static void *thread8(void *arg)
{
    struct timespec ts_start, ts_end;
    (void)arg;
    printf("thread8 start (CPU %d) at %.3fs\n", sched_getcpu(), since_prog_start());
    clock_gettime(CLOCK_MONOTONIC, &ts_start);
    busy_wait_seconds(T8 * 0.1);
    clock_gettime(CLOCK_MONOTONIC, &ts_end);
    printf("thread8 done (CPU %d, target %.3fs, real %.3fs)\n",
           sched_getcpu(), T8 * 0.1, elapsed_seconds(&ts_start, &ts_end));
    return NULL;
}

static void *thread9(void *arg)
{
    struct timespec ts_start, ts_end;
    (void)arg;
    printf("thread9 start (CPU %d) at %.3fs\n", sched_getcpu(), since_prog_start());
    clock_gettime(CLOCK_MONOTONIC, &ts_start);
    busy_wait_seconds(T9 * 0.1);
    clock_gettime(CLOCK_MONOTONIC, &ts_end);
    printf("thread9 done (CPU %d, target %.3fs, real %.3fs)\n",
           sched_getcpu(), T9 * 0.1, elapsed_seconds(&ts_start, &ts_end));
    return NULL;
}

int main(void)
{
    struct timespec ts_prog_start, ts_prog_end;
    /* 可选：绑定前 4 个核心，方便复现实验 */
    cpu_set_t set;
    CPU_ZERO(&set);
    CPU_SET(0, &set);
    CPU_SET(1, &set);
    CPU_SET(2, &set);
    CPU_SET(3, &set);
    if (sched_setaffinity(0, sizeof(set), &set) != 0) {
        fprintf(stderr, "sched_setaffinity failed: %s\n", strerror(errno));
    }

    pthread_t t0, t1,  t8, t9;

    /* 初始化矩阵数据，确保线程读取时已就绪 */
    init_matrices();

    clock_gettime(CLOCK_MONOTONIC, &g_prog_start);
    clock_gettime(CLOCK_MONOTONIC, &ts_prog_start);

    pthread_create(&t0, NULL, thread0, NULL);
    pthread_create(&t1, NULL, thread1, NULL);
    pthread_create(&t9, NULL, thread9, NULL);

    pthread_join(t0, NULL);
    pthread_join(t1, NULL);
    pthread_create(&t8, NULL, thread8, NULL);
    pthread_join(t9, NULL);
    pthread_join(t8, NULL);

    clock_gettime(CLOCK_MONOTONIC, &ts_prog_end);
    printf("Program total time: %.3fs\n", elapsed_seconds(&ts_prog_start, &ts_prog_end));

    puts("all threads done");
    return 0;
}
