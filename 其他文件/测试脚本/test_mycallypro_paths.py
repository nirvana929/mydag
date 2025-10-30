#!/usr/bin/env python3
"""测试mycallypro路径配置"""

from pathlib import Path

def test_paths():
    """测试路径配置"""
    print("=" * 60)
    print("测试mycallypro路径配置")
    print("=" * 60)
    
    # 模拟GUI的路径计算
    gui_file = Path("/home/chove/桌面/cally/mycallyplus/ui/gui.py")
    
    # 原来的base_dir
    old_base_dir = gui_file.parent.parent
    print(f"\n旧的base_dir (mycallyplus):")
    print(f"  {old_base_dir}")
    
    # 新的base_dir
    new_base_dir = gui_file.parent.parent.parent / "mycallypro"
    print(f"\n新的base_dir (mycallypro):")
    print(f"  {new_base_dir}")
    print(f"  存在: {new_base_dir.exists()}")
    
    # 中间结果目录
    intermediate_root = new_base_dir / "中间结果"
    print(f"\n中间结果根目录:")
    print(f"  {intermediate_root}")
    print(f"  存在: {intermediate_root.exists()}")
    
    # 测试一个具体的工作目录
    test_basename = "main"
    work_dir = intermediate_root / test_basename
    print(f"\n工作目录 (以main为例):")
    print(f"  {work_dir}")
    print(f"  存在: {work_dir.exists()}")
    
    if work_dir.exists():
        print(f"\n  子目录:")
        for subdir in sorted(work_dir.iterdir()):
            if subdir.is_dir():
                print(f"    - {subdir.name}/")
    
    # 配置文件目录
    config_dir = new_base_dir / "配置文件" / test_basename
    print(f"\n配置文件目录:")
    print(f"  {config_dir}")
    print(f"  存在: {config_dir.exists()}")
    
    if config_dir.exists():
        print(f"\n  文件:")
        for file in sorted(config_dir.iterdir()):
            if file.is_file():
                size = file.stat().st_size
                print(f"    - {file.name} ({size} bytes)")
    
    print("\n" + "=" * 60)
    print("路径配置验证完成")
    print("=" * 60)

if __name__ == "__main__":
    test_paths()
