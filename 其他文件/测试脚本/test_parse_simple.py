#!/usr/bin/env python3
"""
简单测试互斥锁和信号量解析功能
"""

import sys
from pathlib import Path

project_root = Path(__file__).parent
sys.path.insert(0, str(project_root))

def test_parsing():
    """测试解析功能"""
    print("=" * 70)
    print("测试互斥锁和信号量解析功能")
    print("=" * 70)
    
    # 创建测试数据
    test_txt = project_root / "test_circle_data.txt"
    test_txt.write_text("""互斥量
thread1/lock1 mutex_a 0 10 main.c
thread1/unlock1 mutex_a 0 20 main.c
thread2/lock2 mutex_b 1 30 main.c
thread2/unlock2 mutex_b 1 40 main.c

信号量
thread1/post1 sem_x 0 15 main.c
thread2/wait1 sem_x 0 25 main.c
thread2/post2 sem_y 1 35 main.c
thread1/wait2 sem_y 1 45 main.c
""", encoding='utf-8')
    
    try:
        from mycallyplus.ui.gui_v3 import MycallyplusGUIv3
        import tkinter as tk
        
        root = tk.Tk()
        root.withdraw()
        
        gui = MycallyplusGUIv3()
        gui.root.withdraw()
        
        # 测试互斥锁解析
        print("\n--- 测试互斥锁解析 ---")
        try:
            mutex_records = gui._parse_mutex_from_txt(test_txt)
            print(f"✅ 解析成功: {len(mutex_records)} 个互斥锁配对")
            for i, rec in enumerate(mutex_records):
                print(f"\n配对 {i+1}:")
                print(f"  变量: {rec.var}")
                print(f"  ID: {rec.idx}")
                print(f"  Lock: {rec.lock} (行{rec.lock_line}, 文件{rec.lock_file})")
                print(f"  Unlock: {rec.unlock} (行{rec.unlock_line}, 文件{rec.unlock_file})")
        except Exception as e:
            print(f"❌ 互斥锁解析失败: {e}")
            import traceback
            traceback.print_exc()
        
        # 测试信号量解析
        print("\n--- 测试信号量解析 ---")
        try:
            sem_records = gui._parse_semaphore_from_txt(test_txt)
            print(f"✅ 解析成功: {len(sem_records)} 个信号量配对")
            for i, rec in enumerate(sem_records):
                print(f"\n配对 {i+1}:")
                print(f"  变量: {rec.var}")
                print(f"  ID: {rec.idx}")
                print(f"  Post: {rec.post} (行{rec.post_line}, 文件{rec.post_file})")
                print(f"  Wait: {rec.wait} (行{rec.wait_line}, 文件{rec.wait_file})")
        except Exception as e:
            print(f"❌ 信号量解析失败: {e}")
            import traceback
            traceback.print_exc()
        
        gui.root.destroy()
        root.destroy()
        
        # 清理
        test_txt.unlink()
        
        print("\n" + "=" * 70)
        print("✅ 测试完成！")
        print("=" * 70)
        return True
        
    except Exception as e:
        print(f"❌ 测试失败: {e}")
        import traceback
        traceback.print_exc()
        if test_txt.exists():
            test_txt.unlink()
        return False

if __name__ == "__main__":
    success = test_parsing()
    sys.exit(0 if success else 1)
