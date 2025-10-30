#!/usr/bin/env python3
"""
测试配置文件生成功能
模拟GUI按钮点击，验证所有文件是否正确存储
"""

import sys
import subprocess
from pathlib import Path

def test_config_generation():
    """测试配置文件生成"""
    
    # 测试参数
    expand_file = "mycallypro/test/produce/produce.c.233r.expand"
    source_file = "mycallypro/中间结果文件/produce/produce.c"
    
    print("=" * 60)
    print("测试配置文件生成功能")
    print("=" * 60)
    
    # 配置文件将生成在mycallypro/配置文件/目录下
    config_dir = Path("/home/chove/桌面/cally/mycallypro/配置文件/produce.c")
    if config_dir.exists():
        import shutil
        shutil.rmtree(config_dir)
        print(f"✓ 已清理旧的配置目录: {config_dir}")
    
    # 运行mycallypro生成配置文件（不指定output-base，默认使用mycallypro目录）
    cmd = [
        sys.executable, "-m", "mycallypro",
        expand_file,
        "--export-txt", "circle.txt",
        "--source-file", source_file,
        "--debug"
    ]
    
    print(f"\n执行命令:")
    print(f"  {' '.join(cmd)}\n")
    
    result = subprocess.run(
        cmd,
        capture_output=True,
        text=True,
        cwd="/home/chove/桌面/cally"
    )
    
    # 检查执行结果
    if result.returncode != 0:
        print("✗ 命令执行失败!")
        print(result.stderr)
        return False
    
    # 验证目录结构
    print("验证生成的文件:")
    print("-" * 60)
    
    expected_structure = {
        "circle.txt": "配置文件（根目录）",
        "source/produce.c": "源代码文件",
        "expand/produce.c.233r.expand": "GCC expand文件",
        "dot/dag.dot": "DOT图文件",
        "images": "图片目录（待生成PNG）",
        "debug": "调试文件目录"
    }
    
    all_ok = True
    for file_path, description in expected_structure.items():
        full_path = config_dir / file_path
        if full_path.exists():
            if full_path.is_file():
                size = full_path.stat().st_size
                print(f"✓ {file_path:<35} ({size} bytes) - {description}")
            else:
                print(f"✓ {file_path:<35} (目录) - {description}")
        else:
            print(f"✗ {file_path:<35} 缺失! - {description}")
            all_ok = False
    
    # 验证circle.txt内容
    print("\n验证 circle.txt 内容:")
    print("-" * 60)
    circle_txt = config_dir / "circle.txt"
    if circle_txt.exists():
        lines = circle_txt.read_text(encoding='utf-8').strip().split('\n')
        print(f"总行数: {len(lines)}")
        print(f"前3行内容:")
        for i, line in enumerate(lines[:3], 1):
            parts = line.split()
            if len(parts) == 5:
                print(f"  {i}. ✓ {line} (5列)")
            elif i == 1 and parts == ['互斥量']:
                print(f"  {i}. ✓ {line} (标题行)")
            else:
                print(f"  {i}. ✗ {line} (格式错误)")
                all_ok = False
    
    # 显示目录树
    print("\n完整目录结构:")
    print("-" * 60)
    try:
        tree_result = subprocess.run(
            ["tree", str(config_dir)],
            capture_output=True,
            text=True
        )
        print(tree_result.stdout)
    except FileNotFoundError:
        # tree命令不存在，使用简单列表
        for root, dirs, files in config_dir.rglob("*"):
            level = len(root.relative_to(config_dir).parts)
            indent = "  " * level
            print(f"{indent}{root.name}/")
            for file in files:
                print(f"{indent}  {file}")
    
    print("\n" + "=" * 60)
    if all_ok:
        print("✓ 所有测试通过！配置文件已正确生成并存储。")
    else:
        print("✗ 部分测试失败，请检查上述错误。")
    print("=" * 60)
    
    return all_ok

if __name__ == "__main__":
    success = test_config_generation()
    sys.exit(0 if success else 1)
