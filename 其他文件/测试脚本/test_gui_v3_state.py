#!/usr/bin/env python3
"""测试GUI v3的文件状态逻辑"""

from pathlib import Path
import sys

# 添加项目路径
sys.path.insert(0, str(Path(__file__).parent))

from mycallyplus.ui.gui_v3 import FileState

def test_file_state():
    """测试FileState类"""
    print("=" * 60)
    print("测试FileState类")
    print("=" * 60)
    
    state = FileState()
    
    # 测试1: 初始状态
    print("\n[测试1] 初始状态:")
    print(f"  source_file: {state.source_file}")
    print(f"  expand_file: {state.expand_file}")
    print(f"  dot_file: {state.dot_file}")
    print(f"  txt_file: {state.txt_file}")
    print(f"  base_name: {state.get_base_name()}")
    
    # 测试2: 设置expand文件
    print("\n[测试2] 设置expand文件:")
    state.expand_file = Path("/home/chove/桌面/cally/mycallypro/中间结果/main/rtl文件/main.c.233r.expand")
    print(f"  expand_file: {state.expand_file.name}")
    print(f"  base_name: {state.get_base_name()}")
    
    # 测试3: 设置dot文件
    print("\n[测试3] 设置dot文件:")
    state.dot_file = Path("/home/chove/桌面/cally/mycallypro/中间结果/main/生成dag图/dag.dot")
    print(f"  dot_file: {state.dot_file.name}")
    
    # 测试4: 替换dot文件
    print("\n[测试4] 替换dot文件:")
    state.dot_file = Path("/home/chove/桌面/cally/mycallypro/中间结果/main/查看条件节点/conditions.dot")
    print(f"  dot_file: {state.dot_file.name}")
    print(f"  （新的替换了旧的）")
    
    # 测试5: 清空状态
    print("\n[测试5] 清空状态:")
    state.clear()
    print(f"  source_file: {state.source_file}")
    print(f"  expand_file: {state.expand_file}")
    print(f"  dot_file: {state.dot_file}")
    print(f"  txt_file: {state.txt_file}")
    
    print("\n" + "=" * 60)
    print("测试完成!")
    print("=" * 60)

if __name__ == "__main__":
    test_file_state()
