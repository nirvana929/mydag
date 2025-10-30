#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
测试升级后的功能
"""

import sys
from pathlib import Path

# 添加项目路径
project_root = Path(__file__).parent
sys.path.insert(0, str(project_root))

from mycallyplus.ui.gui import MycallyplusGUI

def test_method_names():
    """测试方法名是否正确"""
    print("=" * 60)
    print("测试1: 检查方法名")
    print("=" * 60)
    
    # 检查新方法是否存在
    methods_to_check = [
        'load_source_file',
        'load_dag_graph',
        'view_condition_nodes',
        'generate_full_dag',
        'generate_circle_txt',
        '_auto_generate_dag',
        '_auto_generate_circle_txt'
    ]
    
    for method_name in methods_to_check:
        if hasattr(MycallyplusGUI, method_name):
            print(f"✓ 方法 {method_name} 存在")
        else:
            print(f"✗ 方法 {method_name} 不存在")
            return False
    
    # 检查旧方法是否已删除
    old_methods = ['generate_threads_dag', 'generate_conditions_dag']
    for method_name in old_methods:
        if not hasattr(MycallyplusGUI, method_name):
            print(f"✓ 旧方法 {method_name} 已删除")
        else:
            print(f"✗ 旧方法 {method_name} 仍然存在")
            return False
    
    print("\n所有方法名检查通过！\n")
    return True

def test_button_text():
    """测试按钮文字"""
    print("=" * 60)
    print("测试2: 检查按钮文字")
    print("=" * 60)
    
    import tkinter as tk
    root = tk.Tk()
    root.withdraw()  # 隐藏主窗口
    
    try:
        gui = MycallyplusGUI(root)
        
        # 检查按钮文字
        expected_buttons = [
            "选择源文件",
            "生成dag图",
            "查看条件节点",
            "生成完整DAG",
            "生成配置文件"
        ]
        
        # 获取所有按钮
        buttons = []
        for child in gui.root.winfo_children():
            if hasattr(child, 'winfo_children'):
                for sub in child.winfo_children():
                    if hasattr(sub, 'winfo_children'):
                        for widget in sub.winfo_children():
                            if isinstance(widget, tk.Button):
                                buttons.append(widget)
        
        found_texts = [btn.cget('text') for btn in buttons[:5]]  # 前5个是生成功能按钮
        
        print(f"期望按钮文字: {expected_buttons}")
        print(f"实际按钮文字: {found_texts}")
        
        if found_texts == expected_buttons:
            print("\n✓ 按钮文字正确！\n")
            return True
        else:
            print("\n✗ 按钮文字不匹配\n")
            return False
    finally:
        root.destroy()

def test_method_signatures():
    """测试方法签名"""
    print("=" * 60)
    print("测试3: 检查方法签名")
    print("=" * 60)
    
    import inspect
    
    # 检查 load_source_file 是否包含自动生成逻辑
    source = inspect.getsource(MycallyplusGUI.load_source_file)
    if '_auto_generate_dag' in source and '_auto_generate_circle_txt' in source:
        print("✓ load_source_file 包含自动生成逻辑")
    else:
        print("✗ load_source_file 未包含自动生成逻辑")
        return False
    
    # 检查 load_dag_graph 是否只加载文件
    source = inspect.getsource(MycallyplusGUI.load_dag_graph)
    if 'dag.dot' in source and '_read_dot_to_graph' in source:
        print("✓ load_dag_graph 包含加载逻辑")
    else:
        print("✗ load_dag_graph 未包含加载逻辑")
        return False
    
    # 检查 view_condition_nodes 是否只加载文件
    source = inspect.getsource(MycallyplusGUI.view_condition_nodes)
    if 'conditions.dot' in source and '_read_dot_to_graph' in source:
        print("✓ view_condition_nodes 包含加载逻辑")
    else:
        print("✗ view_condition_nodes 未包含加载逻辑")
        return False
    
    print("\n所有方法签名检查通过！\n")
    return True

def main():
    """运行所有测试"""
    print("\n" + "=" * 60)
    print("开始测试升级后的功能")
    print("=" * 60 + "\n")
    
    results = []
    
    # 测试1: 方法名
    results.append(("方法名检查", test_method_names()))
    
    # 测试2: 按钮文字
    results.append(("按钮文字检查", test_button_text()))
    
    # 测试3: 方法签名
    results.append(("方法签名检查", test_method_signatures()))
    
    # 汇总结果
    print("\n" + "=" * 60)
    print("测试结果汇总")
    print("=" * 60)
    
    passed = 0
    failed = 0
    for name, result in results:
        status = "✓ 通过" if result else "✗ 失败"
        print(f"{name}: {status}")
        if result:
            passed += 1
        else:
            failed += 1
    
    print(f"\n总计: {passed}/{len(results)} 项测试通过")
    
    if failed == 0:
        print("\n🎉 所有测试通过！升级成功！")
        return 0
    else:
        print(f"\n⚠️  有 {failed} 项测试失败")
        return 1

if __name__ == "__main__":
    sys.exit(main())
