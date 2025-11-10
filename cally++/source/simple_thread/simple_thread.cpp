#include <iostream>
#include <thread>
#include <mutex>
#include <vector>

// 全局互斥锁
std::mutex g_mutex;
int g_counter = 0;

// 简单的任务类
class Task {
public:
    Task(int id) : task_id(id) {}
    
    void execute() {
        std::cout << "Task " << task_id << " executing" << std::endl;
        processData();
        saveResult();
    }
    
private:
    int task_id;
    
    void processData() {
        // 使用互斥锁保护共享资源
        std::lock_guard<std::mutex> lock(g_mutex);
        g_counter++;
        std::cout << "Processing data, counter = " << g_counter << std::endl;
    }
    
    void saveResult() {
        std::cout << "Saving result for task " << task_id << std::endl;
    }
};

// 工作线程函数
void workerThread(int thread_id, int num_tasks) {
    std::cout << "Worker thread " << thread_id << " started" << std::endl;
    
    for (int i = 0; i < num_tasks; i++) {
        Task task(thread_id * 100 + i);
        task.execute();
    }
    
    std::cout << "Worker thread " << thread_id << " finished" << std::endl;
}

// 管理器类
class ThreadManager {
public:
    ThreadManager(int num_threads) : num_threads_(num_threads) {}
    
    void start() {
        std::cout << "Starting thread manager with " << num_threads_ << " threads" << std::endl;
        createThreads();
        waitForCompletion();
        printSummary();
    }
    
private:
    int num_threads_;
    std::vector<std::thread> threads_;
    
    void createThreads() {
        for (int i = 0; i < num_threads_; i++) {
            threads_.push_back(std::thread(workerThread, i, 2));
        }
    }
    
    void waitForCompletion() {
        for (auto& t : threads_) {
            if (t.joinable()) {
                t.join();
            }
        }
    }
    
    void printSummary() {
        std::lock_guard<std::mutex> lock(g_mutex);
        std::cout << "All threads completed. Total operations: " << g_counter << std::endl;
    }
};

// 主函数
int main() {
    std::cout << "=== Simple C++ Thread Example ===" << std::endl;
    
    ThreadManager manager(3);
    manager.start();
    
    std::cout << "Program finished successfully!" << std::endl;
    return 0;
}
