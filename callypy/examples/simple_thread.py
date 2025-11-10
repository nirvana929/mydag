#!/usr/bin/env python3
"""简单的 Python 线程示例 - 用于测试 callypy"""

import threading
import time

# 全局锁和计数器
lock = threading.Lock()
counter = 0


def process_data(x):
    """处理数据"""
    time.sleep(0.01)
    print(f"Processing {x}")
    return x * 2


def worker(thread_id, num_tasks):
    """工作线程函数"""
    global counter
    
    print(f"Worker {thread_id} started")
    
    for i in range(num_tasks):
        # 使用锁保护共享资源
        lock.acquire()
        try:
            counter += 1
            task_id = counter
        finally:
            lock.release()
        
        # 处理任务
        result = process_data(task_id)
        save_result(thread_id, result)
    
    print(f"Worker {thread_id} finished")


def save_result(thread_id, result):
    """保存结果"""
    print(f"Thread {thread_id}: saved result {result}")


def main():
    """主函数"""
    print("=== Simple Python Thread Example ===")
    
    num_threads = 3
    num_tasks = 5
    
    threads = []
    
    # 创建并启动线程
    for i in range(num_threads):
        t = threading.Thread(target=worker, args=(i, num_tasks))
        threads.append(t)
        t.start()
    
    # 等待所有线程完成
    for t in threads:
        t.join()
    
    print(f"\nAll threads completed. Total tasks: {counter}")
    print("Program finished successfully!")


if __name__ == "__main__":
    main()
