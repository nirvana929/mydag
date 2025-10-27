#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
集成测试脚本：测试mycallypro的txt导出和目录结构功能
"""

import sys
from pathlib import Path

# 添加mycallypro到路径
sys.path.insert(0, str(Path(__file__).parent))

from mycallypro import cli

def test_basic_export():
    """测试基本的导出功能"""
    print("=" * 60)
    print("测试1: 基本导出功能")
    print("=" * 60)
    
    # 使用测试示例文件
    expand_file = Path("mycallypro/中间结果文件/produce5/main.c.233r.expand")
    
    if not expand_file.exists():
        print(f"❌ 找不到测试文件: {expand_file}")
        return False
    
    # 设置输出路径
    output_base = Path("test_output")
    output_base.mkdir(exist_ok=True)
    
    txt_path = output_base / "test_circle.txt"
    
    # 构建命令行参数
    argv = [
        str(expand_file),
        "--export-txt", str(txt_path),
        "--output-base", str(output_base),
        "--debug"
    ]
    
    print(f"运行命令: python -m mycallypro {' '.join(argv)}")
    
    try:
        result = cli.main(argv)
        if result == 0:
            print("✅ 命令执行成功")
            
            # 检查输出文件
            if txt_path.exists():
                print(f"✅ txt文件已生成: {txt_path}")
                print("\n文件内容预览:")
                print("-" * 60)
                content = txt_path.read_text(encoding='utf-8')
                print(content[:500])
                print("-" * 60)
            else:
                print(f"❌ txt文件未生成: {txt_path}")
                return False
            
            # 检查目录结构
            config_dir = output_base / "配置文件" / "main"
            intermediate_dir = output_base / "中间结果" / "main"
            
            if config_dir.exists():
                print(f"✅ 配置文件目录已创建: {config_dir}")
                print(f"   内容: {list(config_dir.iterdir())}")
            else:
                print(f"⚠️  配置文件目录未创建: {config_dir}")
            
            if intermediate_dir.exists():
                print(f"✅ 中间结果目录已创建: {intermediate_dir}")
                debug_dir = intermediate_dir / "debug"
                if debug_dir.exists():
                    print(f"   debug子目录: {list(debug_dir.glob('*.json'))[:3]}")
            else:
                print(f"⚠️  中间结果目录未创建: {intermediate_dir}")
            
            return True
        else:
            print(f"❌ 命令执行失败，返回码: {result}")
            return False
    except Exception as e:
        print(f"❌ 执行出错: {e}")
        import traceback
        traceback.print_exc()
        return False


def test_directory_structure():
    """测试目录结构"""
    print("\n" + "=" * 60)
    print("测试2: 目录结构检查")
    print("=" * 60)
    
    output_base = Path("test_output")
    
    expected_dirs = [
        output_base / "配置文件",
        output_base / "中间结果",
    ]
    
    for dir_path in expected_dirs:
        if dir_path.exists():
            print(f"✅ {dir_path} 存在")
            subdirs = list(dir_path.iterdir())
            if subdirs:
                print(f"   子目录: {[d.name for d in subdirs if d.is_dir()]}")
        else:
            print(f"❌ {dir_path} 不存在")


if __name__ == "__main__":
    print("开始集成测试...\n")
    
    success = test_basic_export()
    
    if success:
        test_directory_structure()
        print("\n" + "=" * 60)
        print("✅ 所有测试通过！")
        print("=" * 60)
    else:
        print("\n" + "=" * 60)
        print("❌ 测试失败")
        print("=" * 60)
        sys.exit(1)
