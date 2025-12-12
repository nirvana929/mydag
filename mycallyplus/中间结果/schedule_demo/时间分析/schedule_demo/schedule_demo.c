// 多核调度基准示例：调整 core_policy 控制核心分配规则，便于用 mycallyplus 做插桩与时延对比
#include "time_stat.h"  // TA_INCLUDE
#define _GNU_SOURCE
#include <pthread.h>
#include <sched.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <time.h>
#include <unistd.h>

// -------- 配置区 --------
// 0: 全部线程绑定 core0
// 1: 线程均匀分布 core0/1/2/3（按序循环）
// 2: 自定义映射（core_map_custom）
static int core_policy = 1;
static int core_map_custom[] = {0, 2, 3, 1}; // 根据需要调整
// 每个线程的工作量（迭代次数，越大越耗时）
static const int work_iters = 80 * 1000 * 1000;
// ------------------------

#define THREAD_N 4

typedef struct {
    int tid;
    int core;
    uint64_t duration_ns;
} task_arg_t;

static uint64_t now_ns(void) {
    struct timespec ts;
// TA_BEGIN: schedule_demo.c:31 clock_gettime
; /* TA_PAD */
uint64_t __ta_t0_now_ns_clock_gettime1_31_16 = now_ns();
    clock_gettime(CLOCK_MONOTONIC, &ts);
// TA_END: schedule_demo.c:31 clock_gettime
time_account("now_ns/clock_gettime1", now_ns() - __ta_t0_now_ns_clock_gettime1_31_16);
    return (uint64_t)ts.tv_sec * 1000000000ull + (uint64_t)ts.tv_nsec;
// TA_BEGIN: schedule_demo.c:33 __stack_chk_fail
; /* TA_PAD */
uint64_t __ta_t0_now_ns_if___stack_chk_fail2_33_15 = now_ns();
}

static void bind_core(int core) {
    if (core < 0)
        return;
// TA_END: schedule_demo.c:33 __stack_chk_fail
time_account("now_ns/if/__stack_chk_fail2", now_ns() - __ta_t0_now_ns_if___stack_chk_fail2_33_15);
    cpu_set_t cpuset;
    CPU_ZERO(&cpuset);
    CPU_SET(core, &cpuset);
// TA_BEGIN: schedule_demo.c:41 pthread_setaffinity_np
; /* TA_PAD */
uint64_t __ta_t0_bind_core_pthread_setaffinity_np2_41_14 = now_ns();
// TA_BEGIN: schedule_demo.c:41 pthread_self
; /* TA_PAD */
// TA_END: schedule_demo.c:41 pthread_setaffinity_np
time_account("bind_core/pthread_setaffinity_np2", now_ns() - __ta_t0_bind_core_pthread_setaffinity_np2_41_14);
uint64_t __ta_t0_bind_core_pthread_self1_41_13 = now_ns();
    pthread_setaffinity_np(pthread_self(), sizeof(cpu_set_t), &cpuset);
// TA_END: schedule_demo.c:41 pthread_self
time_account("bind_core/pthread_self1", now_ns() - __ta_t0_bind_core_pthread_self1_41_13);
// TA_BEGIN: schedule_demo.c:42 __stack_chk_fail
; /* TA_PAD */
uint64_t __ta_t0_bind_core___stack_chk_fail3_42_12 = now_ns();
}

static void busy_work(int tid, int iters) {
    // 简单算术与访存混合，避免编译器优化掉
    volatile uint64_t acc = (uint64_t)(tid + 1);
// TA_END: schedule_demo.c:42 __stack_chk_fail
time_account("bind_core/__stack_chk_fail3", now_ns() - __ta_t0_bind_core___stack_chk_fail3_42_12);
    for (int i = 0; i < iters; ++i) {
        acc += (i ^ tid) * 1664525u + 1013904223u;
        acc ^= acc >> 13;
    }
    if (acc == 0x1234) {
// TA_BEGIN: schedule_demo.c:52 printf
; /* TA_PAD */
uint64_t __ta_t0_busy_work_printf1_52_11 = now_ns();
        printf("acc guard: %lu\n", acc);
// TA_END: schedule_demo.c:52 printf
time_account("busy_work/printf1", now_ns() - __ta_t0_busy_work_printf1_52_11);
    }
}

