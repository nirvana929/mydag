#include <iostream>
#include <thread>
#include <chrono>
using namespace std;
// 模拟工作函数 B
void workFunctionB(int id) {
    cout << "Thread B (" << id << ") is working.\n";
    this_thread::sleep_for(chrono::milliseconds(100));  // 模拟工作延迟
    cout << "Thread B (" << id << ") has finished work.\n";
}

// 线程 A 调用线程 B
void workFunctionA() {
    cout << "Thread A started.\n";
    thread tB(workFunctionB, 1); // 线程 A 调用线程 B
    tB.join();  // 等待线程 B 完成
    cout << "Thread A completed.\n";
}

int main() {
    // 启动线程 A
    thread tA(workFunctionA);
    tA.join();  // 等待线程 A 完成
    return 0;
}
