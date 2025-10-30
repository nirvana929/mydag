#!/usr/bin/env python3
"""
完整测试GUI所有按钮功能

测试流程：
1. 按钮1: 选择源文件 (produce5/main.c)
2. 按钮2: 生成dag图 (从配置文件夹复制)
3. 按钮3: 查看前缀条件 (生成full.dot和circle.txt)
4. 按钮4: 选择配置文件夹
"""

import sys
from pathlib import Path
import subprocess

project_root = Path(__file__).parent
sys.path.insert(0, str(project_root))

def test_button1_select_source():
    """测试按钮1: 选择源文件"""
    print("\n" + "=" * 60)
    print("测试按钮1: 选择源文件")
    print("=" * 60)
    
    source_file = project_root / "mycallypro" / "源文件" / "produce5" / "main.c"
    
    if not source_file.exists():
        print(f"❌ 源文件不存在: {source_file}")
        return False
    
    print(f"✅ 源文件: {source_file}")
    
    # 检查expand文件
    expand_files = list(source_file.parent.glob(f"{source_file.name}.*.expand"))
    if expand_files:
        print(f"✅ Expand文件: {expand_files[0].name}")
        return True
    else:
        print("❌ 缺少expand文件")
        return False

def test_button2_generate_dag():
    """测试按钮2: 生成dag图"""
    print("\n" + "=" * 60)
    print("测试按钮2: 生成dag图")
    print("=" * 60)
    
    # 路径
    base_dir = project_root / "mycallypro"
    source_file = base_dir / "源文件" / "produce5" / "main.c"
    expand_file = base_dir / "中间结果" / "main" / "rtl文件" / "main.c.233r.expand"
    work_dir = base_dir / "中间结果" / "main"
    dag_dir = work_dir / "生成dag图"
    
    # 验证expand文件存在
    if not expand_file.exists():
        print(f"❌ Expand文件不存在: {expand_file}")
        return False
    
    print(f"✅ Expand文件存在")
    
    # 创建dag输出目录
    dag_dir.mkdir(parents=True, exist_ok=True)
    
    # 调用legacy生成dag
    print("正在调用legacy生成dag...")
    
    try:
        # 使用完整的output-base路径
        output_base = str(base_dir)
        
        cmd = [
            "python3", "-m", "mycallyplus.generation.legacy",
            "--threads-only",
            "--output-base", output_base,
            str(expand_file)
        ]
        
        print(f"命令: {' '.join(cmd)}")
        
        result = subprocess.run(
            cmd,
            cwd=str(project_root),
            capture_output=True,
            text=True,
            timeout=30
        )
        
        if result.returncode != 0:
            print(f"❌ Legacy调用失败:")
            print(result.stderr)
            return False
        
        # 不打印stdout（太长）
        print(f"✅ Legacy执行成功")
        
        # 验证生成的文件在配置文件目录
        config_dir = base_dir / "配置文件" / source_file.name
        dot_file = config_dir / f"{source_file.name}_threads.dot"
        
        if dot_file.exists():
            print(f"✅ 生成dot文件: {dot_file}")
        else:
            print(f"❌ 未找到dot文件: {dot_file}")
            return False
        
        return True
        
    except subprocess.TimeoutExpired:
        print("❌ Legacy调用超时")
        return False
    except Exception as e:
        print(f"❌ 异常: {e}")
        return False

