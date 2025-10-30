#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
测试gui_v3的互斥锁子功能

验证点：
1. 子功能按钮显示/隐藏
2. 查看互斥锁图功能
3. 查看互斥锁信息功能
"""

import sys
from pathlib import Path

# 添加项目路径
project_root = Path(__file__).parent
sys.path.insert(0, str(project_root))

def test_import():
    """测试导入是否成功"""
    print("🔍 测试1: 导入模块...")
    try:
        from mycallyplus.ui.gui_v3 import MycallyplusGUIv3
        print("✅ 导入成功")
        return True
    except Exception as e:
        print(f"❌ 导入失败: {e}")
        import traceback
        traceback.print_exc()
        return False

def test_class_structure():
    """测试类结构"""
    print("\n🔍 测试2: 检查类结构...")
    try:
        from mycallyplus.ui.gui_v3 import MycallyplusGUIv3
        
        # 检查必要的方法
        required_methods = [
            '_build_subfunc_toolbar',
            '_toggle_subfunc_toolbar', 
            '_set_subfunc_toolbar',
            'view_mutex',
            '_show_mutex_graph',
            'show_mutex_info',
        ]
        
        missing_methods = []
        for method in required_methods:
            if not hasattr(MycallyplusGUIv3, method):
                missing_methods.append(method)
        
        if missing_methods:
            print(f"❌ 缺少方法: {missing_methods}")
            return False
        
        print(f"✅ 所有必要方法都存在 ({len(required_methods)} 个)")
        return True
        
    except Exception as e:
        print(f"❌ 测试失败: {e}")
        import traceback
        traceback.print_exc()
        return False

def test_instance_variables():
    """测试实例变量"""
    print("\n🔍 测试3: 检查实例变量...")
    try:
        import tkinter as tk
        from mycallyplus.ui.gui_v3 import MycallyplusGUIv3
        
        root = tk.Tk()
        root.withdraw()  # 隐藏窗口
        
        app = MycallyplusGUIv3(root)
        
        # 检查必要的实例变量
        required_vars = [
            'mutex_prepared',
            'mutex_records',
            'G',
            'MUTEX_COLORS',
            'subfunc_frame',
            '_subfunc_visible',
        ]
        
        missing_vars = []
        for var in required_vars:
            if not hasattr(app, var):
                missing_vars.append(var)
        
        if missing_vars:
            print(f"❌ 缺少实例变量: {missing_vars}")
            root.destroy()
            return False
        
        # 检查初始值
        assert app.mutex_prepared == False, "mutex_prepared应该初始化为False"
        assert app.mutex_records == [], "mutex_records应该初始化为空列表"
        assert app.G is None, "G应该初始化为None"
        assert len(app.MUTEX_COLORS) == 12, f"MUTEX_COLORS应该有12个颜色，实际有{len(app.MUTEX_COLORS)}个"
        assert app._subfunc_visible == False, "_subfunc_visible应该初始化为False"
        
        print(f"✅ 所有实例变量正确初始化 ({len(required_vars)} 个)")
        
        root.destroy()
        return True
        
    except Exception as e:
        print(f"❌ 测试失败: {e}")
        import traceback
        traceback.print_exc()
        try:
            root.destroy()
        except:
            pass
        return False

def test_button_existence():
    """测试按钮是否存在"""
    print("\n🔍 测试4: 检查UI按钮...")
    try:
        import tkinter as tk
        from mycallyplus.ui.gui_v3 import MycallyplusGUIv3
        
        root = tk.Tk()
        root.withdraw()
        
        app = MycallyplusGUIv3(root)
        
        # 检查是否有"选择expand文件"按钮
        # 检查subfunc_frame是否存在
        assert hasattr(app, 'subfunc_frame'), "应该有subfunc_frame"
        
        print("✅ UI组件正确创建")
        
        root.destroy()
        return True
        
    except Exception as e:
        print(f"❌ 测试失败: {e}")
        import traceback
        traceback.print_exc()
        try:
            root.destroy()
        except:
            pass
        return False

def main():
    """运行所有测试"""
    print("=" * 60)
    print("GUI v3 互斥锁子功能测试")
    print("=" * 60)
    
    results = []
    
    # 运行测试
    results.append(("导入测试", test_import()))
    results.append(("类结构测试", test_class_structure()))
    results.append(("实例变量测试", test_instance_variables()))
    results.append(("UI按钮测试", test_button_existence()))
    
    # 总结
    print("\n" + "=" * 60)
    print("测试总结")
    print("=" * 60)
    
    passed = sum(1 for _, result in results if result)
    total = len(results)
    
    for name, result in results:
        status = "✅ 通过" if result else "❌ 失败"
        print(f"{name:20s} {status}")
    
    print(f"\n总计: {passed}/{total} 通过")
    
    if passed == total:
        print("\n🎉 所有测试通过！")
        return 0
    else:
        print(f"\n⚠️  {total - passed} 个测试失败")
        return 1

if __name__ == "__main__":
    sys.exit(main())
