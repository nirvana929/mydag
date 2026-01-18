#define _GNU_SOURCE
#include <pthread.h>
#include <sched.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <time.h>

/* 同 FIFO 版：关键链 + 填充，总线程 16。LPF 仅增加 FIFO 优先级。 */

#define C0 25.0
#define C1 22.0
#define C2 20.0
#define C3 18.0
#define C4 16.0
#define F_LONG 5.0
#define F_SHORT 3.0

static void *c0_fn(void *arg);
static void *c1_fn(void *arg);
static void *c2_fn(void *arg);
static void *c3_fn(void *arg);
static void *c4_fn(void *arg);
static void *f0_fn(void *arg);
static void *f1_fn(void *arg);
static void *f2_fn(void *arg);
static void *f3_fn(void *arg);
static void *f4_fn(void *arg);
static void *f5_fn(void *arg);
static void *f6_fn(void *arg);
static void *f7_fn(void *arg);
static void *f8_fn(void *arg);
static void *f9_fn(void *arg);
static void *f10_fn(void *arg);
static void *f11_fn(void *arg);

#define MAT_N 64
#ifndef WORK_SCALE
#define WORK_SCALE 25000
#endif

static double A[MAT_N][MAT_N];
static double B[MAT_N][MAT_N];
static double C[MAT_N][MAT_N];

#define PRIO_C0 90
#define PRIO_C1 88
#define PRIO_C2 86
#define PRIO_C3 84
#define PRIO_C4 82
#define PRIO_FILL 50

static pthread_t tc0, tc1, tc2, tc3, tc4;
static pthread_t tf0, tf1, tf2, tf3, tf4, tf5, tf6, tf7, tf8, tf9, tf10, tf11;

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
    int repeat = (int)(seconds * WORK_SCALE * 0.1);
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

#define START_PRINT(name) printf("%s start (CPU %d) at %.3fs\n", name, sched_getcpu(), since_prog_start())
#define DONE_PRINT(name, target, ts_start, ts_end) \
    printf("%s done (CPU %d, target %.3fs, real %.3fs)\n", \
           name, sched_getcpu(), (target) * 0.1, elapsed_seconds(&(ts_start), &(ts_end)))

static void *c4_fn(void *arg)
{
    struct timespec ts_start, ts_end;
    (void)arg;
    START_PRINT("c4");
    clock_gettime(CLOCK_MONOTONIC, &ts_start);
    busy_wait_seconds(C4);
    clock_gettime(CLOCK_MONOTONIC, &ts_end);
    DONE_PRINT("c4", C4, ts_start, ts_end);
    return NULL;
}

static void *c3_fn(void *arg)
{
    struct timespec ts_start, ts_end;
    pthread_attr_t a4;
    (void)arg;
    START_PRINT("c3");
    clock_gettime(CLOCK_MONOTONIC, &ts_start);
    busy_wait_seconds(C3);
    clock_gettime(CLOCK_MONOTONIC, &ts_end);
    DONE_PRINT("c3", C3, ts_start, ts_end);

    set_attr_fifo(&a4, PRIO_C4);
    pthread_create(&tc4, &a4, c4_fn, NULL);
    pthread_attr_destroy(&a4);
    return NULL;
}

static void *c2_fn(void *arg)
{
    struct timespec ts_start, ts_end;
    pthread_attr_t a3;
    (void)arg;
    START_PRINT("c2");
    clock_gettime(CLOCK_MONOTONIC, &ts_start);
    busy_wait_seconds(C2);
    clock_gettime(CLOCK_MONOTONIC, &ts_end);
    DONE_PRINT("c2", C2, ts_start, ts_end);

    set_attr_fifo(&a3, PRIO_C3);
    pthread_create(&tc3, &a3, c3_fn, NULL);
    pthread_attr_destroy(&a3);
    return NULL;
}

static void *c1_fn(void *arg)
{
    struct timespec ts_start, ts_end;
    pthread_attr_t a2;
    (void)arg;
    START_PRINT("c1");
    clock_gettime(CLOCK_MONOTONIC, &ts_start);
    busy_wait_seconds(C1);
    clock_gettime(CLOCK_MONOTONIC, &ts_end);
    DONE_PRINT("c1", C1, ts_start, ts_end);

    set_attr_fifo(&a2, PRIO_C2);
    pthread_create(&tc2, &a2, c2_fn, NULL);
    pthread_attr_destroy(&a2);
    return NULL;
}

static void *c0_fn(void *arg)
{
    struct timespec ts_start, ts_end;
    pthread_attr_t a1;
    (void)arg;
    START_PRINT("c0");
    clock_gettime(CLOCK_MONOTONIC, &ts_start);
    busy_wait_seconds(C0);
    clock_gettime(CLOCK_MONOTONIC, &ts_end);
    DONE_PRINT("c0", C0, ts_start, ts_end);

    set_attr_fifo(&a1, PRIO_C1);
    pthread_create(&tc1, &a1, c1_fn, NULL);
    pthread_attr_destroy(&a1);
    return NULL;
}