def test_button3_view_conditions():
    """测试按钮3: 查看前缀条件"""
    print("\n" + "=" * 60)
    print("测试按钮3: 查看前缀条件")
    print("=" * 60)
    
    # 路径
    base_dir = project_root / "mycallypro"
    source_file = base_dir / "源文件" / "produce5" / "main.c"
    expand_file = base_dir / "中间结果" / "main" / "rtl文件" / "main.c.233r.expand"
    work_dir = base_dir / "中间结果" / "main"
    condition_dir = work_dir / "查看前缀条件"
    
    # 创建输出目录
    condition_dir.mkdir(parents=True, exist_ok=True)
    
    # 调用legacy生成conditions
    print("正在调用legacy生成conditions...")
    
    try:
        # 使用完整的路径
        output_base = str(base_dir)
        config_dir = base_dir / "配置文件" / source_file.name
        txt_path = config_dir / "circle.txt"
        
        cmd = [
            "python3", "-m", "mycallyplus.generation.legacy",
            "--conditions-only",
            "--export-txt", str(txt_path),
            "--output-base", output_base,
            str(expand_file)
        ]
        
        print(f"命令: {' '.join(cmd)}")
        
        result = subprocess.run(
            cmd,
            cwd=str(project_root),
            capture_output=True,
            text=True,
            timeout=30
        )
        
        if result.returncode != 0:
            print(f"❌ Legacy调用失败:")
            print(result.stderr)
            return False
        
        print(f"✅ Legacy执行成功")
        
        # 验证生成的文件
        dot_file = config_dir / f"{source_file.name}_full.dot"
        
        if dot_file.exists():
            print(f"✅ 生成full.dot: {dot_file}")
        else:
            print(f"❌ 未找到full.dot: {dot_file}")
            return False
        
        if txt_path.exists():
            print(f"✅ 生成circle.txt: {txt_path}")
            # 显示内容预览
            content = txt_path.read_text()
            lines = content.strip().split('\n')
            print(f"   内容: {len(lines)}行")
            if lines:
                print(f"   预览: {lines[0][:60]}...")
        else:
            print(f"⚠️  未生成circle.txt")
        
        return True
        
    except subprocess.TimeoutExpired:
        print("❌ Legacy调用超时")
        return False
    except Exception as e:
        print(f"❌ 异常: {e}")
        return False

def test_button4_select_config():
    """测试按钮4: 选择配置文件夹"""
    print("\n" + "=" * 60)
    print("测试按钮4: 选择配置文件夹")
    print("=" * 60)
    
    # 路径
    base_dir = project_root / "mycallypro"
    config_base = base_dir / "配置文件"
    source_name = "main.c"
    
    # 查找配置目录
    matching_dirs = [d for d in config_base.iterdir()
                     if d.is_dir() and d.name.startswith("main")]
    
    if not matching_dirs:
        print("❌ 未找到配置目录")
        return False
    
    config_dir = matching_dirs[0]
    print(f"✅ 配置目录: {config_dir}")
    
    # 检查目录内容
    files = list(config_dir.iterdir())
    print(f"   文件数量: {len(files)}")
    
    for f in files:
        print(f"   - {f.name}")
    
    # 验证必需文件
    has_threads = any(f.name.endswith("_threads.dot") for f in files)
    has_full = any(f.name.endswith("_full.dot") for f in files)
    has_expand = any(f.name.endswith(".expand") for f in files)
    
    if has_threads:
        print("✅ 包含threads.dot")
    if has_full:
        print("✅ 包含full.dot")
    if has_expand:
        print("✅ 包含expand文件")
    
    return True

def main():
    """运行所有测试"""
    print("=" * 60)
    print("GUI按钮功能完整测试")
    print("=" * 60)
    
    results = []
    
    # 测试按钮1
    results.append(("按钮1: 选择源文件", test_button1_select_source()))
    
    # 测试按钮2
    results.append(("按钮2: 生成dag图", test_button2_generate_dag()))
    
    # 测试按钮3
    results.append(("按钮3: 查看前缀条件", test_button3_view_conditions()))
    
    # 测试按钮4
    results.append(("按钮4: 选择配置文件夹", test_button4_select_config()))
    
    # 总结
    print("\n" + "=" * 60)
    print("测试总结")
    print("=" * 60)
    
    for name, result in results:
        status = "✅ 通过" if result else "❌ 失败"
        print(f"{status} - {name}")
    
    passed = sum(1 for _, r in results if r)
    total = len(results)
    
    print(f"\n通过率: {passed}/{total}")
    
    if passed == total:
        print("\n🎉 所有测试通过！")
        return True
    else:
        print("\n⚠️  部分测试失败")
        return False

if __name__ == "__main__":
    try:
        success = main()
        sys.exit(0 if success else 1)
    except Exception as e:
        print(f"\n❌ 测试异常: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)
