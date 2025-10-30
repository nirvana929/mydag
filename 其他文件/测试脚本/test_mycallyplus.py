#!/usr/bin/env python3
"""
Mycallyplus 快速测试脚本

测试项目：
1. 模块导入
2. CLI 功能
3. GUI 类初始化（不显示窗口）
"""

import sys
from pathlib import Path

# 添加项目根目录到路径
project_root = Path(__file__).parent
sys.path.insert(0, str(project_root))

def test_imports():
    """测试模块导入"""
    print("=" * 60)
    print("测试 1: 模块导入")
    print("=" * 60)
    
    try:
        # 测试核心模块
        from mycallyplus.core import Parser, CallGraph
        print("✅ core 模块导入成功")
        
        # 测试生成模块
        from mycallyplus.generation import build_callee_info
        print("✅ generation 模块导入成功")
        
        # 测试可视化模块
        from mycallyplus.visualization import viewer
        print("✅ visualization 模块导入成功")
        
        # 测试UI模块
        from mycallyplus.ui import gui
        print("✅ ui 模块导入成功")
        
        # 测试CLI
        from mycallyplus import cli
        print("✅ cli 模块导入成功")
        
        return True
    except Exception as e:
        print(f"❌ 导入失败: {e}")
        import traceback
        traceback.print_exc()
        return False


def test_cli():
    """测试CLI功能"""
    print("\n" + "=" * 60)
    print("测试 2: CLI 功能")
    print("=" * 60)
    
    try:
        from mycallyplus import cli
        
        # 测试CLI入口点存在
        assert hasattr(cli, 'main'), "CLI main函数不存在"
        print("✅ CLI main 函数存在")
        
        # 测试子命令函数存在
        assert hasattr(cli, '_run_gui'), "GUI启动函数不存在"
        print("✅ GUI 启动函数存在")
        
        assert hasattr(cli, '_run_describe'), "describe函数不存在"
        print("✅ describe 函数存在")
        
        return True
    except Exception as e:
        print(f"❌ CLI测试失败: {e}")
        import traceback
        traceback.print_exc()
        return False


def test_gui_class():
    """测试GUI类（不实际显示窗口）"""
    print("\n" + "=" * 60)
    print("测试 3: GUI 类")
    print("=" * 60)
    
    try:
        from mycallyplus.ui.gui import MycallyplusGUI
        import tkinter as tk
        
        # 检查类定义
        assert MycallyplusGUI is not None, "GUI类不存在"
        print("✅ GUI 类定义正确")
        
        # 检查关键方法
        methods = [
            'load_source_file',
            'generate_threads_dag',
            'generate_conditions_dag',
            'generate_full_dag',
            'generate_circle_txt',
            'use_default',
            'select_config_folder',
            'generate_original_graph',
            'view_mutex',
            'generate_semaphore_pipeline',
        ]
        
        for method in methods:
            assert hasattr(MycallyplusGUI, method), f"方法 {method} 不存在"
        
        print(f"✅ 所有 {len(methods)} 个主功能方法都存在")
        
        return True
    except Exception as e:
        print(f"❌ GUI测试失败: {e}")
        import traceback
        traceback.print_exc()
        return False


def test_directory_structure():
    """测试目录结构"""
    print("\n" + "=" * 60)
    print("测试 4: 目录结构")
    print("=" * 60)
    
    required_dirs = [
        'core',
        'generation',
        'visualization',
        'ui',
    ]
    
    required_files = [
        '__init__.py',
        '__main__.py',
        'cli.py',
        'requirements.txt',
        'README.md',
    ]
    
    mycallyplus_dir = project_root / 'mycallyplus'
    
    try:
        # 检查目录
        for d in required_dirs:
            path = mycallyplus_dir / d
            assert path.is_dir(), f"目录 {d} 不存在"
        print(f"✅ 所有 {len(required_dirs)} 个必需目录都存在")
        
        # 检查文件
        for f in required_files:
            path = mycallyplus_dir / f
            assert path.is_file(), f"文件 {f} 不存在"
        print(f"✅ 所有 {len(required_files)} 个必需文件都存在")
        
        return True
    except Exception as e:
        print(f"❌ 目录结构测试失败: {e}")
        return False


def main():
    """运行所有测试"""
    print("\n" + "🚀" * 30)
    print("Mycallyplus 快速测试")
    print("🚀" * 30 + "\n")
    
    results = []
    
    results.append(("目录结构", test_directory_structure()))
    results.append(("模块导入", test_imports()))
    results.append(("CLI功能", test_cli()))
    results.append(("GUI类", test_gui_class()))
    
    # 总结
    print("\n" + "=" * 60)
    print("测试总结")
    print("=" * 60)
    
    for name, result in results:
        status = "✅ 通过" if result else "❌ 失败"
        print(f"{name:20s}: {status}")
    
    total = len(results)
    passed = sum(1 for _, r in results if r)
    
    print(f"\n总计: {passed}/{total} 项测试通过")
    
    if passed == total:
        print("\n🎉 所有测试通过！项目结构完整，可以开始使用。\n")
        print("快速启动:")
        print("  python -m mycallyplus              # 启动统一GUI")
        print("  python -m mycallyplus gui          # 同上")
        print("  python -m mycallyplus describe     # 启动独立查看器")
        return 0
    else:
        print(f"\n⚠️  有 {total - passed} 项测试失败，请检查错误信息。\n")
        return 1


if __name__ == "__main__":
    sys.exit(main())
