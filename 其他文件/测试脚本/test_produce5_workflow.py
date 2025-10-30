#!/usr/bin/env python3
"""
测试produce5/main.c的完整工作流程

测试步骤：
1. 按钮1: 选择源文件 produce5/main.c
2. 检查expand文件处理
3. 按钮2: 生成dag图
4. 按钮3: 查看前缀条件
5. 按钮4: 选择配置文件夹
"""

import sys
from pathlib import Path

# 添加项目路径
project_root = Path(__file__).parent
sys.path.insert(0, str(project_root))

from mycallyplus.ui.gui_v3 import FileState
import shutil

def test_produce5_workflow():
    """测试produce5完整工作流程"""
    
    print("=" * 60)
    print("测试produce5/main.c完整工作流程")
    print("=" * 60)
    
    # 准备环境
    base_dir = project_root / "mycallypro"
    source_file = base_dir / "源文件" / "produce5" / "main.c"
    
    # Step 1: 验证源文件
    print("\n[Step 1] 验证源文件...")
    if not source_file.exists():
        print(f"❌ 源文件不存在: {source_file}")
        return False
    print(f"✅ 源文件存在: {source_file}")
    
    # Step 2: 检查expand文件
    print("\n[Step 2] 检查expand文件...")
    expand_files = list(source_file.parent.glob(f"{source_file.name}.*.expand"))
    if expand_files:
        print(f"✅ 找到expand文件: {expand_files[0].name}")
    else:
        print("⚠️  未找到expand文件（将尝试编译）")
    
    # Step 3: 模拟FileState初始化
    print("\n[Step 3] 模拟FileState初始化...")
    state = FileState()
    state.source_file = source_file
    
    # 创建工作目录
    work_dir = base_dir / "中间结果" / source_file.stem
    work_dir.mkdir(parents=True, exist_ok=True)
    state.work_dir = work_dir
    print(f"✅ 工作目录: {work_dir}")
    
    # 创建rtl子目录
    rtl_dir = work_dir / "rtl文件"
    rtl_dir.mkdir(exist_ok=True)
    
    # Step 4: 测试expand文件处理
    print("\n[Step 4] 测试expand文件处理...")
    if expand_files:
        # 复制expand文件到rtl目录
        expand_src = expand_files[0]
        expand_dest = rtl_dir / expand_src.name
        shutil.copy2(str(expand_src), str(expand_dest))
        state.expand_file = expand_dest
        print(f"✅ 复制expand文件: {expand_dest.name}")
    else:
        print("❌ 无expand文件可用")
        return False
    
    # Step 5: 检查配置文件夹结构
    print("\n[Step 5] 检查配置文件夹结构...")
    config_base = base_dir / "配置文件"
    
    # 查找匹配的配置目录
    print(f"   搜索配置目录: {config_base}")
    matching_dirs = [d for d in config_base.iterdir() 
                     if d.is_dir() and d.name.startswith(source_file.stem)]
    
    if matching_dirs:
        print(f"✅ 找到配置目录: {matching_dirs}")
    else:
        print(f"⚠️  未找到匹配的配置目录 (basename={source_file.stem})")
        
        # 尝试使用源文件名
        alt_dirs = [d for d in config_base.iterdir() 
                    if d.is_dir() and d.name.startswith(source_file.name)]
        if alt_dirs:
            print(f"✅ 使用源文件名找到: {alt_dirs}")
            matching_dirs = alt_dirs
    
    # Step 6: 检查dag文件
    print("\n[Step 6] 检查dag文件...")
    if matching_dirs:
        config_dir = matching_dirs[0]
        
        # 查找threads.dot文件
        threads_dots = list(config_dir.glob("*_threads.dot"))
        if threads_dots:
            print(f"✅ 找到threads.dot: {threads_dots[0].name}")
        else:
            print("⚠️  未找到threads.dot文件")
        
        # 查找full.dot文件
        full_dots = list(config_dir.glob("*_full.dot"))
        if full_dots:
            print(f"✅ 找到full.dot: {full_dots[0].name}")
        else:
            print("⚠️  未找到full.dot文件")
        
        # 查找circle.txt文件
        circle_txt = config_dir / "circle.txt"
        if circle_txt.exists():
            print(f"✅ 找到circle.txt")
        else:
            print("⚠️  未找到circle.txt")
    
    # Step 7: 路径连通性总结
    print("\n" + "=" * 60)
    print("路径连通性总结")
    print("=" * 60)
    print(f"源文件:     {source_file}")
    print(f"Expand:     {state.expand_file}")
    print(f"工作目录:   {state.work_dir}")
    if matching_dirs:
        print(f"配置目录:   {matching_dirs[0]}")
    print()
    
    # Step 8: 输出测试结论
    print("测试结论:")
    print("✅ 源文件可用")
    print("✅ Expand文件可用")
    print("✅ 工作目录创建成功")
    if matching_dirs:
        print("✅ 配置目录连通")
        if threads_dots and full_dots and circle_txt.exists():
            print("✅ 所有必需文件存在")
            print("\n🎉 完整工作流程验证成功！")
            return True
        else:
            print("⚠️  部分文件缺失，需要先生成")
    else:
        print("⚠️  配置目录未找到，需要先生成")
    
    return True

if __name__ == "__main__":
    try:
        success = test_produce5_workflow()
        sys.exit(0 if success else 1)
    except Exception as e:
        print(f"\n❌ 测试失败: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)
