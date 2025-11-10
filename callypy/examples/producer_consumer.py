#!/usr/bin/env python3
"""
生产者-消费者模式 - 使用 pthread 风格的线程管理
包含互斥锁和条件变量，对应 C 语言的 pthread_mutex 和 pthread_cond
"""

import threading
import time
import queue


# ============= 全局共享资源 =============

# 共享队列（缓冲区）
shared_queue = queue.Queue(maxsize=5)

# 互斥锁（模拟 pthread_mutex_t）
queue_mutex = threading.Lock()

# 条件变量（模拟 pthread_cond_t）
queue_not_empty = threading.Condition(queue_mutex)
queue_not_full = threading.Condition(queue_mutex)

# 统计信息
stats = {
    'produced': 0,
    'consumed': 0,
}
stats_mutex = threading.Lock()


# ============= 辅助函数 =============

def acquire_lock(lock):
    """
    获取锁（模拟 pthread_mutex_lock）
    对应 C: pthread_mutex_lock(&mutex);
    """
    lock.acquire()


def release_lock(lock):
    """
    释放锁（模拟 pthread_mutex_unlock）
    对应 C: pthread_mutex_unlock(&mutex);
    """
    lock.release()


def wait_condition(condition):
    """
    等待条件变量（模拟 pthread_cond_wait）
    对应 C: pthread_cond_wait(&cond, &mutex);
    """
    condition.wait()


def signal_condition(condition):
    """
    唤醒条件变量（模拟 pthread_cond_signal）
    对应 C: pthread_cond_signal(&cond);
    """
    condition.notify()


def update_stats(key, value):
    """更新统计信息（带锁保护）"""
    acquire_lock(stats_mutex)
    stats[key] += value
    release_lock(stats_mutex)


def log_message(thread_type, thread_id, message):
    """打印日志消息"""
    print(f"[{thread_type}-{thread_id}] {message}")


# ============= 数据处理函数 =============

def create_item(producer_id, item_id):
    """创建数据项"""
    item = {
        'producer_id': producer_id,
        'item_id': item_id,
        'timestamp': time.time(),
        'data': f"Data from Producer-{producer_id}, Item-{item_id}"
    }
    log_message("Producer", producer_id, f"Created item {item_id}")
    return item


def validate_item(item):
    """验证数据项"""
    return 'data' in item and 'producer_id' in item


def process_item(consumer_id, item):
    """处理数据项"""
    log_message("Consumer", consumer_id, 
                f"Processing item from Producer-{item['producer_id']}")
    
    # 模拟处理时间
    time.sleep(0.1)
    
    # 执行处理
    transform_item(item)
    save_item(consumer_id, item)


def transform_item(item):
    """转换数据项"""
    item['processed'] = True
    item['process_time'] = time.time()


def save_item(consumer_id, item):
    """保存处理结果"""
    log_message("Consumer", consumer_id, 
                f"Saved item {item['item_id']}")


# ============= 生产者函数（线程函数）=============

def producer_thread(producer_id, num_items):
    """
    生产者线程函数
    
    对应 C 语言：
    void* producer_thread(void* arg) {
        // 生产数据并放入队列
    }
    """
    log_message("Producer", producer_id, f"Started, will produce {num_items} items")
    
    for i in range(num_items):
        # 创建数据
        item = create_item(producer_id, i)
        
        # 获取锁并放入队列
        acquire_lock(queue_mutex)
        
        # 如果队列满，等待
        while shared_queue.full():
            log_message("Producer", producer_id, "Queue full, waiting...")
            wait_condition(queue_not_full)
        
        # 放入队列
        shared_queue.put(item)
        log_message("Producer", producer_id, 
                   f"Produced item {i}, queue size: {shared_queue.qsize()}")
        
        # 更新统计
        update_stats('produced', 1)
        
        # 通知消费者
        signal_condition(queue_not_empty)
        
        # 释放锁
        release_lock(queue_mutex)
        
        # 模拟生产间隔
        time.sleep(0.05)
    
    log_message("Producer", producer_id, "Finished")


