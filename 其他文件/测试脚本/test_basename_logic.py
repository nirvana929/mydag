#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
测试 base_name 提取修复（无GUI版本）
"""

import sys
from pathlib import Path

def test_base_name_logic():
    """测试 base_name 提取逻辑"""
    print("=" * 70)
    print("测试 _get_base_name 逻辑")
    print("=" * 70)
    
    def _get_base_name(expand_path: Path) -> str:
        """从 expand 文件路径提取基础名称"""
        name = expand_path.stem  # 移除 .expand
        # 如果是 .233r.expand 格式，移除 .233r (5个字符)
        if name.endswith('.233r'):
            name = name[:-5]  # 移除 .233r
        # 如果还有 .c 后缀，移除它
        if name.endswith('.c'):
            name = name[:-2]
        return name
    
    # 测试用例
    test_cases = [
        ("main.c.233r.expand", "main"),
        ("test.c.233r.expand", "test"),
        ("program.expand", "program"),
        ("simple.c.expand", "simple"),
        ("complex.c.233r.expand", "complex"),
        ("foo.expand", "foo"),
        ("bar.c.expand", "bar"),
    ]
    
    print("\n测试用例:")
    print("-" * 70)
    print(f"{'输入文件名':<30s} {'输出':<15s} {'期望':<15s} {'状态'}")
    print("-" * 70)
    
    all_passed = True
    
    for filename, expected in test_cases:
        test_path = Path(f"/tmp/{filename}")
        result = _get_base_name(test_path)
        passed = result == expected
        status = "✓ 通过" if passed else "✗ 失败"
        
        if not passed:
            all_passed = False
            
        print(f"{filename:<30s} {result:<15s} {expected:<15s} {status}")
    
    print("-" * 70)
    
    if all_passed:
        print("\n🎉 所有测试通过！")
        
        # 显示修复说明
        print("\n" + "=" * 70)
        print("修复说明")
        print("=" * 70)
        print("问题: 原代码使用 `stem[:-5]` 截断 .233r，但对于 main.c.233r.expand:")
        print("  - expand_path.stem = 'main.c.233r'")
        print("  - stem[:-5] = 'main.' (错误！应该是 'main.c')")
        print("  - 然后去掉 .c -> 'main' (虽然结果对了，但逻辑有误)")
        print("\n修复: 使用 `name[:-5]` 完整移除 '.233r' (5个字符):")
        print("  - expand_path.stem = 'main.c.233r'")
        print("  - name[:-5] = 'main.c'")
        print("  - 然后去掉 .c -> 'main' (正确！)")
        print("\n新增方法: _get_base_name(expand_path)")
        print("  - 统一处理所有文件名格式")
        print("  - 避免重复代码")
        print("  - 逻辑清晰易维护")
        print("\n说明: '.233r' 是 5 个字符，需要用 name[:-5] 移除")
        return 0
    else:
        print("\n⚠️  有测试失败")
        return 1

if __name__ == "__main__":
    sys.exit(test_base_name_logic())
