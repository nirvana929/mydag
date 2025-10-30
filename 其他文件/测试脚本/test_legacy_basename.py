#!/usr/bin/env python3
"""测试legacy base_name计算逻辑"""

from pathlib import Path

def calculate_legacy_base_name(expand_path: Path) -> str:
    """计算legacy使用的base_name"""
    expand_stem = expand_path.stem  # 去掉.expand
    
    # 与legacy保持一致的逻辑
    if expand_stem.endswith('.233r'):
        return expand_stem[:-5]  # 去掉.233r (5个字符)
    elif '.' in expand_stem:
        return expand_stem.split('.')[0]
    else:
        return expand_stem

def test_calculations():
    """测试各种文件名"""
    print("=" * 60)
    print("测试Legacy Base Name计算")
    print("=" * 60)
    
    test_cases = [
        Path("/path/to/main.c.233r.expand"),
        Path("/path/to/test.c.233r.expand"),
        Path("/path/to/program.233r.expand"),
        Path("/path/to/simple.expand"),
    ]
    
    for path in test_cases:
        expand_stem = path.stem
        legacy_name = calculate_legacy_base_name(path)
        
        print(f"\n文件: {path.name}")
        print(f"  expand_stem: {expand_stem}")
        print(f"  legacy_base_name: {legacy_name}")
        print(f"  配置目录: mycallypro/配置文件/{legacy_name}/")
        print(f"  threads文件: {legacy_name}_threads.dot")
        print(f"  full文件: {legacy_name}_full.dot")
    
    print("\n" + "=" * 60)
    print("实际验证 - main.c.233r.expand")
    print("=" * 60)
    
    actual_path = Path("/home/chove/桌面/cally/mycallypro/中间结果/main/rtl文件/main.c.233r.expand")
    legacy_name = calculate_legacy_base_name(actual_path)
    
    print(f"\nExpand文件: {actual_path.name}")
    print(f"Legacy base_name: {legacy_name}")
    
    config_dir = Path("/home/chove/桌面/cally/mycallypro/配置文件") / legacy_name
    print(f"\n预期配置目录: {config_dir}")
    print(f"目录存在: {config_dir.exists()}")
    
    if config_dir.exists():
        print(f"\n实际文件:")
        for file in sorted(config_dir.iterdir()):
            if file.is_file():
                print(f"  - {file.name}")
    
    threads_dot = config_dir / f"{legacy_name}_threads.dot"
    full_dot = config_dir / f"{legacy_name}_full.dot"
    circle_txt = config_dir / "circle.txt"
    
    print(f"\n文件检查:")
    print(f"  {threads_dot.name}: {'✓ 存在' if threads_dot.exists() else '✗ 不存在'}")
    print(f"  {full_dot.name}: {'✓ 存在' if full_dot.exists() else '✗ 不存在'}")
    print(f"  circle.txt: {'✓ 存在' if circle_txt.exists() else '✗ 不存在'}")

if __name__ == "__main__":
    test_calculations()
