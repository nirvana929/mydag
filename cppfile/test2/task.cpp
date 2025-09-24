#include <iostream>
#include <thread>
#include <vector>
#include <chrono>
using namespace std;
// 模拟工作函数
void workFunction(int id) {
    std::cout << "Thread " << id << " is working.\n";
    std::this_thread::sleep_for(std::chrono::milliseconds(100));  // 模拟工作延迟
    std::cout << "Thread " << id << " has finished work.\n";
}

void taskA() {
    std::cout << "Task A started.\n";
    std::this_thread::sleep_for(std::chrono::milliseconds(200));
    std::cout << "Task A completed.\n";
}

void taskB() {
    std::cout << "Task B started.\n";
    std::this_thread::sleep_for(std::chrono::milliseconds(150));
    std::cout << "Task B completed.\n";
}

void taskC() {
    std::cout << "Task C started.\n";
    std::this_thread::sleep_for(std::chrono::milliseconds(250));
    std::cout << "Task C completed.\n";
}

void taskD() {
    std::cout << "Task D started.\n";
    std::this_thread::sleep_for(std::chrono::milliseconds(300));
    std::cout << "Task D completed.\n";
}

void taskE() {
    std::cout << "Task E started.\n";
    std::this_thread::sleep_for(std::chrono::milliseconds(150));
    std::cout << "Task E completed.\n";
}

void taskF() {
    std::cout << "Task F started.\n";
    std::this_thread::sleep_for(std::chrono::milliseconds(100));
    std::cout << "Task F completed.\n";
}

void taskG() {
    std::cout << "Task G started.\n";
    std::this_thread::sleep_for(std::chrono::milliseconds(250));
    std::cout << "Task G completed.\n";
}

int main() {
    std::cout << "Main thread starting work...\n";

    // 线程 A 启动并调用线程 B
    std::thread t1([](){
        std::cout << "Thread A started.\n";
        std::this_thread::sleep_for(std::chrono::milliseconds(200)); // 模拟任务执行
        std::thread t2(workFunction, 1); // 线程 A 调用线程 B
        t2.join();  // 等待线程 B 完成
        std::cout << "Thread A completed.\n";
    });

    // 线程 B 启动并调用线程 C
    std::thread t3([](){
        std::cout << "Thread B started.\n";
        std::this_thread::sleep_for(std::chrono::milliseconds(150)); // 模拟任务执行
        std::thread t4(workFunction, 2); // 线程 B 调用线程 C
        t4.join();  // 等待线程 C 完成
        std::cout << "Thread B completed.\n";
    });

    // 线程 C 直接调用工作函数
    std::thread t5(workFunction, 3);

    // 线程 D 调用独立任务函数
    std::thread t6(taskA);  // 线程 D 调用任务 A

    // 线程 E 调用任务 B
    std::thread t7(taskB);  // 线程 E 调用任务 B

    // 线程 F 调用线程 G
    std::thread t8([](){
        std::cout << "Thread F started.\n";
        std::this_thread::sleep_for(std::chrono::milliseconds(100)); // 模拟任务执行
        std::thread t9(taskG); // 线程 F 调用线程 G
        t9.join();  // 等待线程 G 完成
        std::cout << "Thread F completed.\n";
    });

    // 线程 G 启动并独立工作
    std::thread t10(taskF);  // 线程 G 启动并独立工作

    // 线程 H 启动并调用任务 C
    std::thread t11([](){
        std::cout << "Thread H started.\n";
        std::this_thread::sleep_for(std::chrono::milliseconds(50)); // 模拟任务执行
        std::thread t12(taskC); // 线程 H 调用任务 C
        t12.join();  // 等待线程 C 完成
        std::cout << "Thread H completed.\n";
    });

    // 线程 I 启动并直接执行任务
    std::thread t13(taskD);

    // 等待所有线程完成
    t1.join();
    t3.join();
    t5.join();
    t6.join();
    t7.join();
    t8.join();
    t10.join();
    t11.join();
    t13.join();

    std::cout << "Main thread has finished.\n";
    return 0;
}
