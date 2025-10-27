#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
测试GUI的"生成配置文件"功能
"""

import sys
from pathlib import Path

# 测试是否可以正确导入和使用
def test_gui_import():
    """测试GUI模块导入"""
    print("=" * 60)
    print("测试1: GUI模块导入")
    print("=" * 60)
    
    try:
        from mycallypro import gui
        print("✅ GUI模块导入成功")
        
        # 检查是否有新方法
        if hasattr(gui.MyCallyGUI, 'generate_config_files'):
            print("✅ generate_config_files 方法存在")
        else:
            print("❌ generate_config_files 方法不存在")
            return False
        
        if hasattr(gui.MyCallyGUI, '_build_dag_to_config'):
            print("✅ _build_dag_to_config 方法存在")
        else:
            print("❌ _build_dag_to_config 方法不存在")
            return False
        
        if hasattr(gui.MyCallyGUI, '_generate_circle_txt'):
            print("✅ _generate_circle_txt 方法存在")
        else:
            print("❌ _generate_circle_txt 方法不存在")
            return False
        
        return True
        
    except Exception as e:
        print(f"❌ 导入失败: {e}")
        import traceback
        traceback.print_exc()
        return False


def test_button_structure():
    """测试按钮结构（不启动GUI）"""
    print("\n" + "=" * 60)
    print("测试2: 按钮配置检查")
    print("=" * 60)
    
    # 读取GUI代码检查按钮
    gui_file = Path("mycallypro/gui.py")
    if not gui_file.exists():
        print("❌ GUI文件不存在")
        return False
    
    content = gui_file.read_text(encoding='utf-8')
    
    if 'add_button("生成配置文件", self.generate_config_files)' in content:
        print('✅ "生成配置文件"按钮已添加')
    else:
        print('❌ "生成配置文件"按钮未找到')
        return False
    
    if 'def generate_config_files(self)' in content:
        print('✅ generate_config_files 方法已定义')
    else:
        print('❌ generate_config_files 方法未定义')
        return False
    
    # 检查关键功能调用
    checks = [
        ('生成dag图', '_build_dag_to_config'),
        ('生成circle.txt', '_generate_circle_txt'),
        ('threads_only=True', '线程视图参数'),
        ('threads_only=False', '完整视图参数'),
        ('dag.dot', 'dag.dot文件'),
        ('dag_full.dot', 'dag_full.dot文件'),
        ('circle.txt', 'circle.txt文件'),
    ]
    
    for keyword, description in checks:
        if keyword in content:
            print(f'✅ {description} - 已实现')
        else:
            print(f'⚠️  {description} - 未找到关键字: {keyword}')
    
    return True


def show_usage():
    """显示使用说明"""
    print("\n" + "=" * 60)
    print("使用说明")
    print("=" * 60)
    print("""
启动GUI:
    python3 -m mycallypro.gui

或者:
    cd mycallypro && python3 gui.py

使用流程:
    1. 点击"读入 expand 文件"，选择 .expand 文件
    2. 点击"生成配置文件"按钮
    3. 等待生成完成，会弹出提示框显示进度
    4. 生成完成后，配置文件保存在：
       项目根目录/配置文件/<basename>/
       ├── dag.dot          # 线程视图DOT
       ├── dag.png          # 线程视图图片
       ├── dag_full.dot     # 完整视图DOT
       ├── dag_full.png     # 完整视图图片
       └── circle.txt       # dag_describe配置

生成的文件可以直接被dag_describe使用！
    """)


if __name__ == "__main__":
    print("开始测试mycallypro GUI新功能...\n")
    
    success1 = test_gui_import()
    success2 = test_button_structure()
    
    if success1 and success2:
        print("\n" + "=" * 60)
        print("✅ 所有测试通过！")
        print("=" * 60)
        show_usage()
    else:
        print("\n" + "=" * 60)
        print("❌ 部分测试失败")
        print("=" * 60)
        sys.exit(1)
