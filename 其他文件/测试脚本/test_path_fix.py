#!/usr/bin/env python3
"""测试路径修复是否正确"""

from pathlib import Path
import subprocess
import sys

def test_path_calculation():
    """测试路径计算逻辑"""
    print("=" * 60)
    print("测试路径计算逻辑")
    print("=" * 60)
    
    # 模拟实际场景
    base_dir = Path("/home/chove/桌面/cally/mycallyplus/中间结果/main")
    expand_path = base_dir / "rtl文件" / "main.c.233r.expand"
    
    print(f"\nbase_dir: {base_dir}")
    print(f"expand_path: {expand_path}")
    print(f"expand_path.stem: {expand_path.stem}")
    
    # 计算 base_for_legacy
    expand_name = expand_path.stem  # "main.c.233r"
    if expand_name.endswith('.233r'):
        base_for_legacy = expand_name[:-5]  # 移除 ".233r"（5个字符）
    else:
        base_for_legacy = expand_name
    
    print(f"\nexpand_name: {expand_name}")
    print(f"base_for_legacy: {base_for_legacy}")
    
    # 计算预期的legacy输出路径
    mycallyplus_root = base_dir.parent.parent  # 回退2层
    legacy_config_dir = mycallyplus_root / "generation" / "配置文件" / base_for_legacy
    print(f"\n预期的legacy输出路径:")
    print(f"  {legacy_config_dir}")
    
    # 检查实际文件
    print(f"\n实际文件检查:")
    if legacy_config_dir.exists():
        print(f"  ✓ 目录存在")
        files = list(legacy_config_dir.glob("*"))
        print(f"  文件列表:")
        for f in files:
            print(f"    - {f.name} ({f.stat().st_size} bytes)")
    else:
        print(f"  ✗ 目录不存在")
        
        # 尝试查找实际位置
        search_base = Path("/home/chove/桌面/cally")
        print(f"\n  尝试查找实际位置...")
        import subprocess
        result = subprocess.run(
            ["find", str(search_base), "-name", "配置文件", "-type", "d"],
            capture_output=True,
            text=True
        )
        if result.returncode == 0:
            dirs = result.stdout.strip().split('\n')
            print(f"  找到 {len(dirs)} 个'配置文件'目录:")
            for d in dirs:
                print(f"    - {d}")

if __name__ == "__main__":
    test_path_calculation()
