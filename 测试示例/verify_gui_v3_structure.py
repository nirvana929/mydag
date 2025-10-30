#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
验证gui_v3代码结构（不需要GUI环境）
"""

import sys
import ast
from pathlib import Path

def verify_file_structure():
    """验证文件结构和方法定义"""
    
    gui_file = Path("/home/chove/桌面/cally/mycallyplus/ui/gui_v3.py")
    
    if not gui_file.exists():
        print(f"❌ 文件不存在: {gui_file}")
        return False
    
    print(f"📂 读取文件: {gui_file}")
    content = gui_file.read_text(encoding='utf-8')
    
    try:
        tree = ast.parse(content)
    except SyntaxError as e:
        print(f"❌ 语法错误: {e}")
        return False
    
    print("✅ 语法检查通过")
    
    # 查找类定义
    gui_class = None
    for node in ast.walk(tree):
        if isinstance(node, ast.ClassDef) and node.name == "MycallyplusGUIv3":
            gui_class = node
            break
    
    if not gui_class:
        print("❌ 找不到MycallyplusGUIv3类")
        return False
    
    print(f"✅ 找到类定义: MycallyplusGUIv3")
    
    # 提取所有方法
    methods = {}
    for item in gui_class.body:
        if isinstance(item, ast.FunctionDef):
            methods[item.name] = item
    
    print(f"📊 类中共有 {len(methods)} 个方法")
    
    # 检查关键方法
    required_methods = {
        '__init__': '初始化方法',
        '_build_subfunc_toolbar': '构建子功能工具栏',
        '_toggle_subfunc_toolbar': '显示/隐藏子功能工具栏',
        '_set_subfunc_toolbar': '设置子功能工具栏',
        'select_expand_file': '选择expand文件',
        'view_mutex': '查看互斥锁',
        '_show_mutex_graph': '显示互斥锁图',
        'show_mutex_info': '显示互斥锁信息',
    }
    
    print("\n🔍 检查关键方法:")
    all_found = True
    for method_name, description in required_methods.items():
        if method_name in methods:
            print(f"  ✅ {method_name:25s} - {description}")
        else:
            print(f"  ❌ {method_name:25s} - {description} (未找到)")
            all_found = False
    
    # 检查__init__方法中的实例变量
    print("\n🔍 检查__init__方法中的实例变量:")
    init_method = methods.get('__init__')
    if init_method:
        init_source = ast.get_source_segment(content, init_method)
        
        required_vars = [
            'mutex_prepared',
            'mutex_records',
            'MUTEX_COLORS',
            'subfunc_frame',
            '_subfunc_visible',
        ]
        
        for var in required_vars:
            if f'self.{var}' in init_source:
                print(f"  ✅ self.{var}")
            else:
                print(f"  ❌ self.{var} (未找到)")
                all_found = False
    
    # 检查view_mutex方法中的_set_subfunc_toolbar调用
    print("\n🔍 检查view_mutex方法:")
    view_mutex = methods.get('view_mutex')
    if view_mutex:
        view_mutex_source = ast.get_source_segment(content, view_mutex)
        
        checks = [
            ('self._set_subfunc_toolbar', '子功能工具栏设置'),
            ('self._show_mutex_graph', '默认显示互斥锁图'),
            ('self.mutex_prepared = True', '设置准备标志'),
        ]
        
        for code, desc in checks:
            if code in view_mutex_source:
                print(f"  ✅ {desc}")
            else:
                print(f"  ❌ {desc} (未找到)")
    
    return all_found

def count_lines():
    """统计代码行数"""
    gui_file = Path("/home/chove/桌面/cally/mycallyplus/ui/gui_v3.py")
    lines = gui_file.read_text(encoding='utf-8').splitlines()
    
    total_lines = len(lines)
    code_lines = sum(1 for line in lines if line.strip() and not line.strip().startswith('#'))
    comment_lines = sum(1 for line in lines if line.strip().startswith('#'))
    blank_lines = total_lines - code_lines - comment_lines
    
    print(f"\n📊 代码统计:")
    print(f"  总行数: {total_lines}")
    print(f"  代码行: {code_lines}")
    print(f"  注释行: {comment_lines}")
    print(f"  空白行: {blank_lines}")

def main():
    print("=" * 60)
    print("GUI v3 代码结构验证")
    print("=" * 60)
    print()
    
    success = verify_file_structure()
    count_lines()
    
    print("\n" + "=" * 60)
    if success:
        print("✅ 所有验证通过！")
        print("\n新增功能:")
        print("  1. 按钮1.5: 选择expand文件")
        print("  2. 子功能工具栏机制")
        print("  3. 互斥锁子功能1: 查看互斥锁图（彩色子图）")
        print("  4. 互斥锁子功能2: 查看互斥锁信息（文本显示）")
        return 0
    else:
        print("⚠️  部分验证失败")
        return 1

if __name__ == "__main__":
    sys.exit(main())
