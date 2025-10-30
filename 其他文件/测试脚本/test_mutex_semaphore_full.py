#!/usr/bin/env python3
"""
完整测试互斥锁和信号量功能
基于dag_describe.py的完整实现
"""

import sys
from pathlib import Path

project_root = Path(__file__).parent
sys.path.insert(0, str(project_root))

def test_reference_implementation():
    """测试参考实现（dag_describe.py）"""
    print("=" * 70)
    print("测试1: 参考实现（dag_describe.py）")
    print("=" * 70)
    
    test_config = project_root / "test" / "配置文件" / "dag1"
    if not test_config.exists():
        print(f"❌ 测试配置不存在: {test_config}")
        return False
    
    # 查找dot和txt文件
    dot_files = list(test_config.glob("*.dot"))
    txt_files = list(test_config.glob("*.txt"))
    
    if not dot_files:
        print(f"❌ 未找到DOT文件")
        return False
    
    print(f"✅ DOT文件: {dot_files[0].name}")
    if txt_files:
        print(f"✅ TXT文件: {txt_files[0].name}")
    else:
        print(f"⚠️  未找到TXT文件")
    
    # 测试解析
    try:
        from test.dag_describe import TarjanGUI
        import tkinter as tk
        
        root = tk.Tk()
        root.withdraw()
        
        app = TarjanGUI(root)
        app.load_from_path(test_config)
        
        # 测试互斥锁解析
        if app.current_circle_path:
            success = app._prepare_mutex_data()
            if success:
                print(f"✅ 互斥锁解析成功: {len(app.mutex_records)} 个配对")
                for rec in app.mutex_records[:3]:
                    print(f"   • {rec.var}: {rec.lock} → {rec.unlock}")
            else:
                print(f"⚠️  互斥锁解析失败或无数据")
            
            # 测试信号量解析
            sem_records = app._parse_semaphore_pairs()
            if sem_records:
                print(f"✅ 信号量解析成功: {len(sem_records)} 个配对")
                for rec in sem_records[:3]:
                    print(f"   • {rec.var}: {rec.post} → {rec.wait}")
            else:
                print(f"⚠️  信号量解析失败或无数据")
        
        root.destroy()
        return True
        
    except Exception as e:
        print(f"❌ 测试失败: {e}")
        import traceback
        traceback.print_exc()
        return False

def test_gui_v3_implementation():
    """测试GUI v3实现"""
    print("\n" + "=" * 70)
    print("测试2: GUI v3.5实现（gui_v3.py）")
    print("=" * 70)
    
    test_dir = project_root / "测试示例" / "produce5"
    if not test_dir.exists():
        print(f"❌ 测试目录不存在: {test_dir}")
        return False
    
    try:
        from mycallyplus.ui.gui_v3 import MyCallyPlusGUI
        import tkinter as tk
        
        root = tk.Tk()
        root.withdraw()
        
        gui = MyCallyPlusGUI()
        gui.root.withdraw()
        
        # 设置测试状态
        source_file = test_dir / "main.c"
        expand_file = test_dir / "main.c.233r.expand"
        
        if not expand_file.exists():
            print(f"⚠️  expand文件不存在: {expand_file}")
            print("   尝试生成...")
            gui.state.source_file = source_file
            try:
                gui._compile_to_expand()
            except Exception as e:
                print(f"❌ 生成expand文件失败: {e}")
                return False
        else:
            gui.state.expand_file = expand_file
        
        # 查找或生成DOT和TXT文件
        debug_dir = test_dir / "debug"
        if debug_dir.exists():
            dot_files = sorted(debug_dir.glob("*_full.dot"))
            json_files = sorted(debug_dir.glob("*_full.json"))
            
            if dot_files:
                gui.state.dot_file = dot_files[-1]  # 最新的
                print(f"✅ 使用DOT文件: {gui.state.dot_file.name}")
            
            # 查找circle.txt
            circle_txt = debug_dir / "circle.txt"
            if circle_txt.exists():
                gui.state.txt_file = circle_txt
                print(f"✅ 使用TXT文件: {gui.state.txt_file.name}")
            else:
                # 创建测试数据
                print("⚠️  circle.txt不存在，创建测试数据...")
                circle_txt.write_text("""互斥量
thread1_lock1 mutex_a 0 10 main.c
thread1_unlock1 mutex_a 0 20 main.c
thread2_lock2 mutex_b 1 30 main.c
thread2_unlock2 mutex_b 1 40 main.c

信号量
thread1_post1 sem_x 0 15 main.c
thread2_wait1 sem_x 0 25 main.c
thread2_post2 sem_y 1 35 main.c
thread1_wait2 sem_y 1 45 main.c
""", encoding='utf-8')
                gui.state.txt_file = circle_txt
                print(f"✅ 创建测试数据: {circle_txt}")
        
        gui.state.work_dir = debug_dir
        
        # 测试互斥锁解析
        print("\n--- 测试互斥锁解析 ---")
        if gui.state.txt_file:
            try:
                mutex_records = gui._parse_mutex_from_txt(gui.state.txt_file)
                if mutex_records:
                    print(f"✅ 解析成功: {len(mutex_records)} 个互斥锁配对")
                    for rec in mutex_records[:3]:
                        print(f"   • {rec.var} (ID={rec.idx}): {rec.lock} → {rec.unlock}")
                else:
                    print(f"⚠️  未找到互斥锁配对")
            except Exception as e:
                print(f"❌ 互斥锁解析失败: {e}")
                import traceback
                traceback.print_exc()
        
        # 测试信号量解析
        print("\n--- 测试信号量解析 ---")
        if gui.state.txt_file:
            try:
                sem_records = gui._parse_semaphore_from_txt(gui.state.txt_file)
                if sem_records:
                    print(f"✅ 解析成功: {len(sem_records)} 个信号量配对")
                    for rec in sem_records[:3]:
                        print(f"   • {rec.var} (ID={rec.idx}): {rec.post} → {rec.wait}")
                else:
                    print(f"⚠️  未找到信号量配对")
            except Exception as e:
                print(f"❌ 信号量解析失败: {e}")
                import traceback
                traceback.print_exc()
        
        # 测试按钮5和按钮6（如果有足够的数据）
        if gui.state.dot_file and gui.state.txt_file:
            print("\n--- 测试按钮5: 查看互斥锁 ---")
            try:
                gui.view_mutex()
                mutex_dir = gui.state.work_dir / "查看互斥锁"
                mutex_png = mutex_dir / "mutex.png"
                if mutex_png.exists():
                    print(f"✅ 互斥锁图生成成功: {mutex_png}")
                else:
                    print(f"⚠️  互斥锁图未生成")
            except Exception as e:
                print(f"❌ 按钮5失败: {e}")
                import traceback
                traceback.print_exc()
            
            print("\n--- 测试按钮6: 生成信号量图 ---")
            try:
                gui.generate_semaphore()
                sem_dir = gui.state.work_dir / "生成信号量图"
                expected_files = ["original.png", "tarjan.png", "threads.png"]
                for filename in expected_files:
                    png_path = sem_dir / filename
                    if png_path.exists():
                        print(f"✅ {filename} 生成成功")
                    else:
                        print(f"⚠️  {filename} 未生成")
            except Exception as e:
                print(f"❌ 按钮6失败: {e}")
                import traceback
                traceback.print_exc()
        
        gui.root.destroy()
        root.destroy()
        return True
        
    except Exception as e:
        print(f"❌ 测试失败: {e}")
        import traceback
        traceback.print_exc()
        return False

