#!/usr/bin/env python3
"""测试GUI各功能的路径互通性"""

import sys
from pathlib import Path
import subprocess

# 添加项目路径
sys.path.insert(0, str(Path(__file__).parent))

def test_paths():
    """测试所有路径"""
    print("=" * 80)
    print("测试 Mycallyplus v3.2 各功能路径互通性")
    print("=" * 80)
    
    # 基础路径
    base_dir = Path("/home/chove/桌面/cally/mycallypro")
    
    # 查找可用的测试文件
    possible_sources = [
        Path("/home/chove/桌面/cally/mycallypro/test/main/main.c"),
        Path("/home/chove/桌面/cally/mycallypro/源文件/produce5/main.c"),
        Path("/home/chove/桌面/cally/images/test/main.c"),
    ]
    
    test_source = None
    for src in possible_sources:
        if src.exists():
            test_source = src
            break
    
    if not test_source:
        print(f"\n❌ 未找到测试源文件")
        print("尝试查找的路径:")
        for src in possible_sources:
            print(f"  - {src}")
        return False
    
    print(f"\n使用测试文件: {test_source}")
    print(f"工作目录: {base_dir}")
    
    # 模拟状态
    source_basename = test_source.stem  # main
    work_dir = base_dir / "中间结果" / source_basename
    
    print(f"\n" + "=" * 80)
    print("路径1: 选择源文件 - 编译生成expand")
    print("=" * 80)
    
    rtl_dir = work_dir / "rtl文件"
    print(f"\nRTL目录: {rtl_dir}")
    print(f"目录存在: {rtl_dir.exists()}")
    
    # 查找expand文件
    if rtl_dir.exists():
        expand_files = list(rtl_dir.glob("*.expand"))
        if expand_files:
            print(f"✓ 找到expand文件:")
            for f in expand_files:
                print(f"  - {f.name}")
            expand_file = expand_files[0]
        else:
            print(f"✗ 未找到expand文件")
            expand_file = None
    else:
        print(f"✗ RTL目录不存在")
        expand_file = None
    
    print(f"\n" + "=" * 80)
    print("路径2: 生成dag图 - Legacy配置文件目录")
    print("=" * 80)
    
    config_base = base_dir / "配置文件"
    print(f"\n配置基础目录: {config_base}")
    print(f"目录存在: {config_base.exists()}")
    
    # 查找配置目录
    config_dir = None
    if config_base.exists():
        print(f"\n扫描配置目录:")
        for subdir in config_base.iterdir():
            if subdir.is_dir():
                match = subdir.name.startswith(source_basename)
                status = "✓" if match else " "
                print(f"  [{status}] {subdir.name}")
                if match and not config_dir:
                    config_dir = subdir
    
    if config_dir:
        print(f"\n✓ 找到配置目录: {config_dir.name}")
        
        # 查找threads.dot
        threads_dots = list(config_dir.glob("*_threads.dot"))
        if threads_dots:
            print(f"  ✓ threads.dot: {threads_dots[0].name}")
        else:
            print(f"  ✗ threads.dot: 未找到")
        
        # 查找full.dot
        full_dots = list(config_dir.glob("*_full.dot"))
        if full_dots:
            print(f"  ✓ full.dot: {full_dots[0].name}")
        else:
            print(f"  ✗ full.dot: 未找到")
        
        # 查找circle.txt
        circle_txt = config_dir / "circle.txt"
        if circle_txt.exists():
            print(f"  ✓ circle.txt: 存在 ({circle_txt.stat().st_size} bytes)")
        else:
            print(f"  ✗ circle.txt: 未找到")
    else:
        print(f"\n✗ 未找到配置目录")
    
    print(f"\n" + "=" * 80)
    print("路径3: 中间结果目录 - GUI工作区")
    print("=" * 80)
    
    print(f"\n工作目录: {work_dir}")
    print(f"目录存在: {work_dir.exists()}")
    
    if work_dir.exists():
        subdirs = [
            "rtl文件",
            "配置文件",
            "生成dag图",
            "查看条件节点",
            "查看互斥锁图",
            "生成信号量图",
            "debug",
            "images",
            "logs",
            "temp"
        ]
        
        print(f"\n子目录检查:")
        for subdir_name in subdirs:
            subdir = work_dir / subdir_name
            exists = subdir.exists()
            status = "✓" if exists else "✗"
            
            # 检查是否有文件
            file_count = 0
            if exists and subdir.is_dir():
                files = list(subdir.iterdir())
                file_count = len(files)
            
            print(f"  [{status}] {subdir_name:20s} {'(' + str(file_count) + ' 文件)' if file_count > 0 else ''}")
    else:
        print(f"✗ 工作目录不存在")
    
    print(f"\n" + "=" * 80)
    print("路径4: 文件复制流程测试")
    print("=" * 80)
    
    # 测试从配置文件到中间结果的复制路径
    if config_dir:
        threads_source = list(config_dir.glob("*_threads.dot"))
        if threads_source:
            source_file = threads_source[0]
            target_dir = work_dir / "生成dag图"
            target_file = target_dir / "dag.dot"
            
            print(f"\n复制路径测试:")
            print(f"  源文件: {source_file}")
            print(f"  源文件存在: {source_file.exists()}")
            print(f"  目标目录: {target_dir}")
            print(f"  目标目录存在: {target_dir.exists()}")
            
            if target_file.exists():
                print(f"  ✓ 目标文件已存在: {target_file.name}")
            else:
                print(f"  ✗ 目标文件不存在: {target_file.name}")
    
    print(f"\n" + "=" * 80)
    print("路径5: Legacy命令测试")
    print("=" * 80)
    
    if expand_file and expand_file.exists():
        print(f"\n测试Legacy调用路径:")
        print(f"  Expand文件: {expand_file}")
        print(f"  Output base: {base_dir}")
        
        # 构造命令
        cmd = [
            sys.executable,
            "-m", "mycallyplus.generation.legacy",
            str(expand_file),
            "--threads-only",
            "--output-base", str(base_dir)
        ]
        
        print(f"\n命令: {' '.join(cmd)}")
        print(f"\n执行目录: {base_dir.parent}")
        
        # 检查命令是否可执行
        try:
            result = subprocess.run(
                [sys.executable, "-m", "mycallyplus.generation.legacy", "--help"],
                capture_output=True,
                text=True,
                timeout=5
            )
            if result.returncode == 0 or "usage" in result.stdout.lower() or "usage" in result.stderr.lower():
                print(f"✓ Legacy模块可访问")
            else:
                print(f"✗ Legacy模块访问异常")
        except Exception as e:
            print(f"✗ Legacy模块测试失败: {e}")
    else:
        print(f"\n✗ 无expand文件，跳过Legacy测试")
    
    print(f"\n" + "=" * 80)
    print("总结")
    print("=" * 80)
    
    issues = []
    
    if not rtl_dir.exists():
        issues.append("RTL目录不存在")
    elif not expand_file:
        issues.append("Expand文件未生成")
    
    if not config_dir:
        issues.append("Legacy配置目录未找到")
    
    if not work_dir.exists():
        issues.append("中间结果工作目录不存在")
    
    if issues:
        print(f"\n发现问题:")
        for i, issue in enumerate(issues, 1):
            print(f"  {i}. {issue}")
    else:
        print(f"\n✓ 所有路径检查通过！")
    
    return len(issues) == 0

if __name__ == "__main__":
    success = test_paths()
    sys.exit(0 if success else 1)
