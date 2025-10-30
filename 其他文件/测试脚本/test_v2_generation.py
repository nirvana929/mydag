#!/usr/bin/env python3
"""测试mycallyplus v2.0自动生成功能"""

import sys
from pathlib import Path

# 添加项目路径
sys.path.insert(0, str(Path(__file__).parent))

from mycallyplus.ui.gui import MycallyplusGUI
import tkinter as tk

def test_auto_generation():
    """测试自动生成功能（不显示GUI）"""
    # 创建虚拟的root窗口
    root = tk.Tk()
    root.withdraw()  # 隐藏主窗口
    
    # 创建GUI实例
    app = MycallyplusGUI(root)
    
    # 设置测试文件路径
    test_file = Path("/home/chove/桌面/cally/mycallypro/test/main/main.c")
    
    if not test_file.exists():
        print(f"❌ 测试文件不存在: {test_file}")
        return False
    
    print(f"✓ 使用测试文件: {test_file}")
    print("=" * 60)
    
    # 调用处理流程（不通过文件对话框）
    try:
        app._process_source_file(test_file)
        
        # 检查结果
        print("\n" + "=" * 60)
        print("生成结果:")
        print(f"  - 工作目录: {app.current_work_dir}")
        print(f"  - expand文件: {app.current_expand_path}")
        print(f"  - circle.txt: {app.current_circle_path}")
        
        if app.generation_errors:
            print(f"\n⚠️ 发现 {len(app.generation_errors)} 个错误:")
            for err in app.generation_errors:
                print(f"  {err}")
        else:
            print("\n✅ 所有步骤成功!")
        
        return len(app.generation_errors) == 0
        
    except Exception as e:
        print(f"\n❌ 处理失败: {e}")
        import traceback
        traceback.print_exc()
        return False
    finally:
        root.destroy()

if __name__ == "__main__":
    success = test_auto_generation()
    sys.exit(0 if success else 1)
