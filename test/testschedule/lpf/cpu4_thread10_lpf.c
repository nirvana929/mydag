#define _GNU_SOURCE
#include <pthread.h>
#include <sched.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <time.h>

/* 最长路径优先版本：结构与 FIFO 保持一致，仅保留线程优先级设置。 */

/* 原始耗时（秒）；实际等待 = 原始耗时 * 0.1 */
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
#define WORK_SCALE 25000
#endif

static double A[MAT_N][MAT_N];
static double B[MAT_N][MAT_N];
static double C[MAT_N][MAT_N];

/* 优先级设置（FIFO） */
#define PRIO_T1 90
#define PRIO_T7 88
#define PRIO_T8 86
#define PRIO_T9 85
#define PRIO_T6 84
#define PRIO_T5 82
#define PRIO_T0 80
#define PRIO_T4 78
#define PRIO_T3 76
#define PRIO_T2 74

static void set_attr_fifo(pthread_attr_t *attr, int prio)
{
    pthread_attr_init(attr);
    pthread_attr_setinheritsched(attr, PTHREAD_EXPLICIT_SCHED);
    pthread_attr_setschedpolicy(attr, SCHED_FIFO);
    struct sched_param sp;
    memset(&sp, 0, sizeof(sp));
    sp.sched_priority = prio;
    pthread_attr_setschedparam(attr, &sp);
}

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
    pthread_t lt2, lt3, lt4;
    pthread_attr_t a2, a3, a4;
    (void)arg;
    printf("thread0 start (CPU %d) at %.3fs\n", sched_getcpu(), since_prog_start());
    clock_gettime(CLOCK_MONOTONIC, &ts_start);
    busy_wait_seconds(T0 * 0.1);
    clock_gettime(CLOCK_MONOTONIC, &ts_end);
    printf("thread0 done (CPU %d, target %.3fs, real %.3fs)\n",
           sched_getcpu(), T0 * 0.1, elapsed_seconds(&ts_start, &ts_end));

    set_attr_fifo(&a2, PRIO_T2);
    set_attr_fifo(&a3, PRIO_T3);
    set_attr_fifo(&a4, PRIO_T4);
    pthread_create(&lt2, &a2, thread2, NULL);
    pthread_create(&lt3, &a3, thread3, NULL);
    pthread_create(&lt4, &a4, thread4, NULL);
    pthread_attr_destroy(&a2);
    pthread_attr_destroy(&a3);
    pthread_attr_destroy(&a4);
    pthread_join(lt2, NULL);
    pthread_join(lt3, NULL);
    pthread_join(lt4, NULL);
    return NULL;
}

static void *thread1(void *arg)
{
    struct timespec ts_start, ts_end;
    pthread_t lt5, lt6, lt7;
    pthread_attr_t a5, a6, a7;
    (void)arg;
    printf("thread1 start (CPU %d) at %.3fs\n", sched_getcpu(), since_prog_start());
    clock_gettime(CLOCK_MONOTONIC, &ts_start);
    busy_wait_seconds(T1 * 0.1);
    clock_gettime(CLOCK_MONOTONIC, &ts_end);
    printf("thread1 done (CPU %d, target %.3fs, real %.3fs)\n",
           sched_getcpu(), T1 * 0.1, elapsed_seconds(&ts_start, &ts_end));

    set_attr_fifo(&a5, PRIO_T5);
    set_attr_fifo(&a6, PRIO_T6);
    set_attr_fifo(&a7, PRIO_T7);
    pthread_create(&lt5, &a5, thread5, NULL);
    pthread_create(&lt6, &a6, thread6, NULL);
    pthread_create(&lt7, &a7, thread7, NULL);
    pthread_attr_destroy(&a5);
    pthread_attr_destroy(&a6);
    pthread_attr_destroy(&a7);
    pthread_join(lt5, NULL);
    pthread_join(lt6, NULL);
    pthread_join(lt7, NULL);
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

    pthread_t t0, t1, t8, t9;

    /* 初始化矩阵数据，确保线程读取时已就绪 */
    init_matrices();

    clock_gettime(CLOCK_MONOTONIC, &g_prog_start);
    clock_gettime(CLOCK_MONOTONIC, &ts_prog_start);

    pthread_attr_t a0, a1, a8, a9;
    set_attr_fifo(&a0, PRIO_T0);
    set_attr_fifo(&a1, PRIO_T1);
    set_attr_fifo(&a8, PRIO_T8);
    set_attr_fifo(&a9, PRIO_T9);

    pthread_create(&t0, &a0, thread0, NULL);
    pthread_create(&t1, &a1, thread1, NULL);
    pthread_create(&t9, &a9, thread9, NULL);

    pthread_join(t0, NULL);
    pthread_join(t1, NULL);
    pthread_create(&t8, &a8, thread8, NULL);
    pthread_join(t9, NULL);
    pthread_join(t8, NULL);

    pthread_attr_destroy(&a0);
    pthread_attr_destroy(&a1);
    pthread_attr_destroy(&a8);
    pthread_attr_destroy(&a9);

    clock_gettime(CLOCK_MONOTONIC, &ts_prog_end);
    printf("Program total time (LPF): %.3fs\n", elapsed_seconds(&ts_prog_start, &ts_prog_end));

    puts("all threads done (LPF)");
    return 0;
}