static void run_fill_task(const char *name, double dur, int prio, pthread_t *th)
{
    pthread_attr_t attr;
    set_attr_fifo(&attr, prio);
    pthread_create(th, &attr, dur == F_SHORT ? f11_fn : f0_fn, NULL); // placeholder, will not be used
    pthread_attr_destroy(&attr);
}

#define DEFINE_FILL_LPF(fn_name, dur, label, prio_macro)            \
    static void *fn_name(void *arg) {                               \
        struct timespec ts_start, ts_end;                           \
        (void)arg;                                                 \
        START_PRINT(label);                                         \
        clock_gettime(CLOCK_MONOTONIC, &ts_start);                  \
        busy_wait_seconds(dur);                                     \
        clock_gettime(CLOCK_MONOTONIC, &ts_end);                    \
        DONE_PRINT(label, dur, ts_start, ts_end);                   \
        return NULL;                                               \
    }

DEFINE_FILL_LPF(f0_fn,  F_LONG, "f0",  PRIO_FILL)
DEFINE_FILL_LPF(f1_fn,  F_LONG, "f1",  PRIO_FILL)
DEFINE_FILL_LPF(f2_fn,  F_LONG, "f2",  PRIO_FILL)
DEFINE_FILL_LPF(f3_fn,  F_LONG, "f3",  PRIO_FILL)
DEFINE_FILL_LPF(f4_fn,  F_LONG, "f4",  PRIO_FILL)
DEFINE_FILL_LPF(f5_fn,  F_LONG, "f5",  PRIO_FILL)
DEFINE_FILL_LPF(f6_fn,  F_LONG, "f6",  PRIO_FILL)
DEFINE_FILL_LPF(f7_fn,  F_LONG, "f7",  PRIO_FILL)
DEFINE_FILL_LPF(f8_fn,  F_LONG, "f8",  PRIO_FILL)
DEFINE_FILL_LPF(f9_fn,  F_LONG, "f9",  PRIO_FILL)
DEFINE_FILL_LPF(f10_fn, F_LONG, "f10", PRIO_FILL)
DEFINE_FILL_LPF(f11_fn, F_SHORT, "f11", PRIO_FILL)

int main(void)
{
    struct timespec ts_prog_start, ts_prog_end;
    cpu_set_t set;
    CPU_ZERO(&set);
    CPU_SET(0, &set);
    CPU_SET(1, &set);
    CPU_SET(2, &set);
    CPU_SET(3, &set);
    if (sched_setaffinity(0, sizeof(set), &set) != 0) {
        fprintf(stderr, "sched_setaffinity failed: %s\n", strerror(errno));
    }

    init_matrices();
    clock_gettime(CLOCK_MONOTONIC, &g_prog_start);
    clock_gettime(CLOCK_MONOTONIC, &ts_prog_start);

    pthread_attr_t ac0, afill;
    set_attr_fifo(&ac0, PRIO_C0);
    set_attr_fifo(&afill, PRIO_FILL);

    /* 先创建填充任务，再创建关键链入口，但关键链有高优先级 */
    pthread_create(&tf0, &afill, f0_fn, NULL);
    pthread_create(&tf1, &afill, f1_fn, NULL);
    pthread_create(&tf2, &afill, f2_fn, NULL);
    pthread_create(&tf3, &afill, f3_fn, NULL);
    pthread_create(&tf4, &afill, f4_fn, NULL);
    pthread_create(&tf5, &afill, f5_fn, NULL);
    pthread_create(&tf6, &afill, f6_fn, NULL);
    pthread_create(&tf7, &afill, f7_fn, NULL);
    pthread_create(&tf8, &afill, f8_fn, NULL);
    pthread_create(&tf9, &afill, f9_fn, NULL);
    pthread_create(&tf10, &afill, f10_fn, NULL);
    pthread_create(&tf11, &afill, f11_fn, NULL);

    pthread_create(&tc0, &ac0, c0_fn, NULL);

    pthread_attr_destroy(&ac0);
    pthread_attr_destroy(&afill);

    pthread_join(tc0, NULL);
    pthread_join(tc1, NULL);
    pthread_join(tc2, NULL);
    pthread_join(tc3, NULL);
    pthread_join(tc4, NULL);
    pthread_join(tf0, NULL);
    pthread_join(tf1, NULL);
    pthread_join(tf2, NULL);
    pthread_join(tf3, NULL);
    pthread_join(tf4, NULL);
    pthread_join(tf5, NULL);
    pthread_join(tf6, NULL);
    pthread_join(tf7, NULL);
    pthread_join(tf8, NULL);
    pthread_join(tf9, NULL);
    pthread_join(tf10, NULL);
    pthread_join(tf11, NULL);

    clock_gettime(CLOCK_MONOTONIC, &ts_prog_end);
    printf("Program total time (LPF): %.3fs\n", elapsed_seconds(&ts_prog_start, &ts_prog_end));
    puts("all threads done (LPF)");
    return 0;
}
