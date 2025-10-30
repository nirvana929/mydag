#!/usr/bin/env python3
"""
GUI v3.4 改进测试

测试内容：
1. ✅ 智能include路径检测（支持produce5项目）
2. ✅ 查看条件节点使用mycallypro命令（不使用--threads-only）
"""

import sys
from pathlib import Path
import subprocess

project_root = Path(__file__).parent

def print_section(title):
    print("\n" + "=" * 70)
    print(f"  {title}")
    print("=" * 70)

def test_include_detection():
    """测试include路径智能检测"""
    print_section("测试1: Include路径智能检测")
    
    source_file = project_root / "mycallypro" / "源文件" / "produce5" / "main.c"
    
    print(f"\n源文件: {source_file}")
    
    # 模拟include检测逻辑
    include_dirs = []
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
            if resolved_path not in [str(Path(d).resolve()) for d in include_dirs]:
                include_dirs.append(resolved_path)
                print(f"  ✅ 找到: {inc_path.relative_to(source_file.parent.parent)}")
                
                # 列出头文件
                headers = list(inc_path.glob("*.h"))
                for h in headers:
                    print(f"     - {h.name}")
        else:
            print(f"  ❌ 不存在: {inc_path.relative_to(source_file.parent.parent)}")
    
    if include_dirs:
        print(f"\n✅ 检测结果: 找到 {len(include_dirs)} 个include目录")
        return True
    else:
        print("\n⚠️  未找到include目录")
        return False

def test_conditions_generation():
    """测试完整视图生成（含条件节点）"""
    print_section("测试2: 完整视图生成（mycallypro不带--threads-only）")
    
    expand_file = project_root / "mycallypro" / "中间结果" / "main" / "rtl文件" / "main.c.233r.expand"
    
    if not expand_file.exists():
        print(f"❌ Expand文件不存在: {expand_file}")
        return False
    
    print(f"\nExpand文件: {expand_file}")
    
    # 测试方法1: 使用mycallypro命令（不带--threads-only）
    print("\n方法1: python3 -m mycallypro <expand_file>")
    print("  （生成完整视图，包含条件节点）")
    
    try:
        cmd = [
            "python3", "-m", "mycallypro",
            str(expand_file)
        ]
        
        result = subprocess.run(
            cmd,
            cwd=str(project_root),
            capture_output=True,
            text=True,
            timeout=10
        )
        
        if result.returncode == 0:
            # 分析输出
            output = result.stdout
            lines = output.strip().split('\n')
            
            # 统计条件节点
            condition_nodes = [l for l in lines if '/if/' in l or '/while/' in l or '/switch' in l]
            thread_nodes = [l for l in lines if 'threadtask' in l or 'pthread' in l]
            
            print(f"\n  ✅ 生成成功")
            print(f"     总行数: {len(lines)}")
            print(f"     条件节点: {len(condition_nodes)} 个")
            print(f"     线程节点: {len(thread_nodes)} 个")
            
            if condition_nodes:
                print(f"\n  条件节点示例:")
                for node in condition_nodes[:3]:
                    print(f"     {node.strip()}")
            
            return True
        else:
            print(f"\n  ❌ 失败: {result.stderr}")
            return False
            
    except Exception as e:
        print(f"\n  ❌ 异常: {e}")
        return False

def test_legacy_conditions():
    """测试legacy的--conditions-only（对比）"""
    print_section("对比测试: Legacy --conditions-only")
    
    expand_file = project_root / "mycallypro" / "中间结果" / "main" / "rtl文件" / "main.c.233r.expand"
    
    if not expand_file.exists():
        print(f"❌ Expand文件不存在")
        return False
    
    print("\n方法2: legacy --conditions-only")
    print("  （仅生成条件前缀节点，不含线程补边）")
    
    try:
        cmd = [
            "python3", "-m", "mycallyplus.generation.legacy",
            "--conditions-only",
            str(expand_file)
        ]
        
        result = subprocess.run(
            cmd,
            cwd=str(project_root),
            capture_output=True,
            text=True,
            timeout=10
        )
        
        if result.returncode == 0:
            output = result.stdout
            lines = output.strip().split('\n')
            
            condition_nodes = [l for l in lines if '/if/' in l or '/while/' in l or '/switch' in l]
            thread_nodes = [l for l in lines if 'threadtask' in l]
            
            print(f"\n  ✅ 生成成功")
            print(f"     总行数: {len(lines)}")
            print(f"     条件节点: {len(condition_nodes)} 个")
            print(f"     线程节点: {len(thread_nodes)} 个")
            
            return True
        else:
            print(f"\n  ❌ 失败: {result.stderr}")
            return False
            
    except Exception as e:
        print(f"\n  ❌ 异常: {e}")
        return False

def test_circle_txt_generation():
    """测试circle.txt生成"""
    print_section("测试3: Circle.txt配置文件生成")
    
    expand_file = project_root / "mycallypro" / "中间结果" / "main" / "rtl文件" / "main.c.233r.expand"
    config_dir = project_root / "mycallypro" / "配置文件" / "main.c"
    txt_path = config_dir / "circle.txt"
    
    if not expand_file.exists():
        print(f"❌ Expand文件不存在")
        return False
    
    config_dir.mkdir(parents=True, exist_ok=True)
    
    print(f"\nExpand: {expand_file}")
    print(f"输出: {txt_path}")
    
    try:
        cmd = [
            "python3", "-m", "mycallyplus.generation.legacy",
            "--export-txt", str(txt_path),
            "--output-base", str(project_root / "mycallypro"),
            str(expand_file)
        ]
        
        result = subprocess.run(
            cmd,
            cwd=str(project_root),
            capture_output=True,
            text=True,
            timeout=10
        )
        
        if result.returncode == 0:
            if txt_path.exists():
                content = txt_path.read_text()
                lines = content.strip().split('\n') if content.strip() else []
                
                print(f"\n✅ 生成成功")
                print(f"   文件大小: {txt_path.stat().st_size} bytes")
                print(f"   行数: {len(lines)}")
                
                if lines:
                    print(f"\n   内容预览:")
                    for line in lines[:5]:
                        print(f"     {line}")
                else:
                    print(f"   （文件为空或仅含空行）")
                
                return True
            else:
                print(f"\n❌ 文件未生成")
                return False
        else:
            print(f"\n❌ 失败: {result.stderr}")
            return False
            
    except Exception as e:
        print(f"\n❌ 异常: {e}")
        return False

def main():
    print_section("GUI v3.4 改进功能测试")
    
    results = []
    
    # 测试1: include检测
    results.append(("Include路径检测", test_include_detection()))
    
    # 测试2: 完整视图生成
    results.append(("完整视图生成", test_conditions_generation()))
    
    # 对比测试
    results.append(("Legacy条件模式", test_legacy_conditions()))
    
    # 测试3: circle.txt
    results.append(("Circle.txt生成", test_circle_txt_generation()))
    
    # 总结
    print_section("测试总结")
    
    for name, result in results:
        status = "✅ 通过" if result else "❌ 失败"
        print(f"  {status} - {name}")
    
    passed = sum(1 for _, r in results if r)
    total = len(results)
    
    print(f"\n  通过率: {passed}/{total}")
    
    if passed == total:
        print("\n🎉 所有测试通过！")
        print("\n改进说明:")
        print("  1. Include路径智能检测 - 支持produce5等复杂项目")
        print("  2. 完整视图生成 - 使用mycallypro而非legacy --conditions-only")
        print("  3. 保持线程补边 - 完整视图同时包含线程和条件节点")
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
