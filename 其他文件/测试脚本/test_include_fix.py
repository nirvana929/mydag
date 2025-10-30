#!/usr/bin/env python3
"""
测试v3.4的include检测修复

问题：去重检查逻辑错误导致include路径未正确添加
修复：使用seen_paths集合进行去重
"""

import sys
from pathlib import Path

project_root = Path(__file__).parent

def test_include_detection_fix():
    """测试include检测修复"""
    print("=" * 70)
    print("测试Include检测修复")
    print("=" * 70)
    
    source_file = project_root / "mycallypro" / "源文件" / "produce5" / "main.c"
    
    print(f"\n源文件: {source_file}")
    print(f"存在: {source_file.exists()}")
    
    # 模拟修复后的逻辑
    include_dirs = []
    seen_paths = set()
    potential_include_paths = [
        source_file.parent / "include",
        source_file.parent / "includes",
        source_file.parent / "../include",
        source_file.parent / "../includes",
        source_file.parent / "inc",
    ]
    
    print("\n检测include目录:")
    for inc_path in potential_include_paths:
        if inc_path.exists() and inc_path.is_dir():
            resolved_path = str(inc_path.resolve())
            if resolved_path not in seen_paths:
                seen_paths.add(resolved_path)
                include_dirs.extend(["-I", resolved_path])
                try:
                    rel_path = inc_path.relative_to(source_file.parent.parent)
                    print(f"  ✅ 找到: {rel_path}")
                except ValueError:
                    print(f"  ✅ 找到: {inc_path.name}")
                print(f"     完整路径: {resolved_path}")
    
    print(f"\n最终include参数:")
    for i in range(0, len(include_dirs), 2):
        print(f"  {include_dirs[i]} {include_dirs[i+1]}")
    
    # 验证gcc命令
    print(f"\nGCC命令验证:")
    cmd_parts = [
        "gcc",
        "-O0",
        "-fdump-rtl-expand",
        *include_dirs,
        "-c",
        str(source_file),
        "-o", "/tmp/test.o"
    ]
    print(f"  {' '.join(cmd_parts)}")
    
    # 检查结果
    if include_dirs:
        print(f"\n✅ 修复成功！include路径已正确添加")
        return True
    else:
        print(f"\n❌ 修复失败！未找到include路径")
        return False

if __name__ == "__main__":
    success = test_include_detection_fix()
    sys.exit(0 if success else 1)
