#!/usr/bin/env python3
"""测试简化的查找逻辑"""

from pathlib import Path

def test_simplified_search():
    """测试简化的目录和文件查找"""
    print("=" * 70)
    print("测试简化的查找逻辑")
    print("=" * 70)
    
    # 模拟实际情况
    source_file = Path("/path/to/main.c")
    source_basename = source_file.stem  # main
    
    config_base = Path("/home/chove/桌面/cally/mycallypro/配置文件")
    
    print(f"\n源文件: {source_file.name}")
    print(f"Basename: {source_basename}")
    print(f"配置基础目录: {config_base}")
    
    # 步骤1: 查找配置目录
    print(f"\n{'='*70}")
    print("步骤1: 查找配置目录")
    print(f"{'='*70}")
    
    config_dir = None
    print(f"\n扫描 {config_base} 下的子目录...")
    
    if config_base.exists():
        for subdir in config_base.iterdir():
            if subdir.is_dir():
                match = subdir.name.startswith(source_basename)
                status = "✓ 匹配" if match else "  不匹配"
                print(f"  {status} - {subdir.name}")
                
                if match and not config_dir:
                    config_dir = subdir
    
    if config_dir:
        print(f"\n✓ 找到配置目录: {config_dir.name}")
    else:
        print(f"\n✗ 未找到配置目录")
        return
    
    # 步骤2: 查找threads.dot文件
    print(f"\n{'='*70}")
    print("步骤2: 查找threads.dot文件")
    print(f"{'='*70}")
    
    print(f"\n在 {config_dir.name} 中查找 *_threads.dot ...")
    threads_dots = list(config_dir.glob("*_threads.dot"))
    
    if threads_dots:
        print(f"✓ 找到 {len(threads_dots)} 个threads.dot文件:")
        for dot in threads_dots:
            print(f"  - {dot.name} ({dot.stat().st_size} bytes)")
        print(f"\n将使用: {threads_dots[0].name}")
    else:
        print(f"✗ 未找到threads.dot文件")
    
    # 步骤3: 查找full.dot文件
    print(f"\n{'='*70}")
    print("步骤3: 查找full.dot文件")
    print(f"{'='*70}")
    
    print(f"\n在 {config_dir.name} 中查找 *_full.dot ...")
    full_dots = list(config_dir.glob("*_full.dot"))
    
    if full_dots:
        print(f"✓ 找到 {len(full_dots)} 个full.dot文件:")
        for dot in full_dots:
            print(f"  - {dot.name} ({dot.stat().st_size} bytes)")
        print(f"\n将使用: {full_dots[0].name}")
    else:
        print(f"✗ 未找到full.dot文件")
    
    # 步骤4: 查找circle.txt
    print(f"\n{'='*70}")
    print("步骤4: 查找circle.txt")
    print(f"{'='*70}")
    
    circle_txt = config_dir / "circle.txt"
    if circle_txt.exists():
        print(f"✓ 找到: {circle_txt.name} ({circle_txt.stat().st_size} bytes)")
    else:
        print(f"✗ 未找到: circle.txt")
    
    # 总结
    print(f"\n{'='*70}")
    print("总结")
    print(f"{'='*70}")
    
    print(f"\n查找策略:")
    print(f"  1. 配置目录: 查找以 '{source_basename}' 开头的子目录")
    print(f"  2. DOT文件: 使用 glob 模式匹配 (*_threads.dot, *_full.dot)")
    print(f"  3. TXT文件: 固定文件名 circle.txt")
    
    print(f"\n优势:")
    print(f"  ✓ 不需要计算精确的legacy命名")
    print(f"  ✓ 不需要知道具体文件名规则")
    print(f"  ✓ 模糊匹配，容错性强")
    print(f"  ✓ 代码简洁清晰")

if __name__ == "__main__":
    test_simplified_search()
