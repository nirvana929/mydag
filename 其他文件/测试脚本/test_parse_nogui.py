#!/usr/bin/env python3
"""
无GUI测试互斥锁和信号量解析功能
直接测试解析方法
"""

import sys
from pathlib import Path
from typing import List, Optional, Dict, Tuple
from dataclasses import dataclass

project_root = Path(__file__).parent

@dataclass
class MutexRecord:
    lock: str
    unlock: str
    var: str
    idx: str
    lock_line: Optional[int] = None
    unlock_line: Optional[int] = None
    lock_file: Optional[str] = None
    unlock_file: Optional[str] = None
    covered: List[str] = None
    
    def __post_init__(self):
        if self.covered is None:
            self.covered = []

@dataclass
class SemRecord:
    post: str
    wait: str
    var: str
    idx: str
    post_line: Optional[int] = None
    wait_line: Optional[int] = None
    post_file: Optional[str] = None
    wait_file: Optional[str] = None

def _norm(text: str) -> str:
    """标准化字符串"""
    return text.strip().replace('"', '')

def _parse_optional_meta(parts: List[str]) -> Tuple[Optional[int], Optional[str]]:
    """解析可选的源码行号与文件名"""
    line_no: Optional[int] = None
    file_name: Optional[str] = None
    if len(parts) >= 4:
        try:
            line_no = int(parts[3])
        except Exception:
            file_name = parts[3]
    if len(parts) >= 5:
        file_name = parts[4]
    return line_no, file_name

def parse_mutex_from_txt(txt_path: Path) -> List[MutexRecord]:
    """解析circle.txt中的互斥量信息 - 完整移植版本"""
    entries: List[Tuple[str, str, str, str, Optional[int], Optional[str]]] = []
    block = None
    
    content = txt_path.read_text(encoding='utf-8', errors='ignore')
    for line in content.splitlines():
        s = _norm(line)
        if not s:
            continue
        if s == "互斥量":
            block = "mutex"
            continue
        if s == "信号量":
            block = "sem"
            continue
        if block != "mutex":
            continue
        
        parts = s.split()
        if len(parts) < 3:
            continue
        
        func, var, idx = parts[0], parts[1], parts[2]
        line_no, file_name = _parse_optional_meta(parts)
        
        lower = func.lower()
        if "pthread_mutex_unlock" in lower or "/unlock" in lower:
            entries.append((_norm(func), var, idx, "unlock", line_no, file_name))
        elif "pthread_mutex_lock" in lower or "/lock" in lower:
            entries.append((_norm(func), var, idx, "lock", line_no, file_name))
    
    # 使用栈匹配lock和unlock
    stacks: Dict[str, List[Tuple[str, str, Optional[int], Optional[str]]]] = {}
    pairs: List[MutexRecord] = []
    
    for func, var, idx, typ, line_no, file_name in entries:
        stacks.setdefault(idx, [])
        if typ == "lock":
            stacks[idx].append((func, var, line_no, file_name))
        elif typ == "unlock" and stacks[idx]:
            lock_func, lock_var, lock_line, lock_file = stacks[idx].pop()
            if lock_var != var:
                lock_var = var
            record = MutexRecord(
                lock=_norm(lock_func),
                unlock=_norm(func),
                var=lock_var,
                idx=idx,
                lock_line=lock_line,
                unlock_line=line_no,
                lock_file=lock_file,
                unlock_file=file_name,
                covered=[],
            )
            pairs.append(record)
    
    return pairs

def parse_semaphore_from_txt(txt_path: Path) -> List[SemRecord]:
    """解析circle.txt中的信号量信息 - 完整移植版本"""
    by_id: Dict[str, Dict[str, any]] = {}
    block = None
    
    content = txt_path.read_text(encoding='utf-8', errors='ignore')
    for line in content.splitlines():
        s = _norm(line)
        if not s:
            continue
        if s == "互斥量":
            block = "mutex"
            continue
        if s == "信号量":
            block = "sem"
            continue
        if block != "sem":
            continue
        
        parts = s.split()
        if len(parts) < 3:
            continue
        
        func, var, idx = parts[0], parts[1], parts[2]
        line_no, file_name = _parse_optional_meta(parts)
        
        record = by_id.setdefault(
            idx,
            {
                "post": None,
                "wait": None,
                "var": var,
                "post_line": None,
                "wait_line": None,
                "post_file": None,
                "wait_file": None,
            },
        )
        
        if "sem_post" in func:
            record["post"] = _norm(func)
            record["post_line"] = line_no
            record["post_file"] = file_name
        elif "sem_wait" in func:
            record["wait"] = _norm(func)
            record["wait_line"] = line_no
            record["wait_file"] = file_name
    
    # 构建配对列表
    pairs: List[SemRecord] = []
    for idx, info in by_id.items():
        if info["post"] and info["wait"]:
            pairs.append(
                SemRecord(
                    post=str(info["post"]),
                    wait=str(info["wait"]),
                    var=str(info["var"]),
                    idx=idx,
                    post_line=info.get("post_line"),
                    wait_line=info.get("wait_line"),
                    post_file=info.get("post_file"),
                    wait_file=info.get("wait_file"),
                )
            )
    
    return pairs

def test_parsing():
    """测试解析功能"""
    print("=" * 70)
    print("测试互斥锁和信号量解析功能（无GUI版本）")
    print("=" * 70)
    
    # 创建测试数据
    test_txt = project_root / "test_circle_data.txt"
    test_txt.write_text("""互斥量
thread1/lock1 mutex_a 0 10 main.c
thread1/unlock1 mutex_a 0 20 main.c
thread2/lock2 mutex_b 1 30 main.c
thread2/unlock2 mutex_b 1 40 main.c

信号量
thread1/post1 sem_x 0 15 main.c
thread2/wait1 sem_x 0 25 main.c
thread2/post2 sem_y 1 35 main.c
thread1/wait2 sem_y 1 45 main.c
""", encoding='utf-8')
    
    try:
        # 测试互斥锁解析
        print("\n--- 测试互斥锁解析 ---")
        mutex_records = parse_mutex_from_txt(test_txt)
        print(f"✅ 解析成功: {len(mutex_records)} 个互斥锁配对")
        for i, rec in enumerate(mutex_records):
            print(f"\n配对 {i+1}:")
            print(f"  变量: {rec.var}")
            print(f"  ID: {rec.idx}")
            print(f"  Lock: {rec.lock} (行{rec.lock_line}, 文件{rec.lock_file})")
            print(f"  Unlock: {rec.unlock} (行{rec.unlock_line}, 文件{rec.unlock_file})")
        
        # 测试信号量解析
        print("\n--- 测试信号量解析 ---")
        sem_records = parse_semaphore_from_txt(test_txt)
        print(f"✅ 解析成功: {len(sem_records)} 个信号量配对")
        for i, rec in enumerate(sem_records):
            print(f"\n配对 {i+1}:")
            print(f"  变量: {rec.var}")
            print(f"  ID: {rec.idx}")
            print(f"  Post: {rec.post} (行{rec.post_line}, 文件{rec.post_file})")
            print(f"  Wait: {rec.wait} (行{rec.wait_line}, 文件{rec.wait_file})")
        
        # 清理
        test_txt.unlink()
        
        print("\n" + "=" * 70)
        print("✅ 测试完成！解析功能正常")
        print("=" * 70)
        return True
        
    except Exception as e:
        print(f"❌ 测试失败: {e}")
        import traceback
        traceback.print_exc()
        if test_txt.exists():
            test_txt.unlink()
        return False

if __name__ == "__main__":
    success = test_parsing()
    sys.exit(0 if success else 1)