# ============= 消费者函数（线程函数）=============

def consumer_thread(consumer_id, num_items):
    """
    消费者线程函数
    
    对应 C 语言：
    void* consumer_thread(void* arg) {
        // 从队列取数据并处理
    }
    """
    log_message("Consumer", consumer_id, f"Started, will consume {num_items} items")
    
    for i in range(num_items):
        # 获取锁并从队列取数据
        acquire_lock(queue_mutex)
        
        # 如果队列空，等待
        while shared_queue.empty():
            log_message("Consumer", consumer_id, "Queue empty, waiting...")
            wait_condition(queue_not_empty)
        
        # 从队列取数据
        item = shared_queue.get()
        log_message("Consumer", consumer_id, 
                   f"Consumed item {item['item_id']}, queue size: {shared_queue.qsize()}")
        
        # 通知生产者
        signal_condition(queue_not_full)
        
        # 释放锁
        release_lock(queue_mutex)
        
        # 处理数据（不需要持有锁）
        if validate_item(item):
            process_item(consumer_id, item)
        
        # 更新统计
        update_stats('consumed', 1)
    
    log_message("Consumer", consumer_id, "Finished")


# ============= 线程管理函数（模拟 pthread_create/join）=============

def create_producer_thread(producer_id, num_items):
    """创建生产者线程（模拟 pthread_create）"""
    thread = threading.Thread(
        target=producer_thread,
        args=(producer_id, num_items),
        name=f"Producer-{producer_id}"
    )
    thread.start()
    return thread


def create_consumer_thread(consumer_id, num_items):
    """创建消费者线程（模拟 pthread_create）"""
    thread = threading.Thread(
        target=consumer_thread,
        args=(consumer_id, num_items),
        name=f"Consumer-{consumer_id}"
    )
    thread.start()
    return thread


def join_all_threads(threads):
    """等待所有线程结束（模拟 pthread_join）"""
    for thread in threads:
        thread.join()
        print(f"Thread {thread.name} joined")


# ============= 主程序 =============

def run_producer_consumer(num_producers, num_consumers, items_per_producer):
    """
    运行生产者-消费者程序
    
    线程调用图：
    main -> run_producer_consumer
         -> create_producer_thread -> producer_thread
                                    -> create_item
                                    -> acquire_lock
                                    -> wait_condition
                                    -> signal_condition
                                    -> release_lock
                                    -> update_stats
         -> create_consumer_thread -> consumer_thread
                                    -> acquire_lock
                                    -> wait_condition
                                    -> signal_condition
                                    -> release_lock
                                    -> validate_item
                                    -> process_item
                                        -> transform_item
                                        -> save_item
                                    -> update_stats
         -> join_all_threads
    """
    print("="*70)
    print(f"Producer-Consumer Pattern (pthread-style)")
    print(f"Producers: {num_producers}, Consumers: {num_consumers}")
    print(f"Items per producer: {items_per_producer}")
    print("="*70)
    
    threads = []
    
    # 创建生产者线程
    for i in range(num_producers):
        thread = create_producer_thread(i, items_per_producer)
        threads.append(thread)
    
    # 创建消费者线程
    items_per_consumer = (num_producers * items_per_producer) // num_consumers
    for i in range(num_consumers):
        thread = create_consumer_thread(i, items_per_consumer)
        threads.append(thread)
    
    # 等待所有线程完成
    join_all_threads(threads)
    
    # 打印统计信息
    print("="*70)
    print(f"Statistics:")
    print(f"  Total produced: {stats['produced']}")
    print(f"  Total consumed: {stats['consumed']}")
    print(f"  Queue size: {shared_queue.qsize()}")
    print("="*70)


def main():
    """主函数"""
    # 场景 1: 2个生产者，2个消费者
    run_producer_consumer(
        num_producers=2,
        num_consumers=2,
        items_per_producer=5
    )
    
    print("\n" + "="*70)
    print("All scenarios completed successfully!")
    print("="*70)


if __name__ == "__main__":
    main()