static void *worker(void *arg) {
    task_arg_t *ctx = (task_arg_t *)arg;
// TA_BEGIN: schedule_demo.c:58 bind_core
; /* TA_PAD */
uint64_t __ta_t0_bind_core_58_10 = now_ns();
    bind_core(ctx->core);
// TA_END: schedule_demo.c:58 bind_core
time_account("bind_core", now_ns() - __ta_t0_bind_core_58_10);
    uint64_t t0 = now_ns();
    busy_work(ctx->tid, work_iters);
// TA_BEGIN: schedule_demo.c:61 busy_work
; /* TA_PAD */
uint64_t __ta_t0_busy_work_61_9 = now_ns();
    busy_work(ctx->tid, work_iters / 4);
// TA_END: schedule_demo.c:61 busy_work
time_account("busy_work", now_ns() - __ta_t0_busy_work_61_9);
// TA_BEGIN: schedule_demo.c:62 now_ns
; /* TA_PAD */
uint64_t __ta_t0_now_ns_62_8 = now_ns();
    uint64_t t1 = now_ns();
// TA_END: schedule_demo.c:62 now_ns
time_account("now_ns", now_ns() - __ta_t0_now_ns_62_8);
    ctx->duration_ns = t1 - t0;
    return NULL;
}

static int pick_core(int idx) {
    if (core_policy == 0) return 0;
    if (core_policy == 1) return idx % (__extension__({ uint64_t __ta_t0_pick_core_if_sysconf1_69_7 = now_ns(); __auto_type __ta_ret = sysconf(_SC_NPROCESSORS_ONLN); time_account("pick_core/if/sysconf1", now_ns() - __ta_t0_pick_core_if_sysconf1_69_7); __ta_ret; }));
    int sz = (int)(sizeof(core_map_custom) / sizeof(core_map_custom[0]));
    return core_map_custom[idx % sz];
}

int main(void) {
    pthread_t th[THREAD_N];
    task_arg_t args[THREAD_N];

    for (int i = 0; i < THREAD_N; ++i) {
        args[i].tid = i;
// TA_BEGIN: schedule_demo.c:80 pick_core
; /* TA_PAD */
uint64_t __ta_t0_while_pick_core_80_6 = now_ns();
        args[i].core = pick_core(i);
// TA_END: schedule_demo.c:80 pick_core
time_account("while/pick_core", now_ns() - __ta_t0_while_pick_core_80_6);
        args[i].duration_ns = 0;
        if ((__extension__({ uint64_t __ta_t0_main_while_pthread_create2_82_5 = now_ns(); __auto_type __ta_ret = pthread_create(&th[i], NULL, worker, &args[i]); time_account("main/while/pthread_create2", now_ns() - __ta_t0_main_while_pthread_create2_82_5); __ta_ret; })) != 0) {
// TA_BEGIN: schedule_demo.c:83 perror
; /* TA_PAD */
uint64_t __ta_t0_main_perror3_83_4 = now_ns();
            perror("pthread_create");
// TA_END: schedule_demo.c:83 perror
time_account("main/perror3", now_ns() - __ta_t0_main_perror3_83_4);
            return 1;
        }
    }

    for (int i = 0; i < THREAD_N; ++i) {
// TA_BEGIN: schedule_demo.c:89 pthread_join
; /* TA_PAD */
uint64_t __ta_t0_main_pthread_join4_89_3 = now_ns();
        pthread_join(th[i], NULL);
// TA_END: schedule_demo.c:89 pthread_join
time_account("main/pthread_join4", now_ns() - __ta_t0_main_pthread_join4_89_3);
    }

// TA_BEGIN: schedule_demo.c:92 printf
; /* TA_PAD */
uint64_t __ta_t0_main_printf5_92_2 = now_ns();
    printf("core_policy=%d\n", core_policy);
// TA_END: schedule_demo.c:92 printf
time_account("main/printf5", now_ns() - __ta_t0_main_printf5_92_2);
    for (int i = 0; i < THREAD_N; ++i) {
// TA_BEGIN: schedule_demo.c:94 printf
; /* TA_PAD */
uint64_t __ta_t0_main_printf6_94_1 = now_ns();
        printf("thread%02d core=%d\n", args[i].tid, args[i].core);
// TA_END: schedule_demo.c:94 printf
time_account("main/printf6", now_ns() - __ta_t0_main_printf6_94_1);
    }

    return 0;
}
