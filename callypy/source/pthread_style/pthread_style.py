#!/usr/bin/env python3
"""
Python 线程示例 - 模拟 pthread_create 和 pthread_join
对应 C 语言中的线程创建和等待模式
"""

import threading
import time


# ============= 工作函数（对应 pthread 线程函数）=============

def worker_function_1(thread_id, data):
    """工作函数 1 - 处理数据"""
    print(f"[Thread-{thread_id}] Worker 1 started with data: {data}")
    
    # 执行一些工作
    process_data(data)
    
    # 调用其他辅助函数
    result = calculate_result(data)
    save_to_storage(thread_id, result)
    
    print(f"[Thread-{thread_id}] Worker 1 finished")


def worker_function_2(thread_id, iterations):
    """工作函数 2 - 循环处理"""
    print(f"[Thread-{thread_id}] Worker 2 started with {iterations} iterations")
    
    for i in range(iterations):
        perform_task(thread_id, i)
        check_status(thread_id)
    
    cleanup_thread(thread_id)
    print(f"[Thread-{thread_id}] Worker 2 finished")


def worker_function_3(thread_id, name):
    """工作函数 3 - 带名称的工作线程"""
    print(f"[Thread-{thread_id}] Worker 3 '{name}' started")
    
    initialize_resources(name)
    execute_main_loop(thread_id, name)
    release_resources(name)
    
    print(f"[Thread-{thread_id}] Worker 3 '{name}' finished")


# ============= 辅助函数 =============

def process_data(data):
    """处理数据"""
    time.sleep(0.1)
    print(f"    Processing data: {data}")
    validate_data(data)
    transform_data(data)


def validate_data(data):
    """验证数据"""
    print(f"    Validating: {data}")


def transform_data(data):
    """转换数据"""
    print(f"    Transforming: {data}")


def calculate_result(data):
    """计算结果"""
    result = data * 2
    print(f"    Calculated result: {result}")
    return result


def save_to_storage(thread_id, result):
    """保存到存储"""
    print(f"    [Thread-{thread_id}] Saving result: {result}")


def perform_task(thread_id, task_id):
    """执行任务"""
    print(f"    [Thread-{thread_id}] Performing task {task_id}")
    time.sleep(0.05)


def check_status(thread_id):
    """检查状态"""
    print(f"    [Thread-{thread_id}] Status: OK")


def cleanup_thread(thread_id):
    """清理线程资源"""
    print(f"    [Thread-{thread_id}] Cleaning up resources")


def initialize_resources(name):
    """初始化资源"""
    print(f"    Initializing resources for '{name}'")


def execute_main_loop(thread_id, name):
    """执行主循环"""
    print(f"    [Thread-{thread_id}] Executing main loop for '{name}'")
    time.sleep(0.15)


def release_resources(name):
    """释放资源"""
    print(f"    Releasing resources for '{name}'")


# ============= 线程创建和管理函数（模拟 pthread_create/join）=============

def create_thread(target_func, args):
    """
    模拟 pthread_create
    创建并启动新线程
    
    对应 C 语言：
    pthread_create(&thread, NULL, target_func, args);
    """
    thread = threading.Thread(target=target_func, args=args)
    thread.start()
    return thread


def join_thread(thread):
    """
    模拟 pthread_join
    等待线程结束
    
    对应 C 语言：
    pthread_join(thread, NULL);
    """
    thread.join()


# ============= 线程管理器 =============

def thread_manager_simple():
    """简单的线程管理 - 单个线程"""
    print("\n=== Simple Thread Manager ===")
    
    # 创建线程（模拟 pthread_create）
    thread1 = create_thread(worker_function_1, (1, 100))
    
    # 等待线程结束（模拟 pthread_join）
    join_thread(thread1)
    
    print("Simple thread manager finished\n")


def thread_manager_multiple():
    """多线程管理 - 多个线程"""
    print("\n=== Multiple Threads Manager ===")
    
    threads = []
    
    # 创建多个线程
    thread1 = create_thread(worker_function_1, (101, 200))
    threads.append(thread1)
    
    thread2 = create_thread(worker_function_2, (102, 3))
    threads.append(thread2)
    
    thread3 = create_thread(worker_function_3, (103, "TaskA"))
    threads.append(thread3)
    
    # 等待所有线程结束
    for t in threads:
        join_thread(t)
    
    print("Multiple threads manager finished\n")


def thread_manager_sequential():
    """顺序线程管理 - 一个接一个"""
    print("\n=== Sequential Threads Manager ===")
    
    # 第一个线程
    t1 = create_thread(worker_function_1, (201, 300))
    join_thread(t1)
    
    # 第二个线程（等第一个完成后）
    t2 = create_thread(worker_function_2, (202, 2))
    join_thread(t2)
    
    # 第三个线程
    t3 = create_thread(worker_function_3, (203, "TaskB"))
    join_thread(t3)
    
    print("Sequential threads manager finished\n")


# ============= 嵌套线程示例 =============

def nested_worker(thread_id, level):
    """嵌套工作函数 - 可以创建子线程"""
    print(f"[Thread-{thread_id}] Nested worker at level {level}")
    
    if level > 0:
        # 创建子线程
        child_thread = create_thread(nested_worker, (thread_id * 10, level - 1))
        
        # 执行一些工作
        perform_nested_task(thread_id, level)
        
        # 等待子线程
        join_thread(child_thread)
    else:
        # 叶子节点，直接执行
        perform_leaf_task(thread_id)
    
    print(f"[Thread-{thread_id}] Nested worker level {level} finished")


def perform_nested_task(thread_id, level):
    """执行嵌套任务"""
    print(f"    [Thread-{thread_id}] Nested task at level {level}")
    time.sleep(0.05)


def perform_leaf_task(thread_id):
    """执行叶子任务"""
    print(f"    [Thread-{thread_id}] Leaf task")
    time.sleep(0.05)


def thread_manager_nested():
    """嵌套线程管理 - 线程创建子线程"""
    print("\n=== Nested Threads Manager ===")
    
    # 创建根线程，它会创建子线程
    root_thread = create_thread(nested_worker, (1000, 2))
    
    # 等待根线程（会自动等待所有子线程）
    join_thread(root_thread)
    
    print("Nested threads manager finished\n")


# ============= 主程序 =============

def main():
    """
    主程序 - 展示各种线程使用模式
    
    这个程序演示了类似 C 语言 pthread 的使用模式：
    - pthread_create() -> create_thread()
    - pthread_join() -> join_thread()
    
    通过这些函数调用，可以生成线程调用图：
    main -> thread_manager_xxx -> create_thread -> worker_function_xxx
    main -> thread_manager_xxx -> join_thread
    worker_function_xxx -> process_data/calculate_result/...
    """
    print("="*60)
    print("Python Threading Example (pthread-like pattern)")
    print("="*60)
    
    # 1. 简单单线程
    thread_manager_simple()
    
    # 2. 多个并行线程
    thread_manager_multiple()
    
    # 3. 顺序线程
    thread_manager_sequential()
    
    # 4. 嵌套线程
    thread_manager_nested()
    
    print("="*60)
    print("All thread managers completed successfully!")
    print("="*60)


if __name__ == "__main__":
    main()
