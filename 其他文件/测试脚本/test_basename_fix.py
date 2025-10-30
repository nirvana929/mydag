#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
测试 base_name 提取修复
"""

import sys
from pathlib import Path

# 添加项目路径
project_root = Path(__file__).parent
sys.path.insert(0, str(project_root))

from mycallyplus.ui.gui import MycallyplusGUI

def test_get_base_name():
    """测试 _get_base_name 方法"""
    print("=" * 70)
    print("测试 _get_base_name 方法")
    print("=" * 70)
    
    import tkinter as tk
    root = tk.Tk()
    root.withdraw()
    
    try:
        gui = MycallyplusGUI(root)
        
        # 测试用例
        test_cases = [
            ("main.c.233r.expand", "main"),
            ("test.c.233r.expand", "test"),
            ("program.expand", "program"),
            ("simple.c.expand", "simple"),
            ("complex.c.233r.expand", "complex"),
        ]
        
        print("\n测试用例:")
        print("-" * 70)
        all_passed = True
        
        for filename, expected in test_cases:
            test_path = Path(f"/tmp/{filename}")
            result = gui._get_base_name(test_path)
            status = "✓" if result == expected else "✗"
            
            if result != expected:
                all_passed = False
                
            print(f"{status} {filename:30s} -> {result:15s} (期望: {expected})")
        
        if all_passed:
            print("\n🎉 所有测试通过！")
            return 0
        else:
            print("\n⚠️  有测试失败")
            return 1
            
    finally:
        root.destroy()

if __name__ == "__main__":
    sys.exit(test_get_base_name())