def compare_implementations():
    """比较两个实现的差异"""
    print("\n" + "=" * 70)
    print("测试3: 对比两个实现")
    print("=" * 70)
    
    # 创建测试数据
    test_txt = project_root / "test_circle.txt"
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
        # 测试参考实现
        from test.dag_describe import TarjanGUI as RefGUI
        import tkinter as tk
        
        root1 = tk.Tk()
        root1.withdraw()
        ref_app = RefGUI(root1)
        ref_app.current_circle_path = test_txt
        
        # 解析互斥锁
        ref_app._prepare_mutex_data()
        ref_mutex_count = len(ref_app.mutex_records)
        
        # 解析信号量
        ref_sem = ref_app._parse_semaphore_pairs()
        ref_sem_count = len(ref_sem)
        
        root1.destroy()
        
        # 测试GUI v3实现
        from mycallyplus.ui.gui_v3 import MyCallyPlusGUI
        
        root2 = tk.Tk()
        root2.withdraw()
        gui_app = MyCallyPlusGUI()
        gui_app.root.withdraw()
        
        # 解析互斥锁
        gui_mutex = gui_app._parse_mutex_from_txt(test_txt)
        gui_mutex_count = len(gui_mutex)
        
        # 解析信号量
        gui_sem = gui_app._parse_semaphore_from_txt(test_txt)
        gui_sem_count = len(gui_sem)
        
        gui_app.root.destroy()
        root2.destroy()
        
        # 对比结果
        print(f"\n互斥锁配对数量:")
        print(f"  参考实现: {ref_mutex_count}")
        print(f"  GUI v3:   {gui_mutex_count}")
        print(f"  {'✅ 一致' if ref_mutex_count == gui_mutex_count else '❌ 不一致'}")
        
        print(f"\n信号量配对数量:")
        print(f"  参考实现: {ref_sem_count}")
        print(f"  GUI v3:   {gui_sem_count}")
        print(f"  {'✅ 一致' if ref_sem_count == gui_sem_count else '❌ 不一致'}")
        
        # 清理
        test_txt.unlink()
        
        return ref_mutex_count == gui_mutex_count and ref_sem_count == gui_sem_count
        
    except Exception as e:
        print(f"❌ 对比测试失败: {e}")
        import traceback
        traceback.print_exc()
        if test_txt.exists():
            test_txt.unlink()
        return False

def main():
    print("🔍 完整测试互斥锁和信号量功能\n")
    
    results = []
    
    # 测试1: 参考实现
    try:
        result1 = test_reference_implementation()
        results.append(("参考实现测试", result1))
    except Exception as e:
        print(f"❌ 测试1失败: {e}")
        results.append(("参考实现测试", False))
    
    # 测试2: GUI v3实现
    try:
        result2 = test_gui_v3_implementation()
        results.append(("GUI v3实现测试", result2))
    except Exception as e:
        print(f"❌ 测试2失败: {e}")
        results.append(("GUI v3实现测试", False))
    
    # 测试3: 对比测试
    try:
        result3 = compare_implementations()
        results.append(("对比测试", result3))
    except Exception as e:
        print(f"❌ 测试3失败: {e}")
        results.append(("对比测试", False))
    
    # 总结
    print("\n" + "=" * 70)
    print("测试总结")
    print("=" * 70)
    
    for test_name, result in results:
        status = "✅ 通过" if result else "❌ 失败"
        print(f"{test_name}: {status}")
    
    all_passed = all(r for _, r in results)
    if all_passed:
        print("\n🎉 所有测试通过！")
        return 0
    else:
        print("\n⚠️  部分测试失败")
        return 1

if __name__ == "__main__":
    sys.exit(main())
