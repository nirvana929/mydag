#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
自动测试GUI v3互斥锁功能
使用mycallypro/配置文件/下的测试用例
"""

import sys
import os
from pathlib import Path
from typing import List, Dict, Tuple
import traceback

# 添加项目路径
project_root = Path(__file__).parent.parent
sys.path.insert(0, str(project_root))

# 导入必要的模块
try:
    import networkx as nx
except ImportError:
    print("❌ 需要安装networkx: pip install networkx")
    sys.exit(1)

# 导入GUI模块中的相关类和方法
from mycallyplus.ui.gui_v3 import MutexRecord


class MutexTester:
    """互斥锁功能测试器"""
    
    def __init__(self):
        self.test_base = Path("/home/chove/桌面/cally/mycallypro/配置文件")
        self.results = []
        
    def _norm(self, s: str) -> str:
        """标准化字符串"""
        return " ".join(s.split())
    
    def _parse_optional_meta(self, parts: List[str]) -> Tuple[int, str]:
        """解析可选的元信息"""
        line_no = None
        file_name = None
        for p in parts[3:]:
            if p.isdigit():
                line_no = int(p)
            elif "/" in p or "\\" in p or p.endswith(".c"):
                file_name = p
        return line_no, file_name
    
    def _parse_mutex_from_txt(self, txt_path: Path) -> List[MutexRecord]:
        """解析circle.txt中的互斥锁信息"""
        by_id: Dict[str, Dict] = {}
        block = None
        
        try:
            content = txt_path.read_text(encoding='utf-8', errors='ignore')
        except Exception as e:
            print(f"    ⚠️  读取文件失败: {e}")
            return []
        
        for line in content.splitlines():
            s = self._norm(line)
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
            line_no, file_name = self._parse_optional_meta(parts)
            
            record = by_id.setdefault(
                idx,
                {
                    "lock": None,
                    "unlock": None,
                    "var": var,
                    "lock_line": None,
                    "unlock_line": None,
                    "lock_file": None,
                    "unlock_file": None,
                },
            )
            
            if "pthread_mutex_lock" in func:
                record["lock"] = self._norm(func)
                record["lock_line"] = line_no
                record["lock_file"] = file_name
            elif "pthread_mutex_unlock" in func:
                record["unlock"] = self._norm(func)
                record["unlock_line"] = line_no
                record["unlock_file"] = file_name
        
        # 构建配对列表
        pairs: List[MutexRecord] = []
        for idx, info in by_id.items():
            if info["lock"] and info["unlock"]:
                pairs.append(
                    MutexRecord(
                        lock=info["lock"],
                        unlock=info["unlock"],
                        var=info["var"],
                        idx=idx,
                        lock_line=info["lock_line"],
                        unlock_line=info["unlock_line"],
                        lock_file=info["lock_file"],
                        unlock_file=info["unlock_file"],
                    )
                )
        
        return pairs
    
    def _read_dot_to_networkx(self, dot_path: Path):
        """读取DOT文件并转换为networkx图"""
        try:
            content = dot_path.read_text(encoding='utf-8')
            G = nx.DiGraph()
            
            # 简单解析DOT文件
            for line in content.splitlines():
                line = line.strip()
                if "->" in line:
                    parts = line.split("->")
                    if len(parts) == 2:
                        src = parts[0].strip().strip('"')
                        dst = parts[1].strip().rstrip(";").strip('"')
                        if src and dst:
                            G.add_edge(src, dst)
            
            return G
        except Exception as e:
            print(f"    ⚠️  读取DOT文件失败: {e}")
            return None
    
    def _suffix_num(self, node_name: str) -> int:
        """提取节点名称的后缀数字"""
        parts = node_name.split("_")
        if parts:
            try:
                return int(parts[-1])
            except ValueError:
                pass
        return 0
    
    def test_case(self, case_name: str, dot_file: str, txt_file: str) -> Dict:
        """测试单个用例"""
        print(f"\n{'='*60}")
        print(f"🧪 测试用例: {case_name}")
        print(f"{'='*60}")
        
        result = {
            "name": case_name,
            "success": False,
            "error": None,
            "mutex_count": 0,
            "covered_nodes": 0,
            "details": []
        }
        
        try:
            # 检查文件是否存在
            dot_path = self.test_base / case_name / dot_file
            txt_path = self.test_base / case_name / txt_file
            
            if not dot_path.exists():
                result["error"] = f"DOT文件不存在: {dot_path}"
                print(f"  ❌ {result['error']}")
                return result
            
            if not txt_path.exists():
                result["error"] = f"TXT文件不存在: {txt_path}"
                print(f"  ❌ {result['error']}")
                return result
            
            print(f"  📂 DOT文件: {dot_file}")
            print(f"  📂 TXT文件: {txt_file}")
            
            # 步骤1: 读取DOT文件
            print(f"\n  ⚙️  步骤1: 读取DOT文件...")
            G = self._read_dot_to_networkx(dot_path)
            if G is None:
                result["error"] = "无法读取DOT文件"
                print(f"  ❌ {result['error']}")
                return result
            print(f"  ✅ 图结构: {len(G.nodes())} 节点, {len(G.edges())} 边")
            
            # 步骤2: 解析互斥锁
            print(f"\n  ⚙️  步骤2: 解析互斥锁配对...")
            mutex_records = self._parse_mutex_from_txt(txt_path)
            if not mutex_records:
                result["error"] = "未找到互斥锁配对"
                print(f"  ⚠️  {result['error']}")
                return result
            print(f"  ✅ 找到 {len(mutex_records)} 个互斥锁配对")
            result["mutex_count"] = len(mutex_records)
            
            # 步骤3: 分析覆盖区域
            print(f"\n  ⚙️  步骤3: 分析互斥锁覆盖区域...")
            total_covered = 0
            for rec in mutex_records:
                if rec.lock not in G.nodes():
                    detail = f"❌ 节点不存在: {rec.lock}"
                    result["details"].append(detail)
                    print(f"    {detail}")
                    continue
                
                if rec.unlock not in G.nodes():
                    detail = f"❌ 节点不存在: {rec.unlock}"
                    result["details"].append(detail)
                    print(f"    {detail}")
                    continue
                
                try:
                    reach_from_lock = nx.descendants(G, rec.lock)
                    reach_to_unlock = nx.ancestors(G, rec.unlock)
                    between = reach_from_lock & reach_to_unlock | {rec.lock, rec.unlock}
                    rec.covered = sorted(between, key=lambda x: self._suffix_num(x))
                    
                    total_covered += len(rec.covered)
                    detail = f"✅ {rec.var} (ID={rec.idx}): {len(rec.covered)} 个节点"
                    result["details"].append(detail)
                    print(f"    {detail}")
                    
                except Exception as e:
                    detail = f"⚠️  分析失败 {rec.var}: {e}"
                    result["details"].append(detail)
                    print(f"    {detail}")
            
            result["covered_nodes"] = total_covered
            result["success"] = True
            
            print(f"\n  ✅ 测试通过！")
            print(f"     互斥锁数量: {result['mutex_count']}")
            print(f"     覆盖节点总数: {result['covered_nodes']}")
            
        except Exception as e:
            result["error"] = str(e)
            print(f"\n  ❌ 测试失败: {result['error']}")
            print(f"\n  详细错误:")
            traceback.print_exc()
        
        return result
    
    def run_all_tests(self):
        """运行所有测试"""
        print("╔════════════════════════════════════════════════════════════════╗")
        print("║          GUI v3 互斥锁功能自动化测试                           ║")
        print("╚════════════════════════════════════════════════════════════════╝")
        
        # 定义测试用例
        test_cases = [
            ("dag", "produce_4.dot", "circle.txt"),
            ("dag2", "simpletest.dot", "circle.txt"),
            ("produce.c", "produce_full.dot", "circle.txt"),
        ]
        
        # 运行测试
        for case_name, dot_file, txt_file in test_cases:
            result = self.test_case(case_name, dot_file, txt_file)
            self.results.append(result)
        
        # 生成报告
        self.generate_report()
    
    def generate_report(self):
        """生成测试报告"""
        print("\n" + "="*60)
        print("📊 测试报告")
        print("="*60)
        
        total = len(self.results)
        passed = sum(1 for r in self.results if r["success"])
        failed = total - passed
        
        print(f"\n总测试用例: {total}")
        print(f"✅ 通过: {passed}")
        print(f"❌ 失败: {failed}")
        
        # 详细结果
        print("\n" + "-"*60)
        print("详细结果:")
        print("-"*60)
        
        for i, result in enumerate(self.results, 1):
            status = "✅" if result["success"] else "❌"
            print(f"\n{i}. {status} {result['name']}")
            
            if result["success"]:
                print(f"   互斥锁: {result['mutex_count']} 个")
                print(f"   覆盖节点: {result['covered_nodes']} 个")
            else:
                print(f"   错误: {result['error']}")
        
        # 统计信息
        if passed > 0:
            total_mutex = sum(r["mutex_count"] for r in self.results if r["success"])
            total_nodes = sum(r["covered_nodes"] for r in self.results if r["success"])
            
            print("\n" + "-"*60)
            print("统计信息:")
            print("-"*60)
            print(f"总互斥锁数: {total_mutex}")
            print(f"总覆盖节点数: {total_nodes}")
            if total_mutex > 0:
                print(f"平均每个互斥锁覆盖: {total_nodes/total_mutex:.1f} 个节点")
        
        # 最终结论
        print("\n" + "="*60)
        if failed == 0:
            print("🎉 所有测试通过！")
        else:
            print(f"⚠️  {failed} 个测试失败")
        print("="*60)
        
        return failed


def main():
    """主函数"""
    tester = MutexTester()
    failed_count = tester.run_all_tests()
    
    # 保存结果到文件
    report_path = Path("/home/chove/桌面/cally/测试示例/互斥锁功能测试报告.txt")
    with open(report_path, "w", encoding="utf-8") as f:
        f.write("GUI v3 互斥锁功能测试报告\n")
        f.write("="*60 + "\n")
        f.write(f"测试时间: 2025-10-29\n")
        f.write(f"测试用例数: {len(tester.results)}\n")
        f.write(f"失败数: {failed_count}\n")
        f.write("\n详细结果:\n")
        f.write("-"*60 + "\n")
        
        for result in tester.results:
            f.write(f"\n测试用例: {result['name']}\n")
            f.write(f"状态: {'通过' if result['success'] else '失败'}\n")
            if result["success"]:
                f.write(f"互斥锁数: {result['mutex_count']}\n")
                f.write(f"覆盖节点数: {result['covered_nodes']}\n")
                f.write("详情:\n")
                for detail in result["details"]:
                    f.write(f"  {detail}\n")
            else:
                f.write(f"错误: {result['error']}\n")
    
    print(f"\n📄 测试报告已保存到: {report_path}")
    
    return failed_count


if __name__ == "__main__":
    sys.exit(main())
