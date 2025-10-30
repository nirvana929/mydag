#!/usr/bin/env python3
"""
测试debug文件生成路径
"""

import subprocess
import sys
from pathlib import Path

def test_debug_paths():
    """测试debug文件生成路径"""
    print("=== 测试debug文件生成路径 ===")
    
    # 测试文件
    expand_file = Path("mycallypro/test/produce/produce.c.233r.expand")
    debug_dir = expand_file.parent / "debug"
    
    print(f"输入文件: {expand_file}")
    print(f"期望debug目录: {debug_dir}")
    
    # 清理之前的debug文件
    if debug_dir.exists():
        import shutil
        shutil.rmtree(debug_dir)
        print("已清理之前的debug文件")
    
    # 测试线程视图
    print("\n1. 测试线程视图debug文件生成")
    try:
        result = subprocess.run([
            sys.executable, "-m", "mycallypro", "--threads-only", str(expand_file)
        ], capture_output=True, text=True, check=True)
        
        if debug_dir.exists():
            debug_files = list(debug_dir.glob("*"))
            print(f"✅ debug目录已创建: {debug_dir}")
            print(f"✅ 生成了 {len(debug_files)} 个debug文件")
            for f in debug_files:
                print(f"   - {f.name}")
        else:
            print(f"❌ debug目录未创建: {debug_dir}")
            return False
            
    except subprocess.CalledProcessError as e:
        print(f"❌ 线程视图测试失败: {e}")
        return False
    
    # 测试完整视图
    print("\n2. 测试完整视图debug文件生成")
    try:
        result = subprocess.run([
            sys.executable, "-m", "mycallypro", str(expand_file)
        ], capture_output=True, text=True, check=True)
        
        debug_files = list(debug_dir.glob("*"))
        print(f"✅ 生成了 {len(debug_files)} 个debug文件")
        
        # 检查是否有新的debug文件
        new_files = [f for f in debug_files if "full" in f.name]
        if new_files:
            print(f"✅ 包含完整视图debug文件: {[f.name for f in new_files]}")
        else:
            print("⚠️ 未找到完整视图debug文件")
            
    except subprocess.CalledProcessError as e:
        print(f"❌ 完整视图测试失败: {e}")
        return False
    
    return True

def main():
    """主测试函数"""
    print("开始测试debug文件生成路径...")
    
    if test_debug_paths():
        print("\n" + "="*50)
        print("✅ 所有测试通过！")
        print("\ndebug文件生成规则：")
        print("- debug文件夹生成在输入文件所在目录下")
        print("- 例如：mycallypro/test/produce/produce.c.233r.expand")
        print("- debug文件夹：mycallypro/test/produce/debug/")
    else:
        print("\n❌ 测试失败，请检查错误信息")
        return 1
    
    return 0

if __name__ == "__main__":
    sys.exit(main())
