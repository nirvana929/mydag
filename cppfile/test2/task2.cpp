#include <iostream>
#include <thread>

using namespace std;
// 模拟工作函数 B
void workFunctionB(int id) {
    this_thread::sleep_for(chrono::milliseconds(100));  // 模拟工作延迟
}

// 线程 A 调用线程 B
void workFunctionA() {
    thread tB(workFunctionB, 1); // 线程 A 调用线程 B
    tB.join();  // 等待线程 B 完成
}

int main() {
    // 启动线程 A
    thread tA(workFunctionA);
    tA.join();  // 等待线程 A 完成
    return 0;
}
