#!/usr/bin/env python3
"""
produce5 的 Python 版本 - 多线程嵌套示例
对应 C 语言的 pthread_create 和 pthread_join 模式
展示复杂的线程创建、嵌套和等待关系
"""

import threading
import time


# ==================== 任务函数 ====================
# 这些函数对应 C 代码中的各个任务函数

def countnegative(n):
    """计数负数任务"""
    print(f"[countnegative] Processing with arg: {n}")
    time.sleep(0.01)
    return None


def rad2deg(n):
    """弧度转角度任务"""
    print(f"[rad2deg] Processing with arg: {n}")
    time.sleep(0.01)
    return None


def deg2rad(n):
    """角度转弧度任务"""
    print(f"[Deg2rad] Processing with arg: {n}")
    time.sleep(0.01)
    return None


def prime(n):
    """素数任务"""
    print(f"[prime] Processing with arg: {n}")
    time.sleep(0.01)
    return None


def ndes(n):
    """NDES 加密任务"""
    print(f"[ndes] Processing with arg: {n}")
    time.sleep(0.01)
    return None


def minver(n):
    """矩阵求逆任务"""
    print(f"[minver] Processing with arg: {n}")
    time.sleep(0.01)
    return None


def insertsort(n):
    """插入排序任务"""
    print(f"[insertsort] Processing with arg: {n}")
    time.sleep(0.01)
    return None


def duff(n):
    """Duff's device 任务"""
    print(f"[duff] Processing with arg: {n}")
    time.sleep(0.01)
    return None


def cover(n):
    """覆盖任务"""
    print(f"[cover] Processing with arg: {n}")
    time.sleep(0.01)
    return None


def ludcmp(n):
    """LU 分解任务"""
    print(f"[ludcmp] Processing with arg: {n}")
    time.sleep(0.01)
    return None


# ==================== 线程任务函数 ====================
# 对应 C 代码中的 threadtask1-5

def task(arg):
    """
    对应 C 代码的 task 函数
    简单的任务处理
    """
    num = arg
    print(f"线程正在处理任务, 参数值为: {num}")
    i = 0
    while i < 100000:
        i += 1
    return None


def threadtask3(arg):
    """
    对应 C 代码的 threadtask3
    线程任务 3: rad2deg
    """
    rad2deg(arg)
    print("task8结束")
    return None


def threadtask4(arg):
    """
    对应 C 代码的 threadtask4
    线程任务 4: prime
    """
    prime(arg)
    print("task9结束")
    return None


def threadtask2(arg):
    """
    对应 C 代码的 threadtask2
    线程任务 2: 创建 thread2 和 thread3，执行多个任务
    
    线程调用关系:
    threadtask2 -> minver (task5)
    threadtask2 --[pthread_create]--> threadtask3 (创建 thread2)
    threadtask2 --[pthread_create]--> threadtask4 (创建 thread3)
    threadtask2 -> ndes (task6)
    threadtask2 --[pthread_join]--> thread2
    threadtask2 --[pthread_join]--> thread3
    threadtask2 -> ludcmp (task7)
    """
    task_arg1 = 43
    task_arg2 = 44
    
    # 执行 minver 任务
    minver(arg)
    print("task5结束")
    
    # 创建线程 thread2 (对应 pthread_create(&thread2, NULL, threadtask3, task_arg1))
    thread2 = threading.Thread(target=threadtask3, args=(task_arg1,), name="thread2")
    thread2.start()
    
    # 创建线程 thread3 (对应 pthread_create(&thread3, NULL, threadtask4, task_arg2))
    thread3 = threading.Thread(target=threadtask4, args=(task_arg2,), name="thread3")
    thread3.start()
    
    # 执行 ndes 任务
    ndes(arg)
    print("task6结束")
    
    # 等待线程 thread2 和 thread3 (对应 pthread_join)
    thread2.join()
    thread3.join()
    
    # 执行 ludcmp 任务
    ludcmp(arg)
    print("task7结束")
    
    return None


def threadtask1(arg):
    """
    对应 C 代码的 threadtask1
    线程任务 1: 创建 thread1，执行多个任务
    
    线程调用关系:
    threadtask1 -> Deg2rad (task1)
    threadtask1 --[pthread_create]--> threadtask2 (创建 thread1)
    threadtask1 -> cover (task2)
    threadtask1 -> duff (task3)
    threadtask1 --[pthread_join]--> thread1
    threadtask1 -> insertsort (task4)
    """
    task_arg1 = 42
    
    # 执行 Deg2rad 任务
    deg2rad(arg)
    print("task1结束")
    
    # 创建线程 thread1 (对应 pthread_create(&thread1, NULL, threadtask2, task_arg1))
    thread1 = threading.Thread(target=threadtask2, args=(task_arg1,), name="thread1")
    thread1.start()
    
    # 执行 cover 任务
    cover(arg)
    print("task2结束")
    
    # 执行 duff 任务
    duff(arg)
    print("task3结束")
    
    # 等待线程 thread1 (对应 pthread_join)
    thread1.join()
    
    # 执行 insertsort 任务
    insertsort(arg)
    print("task4结束")
    
    return None


def threadtask5():
    """
    对应 C 代码的 threadtask5
    测试各种控制流结构：while, do-while, for, switch
    """
    # while 循环
    i = 0
    while i < 3:
        print("while循环测试")
        i += 1
    
    # do-while 循环 (Python 使用 while True + break 模拟)
    while True:
        print("do-while循环测试")
        i -= 1
        if i != 0:
            break
    
    # for 循环
    for i in range(5):
        print("for循环测试")
    
    # switch 语句 (Python 使用 if-elif-else 或 match-case)
    j = 2
    if j == 1:
        print("switch:1测试")
    elif j == 2:
        print("switch:2测试")
    else:
        print("hello")


# ==================== 主函数 ====================

def main():
    """
    主函数 - 对应 C 代码的 main 函数
    
    线程调用关系:
    main -> threadtask5 (直接调用)
    main --[pthread_create]--> threadtask1 (创建 thread)
    main --[pthread_join]--> thread
    
    完整的线程树:
    main
    ├── threadtask5 (直接调用)
    └── [thread] threadtask1
        ├── Deg2rad
        ├── [thread1] threadtask2
        │   ├── minver
        │   ├── [thread2] threadtask3 -> rad2deg
        │   ├── [thread3] threadtask4 -> prime
        │   ├── ndes
        │   └── ludcmp
        ├── cover
        ├── duff
        └── insertsort
    """
    print("=== produce5 Python 版本 - 多线程嵌套示例 ===\n")
    
    # 执行 threadtask5 (直接调用，无线程)
    threadtask5()
    
    # 设置任务参数
    task_arg = 41
    
    # 创建主线程 thread (对应 pthread_create(&thread, NULL, threadtask1, task_arg))
    thread = threading.Thread(target=threadtask1, args=(task_arg,), name="thread_main")
    
    # 启动线程
    thread.start()
    
    # 等待线程完成 (对应 pthread_join(thread, NULL))
    thread.join()
    
    print("\n主线程已完成")
    print("\n=== 程序结束 ===")
    return 0


if __name__ == "__main__":
    import sys
    sys.exit(main())
