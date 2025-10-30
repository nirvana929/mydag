#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
简单测试升级后的功能（不需要显示）
"""

import sys
import inspect
from pathlib import Path

# 添加项目路径
project_root = Path(__file__).parent
sys.path.insert(0, str(project_root))

from mycallyplus.ui.gui import MycallyplusGUI

def test_all():
    """测试所有升级项"""
    print("=" * 70)
    print("测试升级后的功能")
    print("=" * 70)
    
    passed = 0
    total = 0
    
    # 测试1: 检查新方法存在
    print("\n【测试1】检查新方法是否存在")
    print("-" * 70)
    
    new_methods = [
        ('load_source_file', '选择源文件（已修改为自动生成）'),
        ('load_dag_graph', '加载dag图（新名称）'),
        ('view_condition_nodes', '查看条件节点（新名称）'),
        ('_auto_generate_dag', '自动生成DAG（新增）'),
        ('_auto_generate_circle_txt', '自动生成circle.txt（新增）'),
    ]
    
    for method_name, desc in new_methods:
        total += 1
        if hasattr(MycallyplusGUI, method_name):
            print(f"  ✓ {method_name:30s} - {desc}")
            passed += 1
        else:
            print(f"  ✗ {method_name:30s} - {desc} [不存在]")
    
    # 测试2: 检查旧方法已删除
    print("\n【测试2】检查旧方法是否已删除")
    print("-" * 70)
    
    old_methods = [
        ('generate_threads_dag', '生成线程DAG（应删除）'),
        ('generate_conditions_dag', '生成条件DAG（应删除）'),
    ]
    
    for method_name, desc in old_methods:
        total += 1
        if not hasattr(MycallyplusGUI, method_name):
            print(f"  ✓ {method_name:30s} - {desc}")
            passed += 1
        else:
            print(f"  ✗ {method_name:30s} - {desc} [仍存在]")
    
    # 测试3: 检查方法实现
    print("\n【测试3】检查方法实现逻辑")
    print("-" * 70)
    
    # 3.1 检查 load_source_file 包含自动生成逻辑
    total += 1
    source = inspect.getsource(MycallyplusGUI.load_source_file)
    if '_auto_generate_dag' in source and '_auto_generate_circle_txt' in source:
        print(f"  ✓ load_source_file 包含自动生成逻辑")
        passed += 1
    else:
        print(f"  ✗ load_source_file 未包含自动生成逻辑")
    
    # 3.2 检查 load_dag_graph 只加载文件
    total += 1
    source = inspect.getsource(MycallyplusGUI.load_dag_graph)
    has_load = 'dag.dot' in source and '_read_dot_to_graph' in source
    no_generate = 'legacy.main' not in source and '_generate_dag_internal' not in source
    if has_load and no_generate:
        print(f"  ✓ load_dag_graph 只加载不生成")
        passed += 1
    else:
        print(f"  ✗ load_dag_graph 实现不正确")
    
    # 3.3 检查 view_condition_nodes 只加载文件
    total += 1
    source = inspect.getsource(MycallyplusGUI.view_condition_nodes)
    has_load = 'conditions.dot' in source and '_read_dot_to_graph' in source
    no_generate = 'legacy.main' not in source and '_generate_dag_internal' not in source
    if has_load and no_generate:
        print(f"  ✓ view_condition_nodes 只加载不生成")
        passed += 1
    else:
        print(f"  ✗ view_condition_nodes 实现不正确")
    
    # 测试4: 检查按钮文字（通过源代码）
    print("\n【测试4】检查按钮文字")
    print("-" * 70)
    
    gui_source = inspect.getsource(MycallyplusGUI.__init__)
    
    button_checks = [
        ('生成dag图', 'load_dag_graph'),
        ('查看条件节点', 'view_condition_nodes'),
    ]
    
    for button_text, method_name in button_checks:
        total += 1
        # 检查按钮文字和方法名是否在同一行附近
        if button_text in gui_source and method_name in gui_source:
            # 更精确的检查：确保它们在同一个 add_btn 调用中
            lines = gui_source.split('\n')
            found = False
            for line in lines:
                if button_text in line and method_name in line:
                    found = True
                    break
            if found:
                print(f"  ✓ 按钮 '{button_text}' 绑定到 {method_name}")
                passed += 1
            else:
                print(f"  ✗ 按钮 '{button_text}' 未正确绑定到 {method_name}")
        else:
            print(f"  ✗ 按钮 '{button_text}' 或方法 {method_name} 未找到")
    
    # 测试5: 检查工作流
    print("\n【测试5】检查工作流设计")
    print("-" * 70)
    
    total += 1
    load_source = inspect.getsource(MycallyplusGUI.load_source_file)
    
    # 检查是否按顺序调用三个生成函数
    has_dag = "_auto_generate_dag" in load_source and "dag.dot" in load_source
    has_conditions = "_auto_generate_dag" in load_source and "conditions.dot" in load_source
    has_circle = "_auto_generate_circle_txt" in load_source
    
    if has_dag and has_conditions and has_circle:
        print(f"  ✓ load_source_file 按顺序自动生成: dag.dot, conditions.dot, circle.txt")
        passed += 1
    else:
        print(f"  ✗ load_source_file 工作流不完整")
        if not has_dag:
            print(f"     - 缺少 dag.dot 生成")
        if not has_conditions:
            print(f"     - 缺少 conditions.dot 生成")
        if not has_circle:
            print(f"     - 缺少 circle.txt 生成")
    
    # 汇总
    print("\n" + "=" * 70)
    print("测试结果汇总")
    print("=" * 70)
    print(f"通过: {passed}/{total}")
    print(f"失败: {total - passed}/{total}")
    
    if passed == total:
        print("\n🎉 所有测试通过！升级成功！")
        print("\n升级内容：")
        print("  1. ✓ 按钮 '生成线程dag' → '生成dag图'")
        print("  2. ✓ 按钮 '生成条件dag' → '查看条件节点'")
        print("  3. ✓ 选择源文件后自动生成所有必需文件")
        print("  4. ✓ 生成dag图/查看条件节点 仅加载已生成的文件")
        return 0
    else:
        print(f"\n⚠️  有 {total - passed} 项测试失败")
        return 1

if __name__ == "__main__":
    sys.exit(test_all())
