#!/usr/bin/env python3
"""测试 RTL 生成功能的脚本（不需要 GUI）"""

import subprocess
import tempfile
from pathlib import Path

def test_rtl_generation():
    """测试 RTL expand 文件生成和去改编流程"""
    
    # 使用 simple_thread.cpp 作为测试源文件
    source = Path("/home/chove/Desktop/mydag/cally++/源代码/simple_thread/simple_thread.cpp")
    
    if not source.exists():
        print(f"✗ 源文件不存在: {source}")
        return
    
    print("=" * 60)
    print(f"测试 RTL 生成: {source.name}")
    print("=" * 60)
    
    workdir = source.parent
    
    # 步骤 1: 编译生成 RTL expand 文件
    print("\n步骤 1/3: 编译生成 RTL expand 文件...")
    
    # 创建临时目标文件
    try:
        tmp = tempfile.NamedTemporaryFile(dir=workdir, suffix=".o", delete=False)
        tmp_name = Path(tmp.name).name
        tmp.close()
    except Exception as e:
        print(f"✗ 创建临时文件失败: {e}")
        return
    
    # 编译命令
    cmd = [
        "g++",
        "-O0",
        "-std=c++17",
        "-fdump-rtl-expand",
        "-c",
        source.name,
        "-o",
        tmp_name,
    ]
    
    print(f"运行: {' '.join(cmd)}")
    print(f"工作目录: {workdir}")
    
    try:
        proc = subprocess.run(
            cmd,
            cwd=workdir,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True,
            timeout=60
        )
        
        if proc.stdout.strip():
            print(f"编译输出:\n{proc.stdout}")
        
        if proc.returncode != 0:
            print(f"✗ 编译失败，返回码: {proc.returncode}")
            return
        
        print("✓ 编译成功")
        
    except subprocess.TimeoutExpired:
        print("✗ 编译超时（60秒）")
        return
    except Exception as e:
        print(f"✗ 编译出错: {e}")
        return
    finally:
        # 清理临时目标文件
        try:
            (workdir / tmp_name).unlink(missing_ok=True)
        except Exception:
            pass
    
    # 步骤 2: 查找生成的 expand 文件
    print("\n步骤 2/3: 查找 RTL expand 文件...")
    
    # 查找最新的 expand 文件
    expands = sorted(
        workdir.glob(f"{source.name}*.expand"),
        key=lambda p: p.stat().st_mtime,
        reverse=True
    )
    
    if not expands:
        print("✗ 未找到生成的 expand 文件")
        print(f"在目录中查找: {workdir}")
        return
    
    expand_path = expands[0]
    expand_size = expand_path.stat().st_size / 1024  # KB
    print(f"✓ 找到 expand 文件: {expand_path.name}")
    print(f"文件大小: {expand_size:.1f} KB")
    
    # 步骤 3: 去改编处理
    print("\n步骤 3/3: 执行去改编处理...")
    
    try:
        # 导入去改编模块
        from rtl_parser import RTLParser
        
        # 创建解析器（启用去改编）
        parser = RTLParser(enable_demangle=True, debug=True)
        
        # 解析文件
        print("解析 RTL 文件...")
        graph = parser.parse_file(str(expand_path))
        
        total_funcs = len(graph.functions)
        print(f"✓ 解析完成，共 {total_funcs} 个函数")
        
        # 统计去改编信息
        if hasattr(parser, 'demangler') and parser.demangler:
            cache_size = len(parser.demangler._cache) if hasattr(parser.demangler, '_cache') else 0
            print(f"去改编缓存: {cache_size} 个符号")
            
            # 显示前几个去改编示例
            if cache_size > 0 and hasattr(parser.demangler, '_cache'):
                print("\n去改编示例:")
                for i, (mangled, demangled) in enumerate(list(parser.demangler._cache.items())[:3]):
                    if mangled != demangled:
                        print(f"  {mangled}")
                        print(f"  → {demangled}")
                        if i < 2:
                            print()
        
        print("\n" + "=" * 60)
        print("✓ RTL 文件生成并去改编完成！")
        print(f"文件路径: {expand_path}")
        print(f"函数数量: {total_funcs}")
        print("=" * 60)
        
    except ImportError as e:
        print(f"✗ 导入去改编模块失败: {e}")
        print("请确保 rtl_parser.py 在同一目录")
    except Exception as e:
        print(f"✗ 去改编处理失败: {e}")
        import traceback
        traceback.print_exc()

if __name__ == "__main__":
    test_rtl_generation()
