#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import tkinter as tk
from tkinter import filedialog, messagebox
import os, io, difflib
import networkx as nx
from graphviz import Source
from PIL import Image, ImageTk

# 调色板（用于不同变量名上色）
MUTEX_COLORS = [
    "#FFB74D", "#81C784", "#64B5F6", "#BA68C8",
    "#E57373", "#4DB6AC", "#FFD54F", "#9575CD",
    "#4FC3F7", "#AED581", "#FF8A65", "#B39DDB"
]

def norm(s: str) -> str:
    """统一规范化节点名：去引号、空白"""
    return s.strip().strip('"').strip("'").strip()

class MutexTracerApp:
    def __init__(self, root):
        self.root = root
        self.root.title("互斥锁分析与图形展示（含颜色与导出）")
        self.root.geometry("1400x900")

        self.dot_path = None
        self.txt_path = None
        self.G = nx.DiGraph()
        self.mutex_info = []

        self._build_ui()

    # ===================== UI =====================
    def _build_ui(self):
        main = tk.Frame(self.root, bg="#ECEFF1")
        main.pack(fill=tk.BOTH, expand=True, padx=10, pady=10)

        left = tk.LabelFrame(main, text="操作区", bg="#CFD8DC",
                             font=("Microsoft YaHei", 10, "bold"), padx=10, pady=10)
        left.pack(side=tk.LEFT, fill=tk.Y, padx=10, pady=10)

        def btn(text, cmd):
            return tk.Button(left, text=text, command=cmd, width=22, height=2,
                             bg="#ECEFF1", activebackground="#CFD8DC", relief=tk.RAISED)

        btn("选择 dot 文件", self.select_dot).pack(pady=6)
        btn("选择 txt 文件", self.select_txt).pack(pady=6)
        btn("查看原始图", self.show_original_graph).pack(pady=6)
        btn("查看互斥锁", self.view_mutex_debug).pack(pady=6)
        btn("显示互斥锁信息", self.show_mutex_info).pack(pady=6)

        self.log_box = tk.Text(main, width=70, height=50, bg="#1E1E1E",
                               fg="#80CBC4", font=("Consolas", 10))
        self.log_box.pack(side=tk.LEFT, fill=tk.Y, padx=8)

        right = tk.LabelFrame(main, text="图像预览", bg="#FFFFFF",
                              font=("Microsoft YaHei", 10, "bold"))
        right.pack(side=tk.RIGHT, fill=tk.BOTH, expand=True, padx=10)
        self.canvas = tk.Canvas(right, bg="#FAFAFA")
        self.canvas.pack(fill=tk.BOTH, expand=True)
        self.tk_img = None

    def log(self, msg):
        self.log_box.insert(tk.END, msg + "\n")
        self.log_box.see(tk.END)

    # ================== 文件选择 ==================
    def select_dot(self):
        path = filedialog.askopenfilename(title="选择 DOT 文件", filetypes=[("DOT 文件", "*.dot")])
        if not path:
            return
        self.dot_path = path
        G = nx.DiGraph(nx.nx_pydot.read_dot(path))
        G = nx.relabel_nodes(G, lambda x: norm(x))
        self.G = G
        self.log(f"[DOT] 加载成功：{os.path.basename(path)}")
        self.log(f"[DOT] 节点总数：{len(self.G.nodes())}")
        sample = list(self.G.nodes())[:8]
        self.log(f"[DOT] 样例节点：{sample}")

    def select_txt(self):
        path = filedialog.askopenfilename(title="选择 TXT 文件", filetypes=[("TXT 文件", "*.txt")])
        if not path:
            return
        self.txt_path = path
        self.log(f"[TXT] 加载成功：{os.path.basename(path)}")

    # ================== 图渲染 ==================
    def _render_dot_to_canvas(self, dot_str: str):
        """渲染 DOT 字符串为图像（同时显示并输出 PNG）"""
        src = Source(dot_str)
        src.render("mutex_result", format="png", cleanup=True)
        self.log("[输出] 已生成 mutex_result.png")

        # 打开系统图像查看器
        src.view(filename="mutex_result.gv", cleanup=True)

        # 在 Tkinter 内嵌显示
        png_bytes = src.pipe(format="png")
        img = Image.open(io.BytesIO(png_bytes))
        self.tk_img = ImageTk.PhotoImage(img)
        self.canvas.delete("all")
        self.canvas.create_image(0, 0, anchor=tk.NW, image=self.tk_img)

    # ================== 原始图 ==================
    def show_original_graph(self):
        if not self.dot_path:
            messagebox.showerror("错误", "请先选择 dot 文件")
            return
        with open(self.dot_path, "r", encoding="utf-8") as f:
            dot_str = f.read()
        self._render_dot_to_canvas(dot_str)
        self.log("[原始图] 已显示并生成 mutex_result.png")

    # ================== 查看互斥锁 ==================
    def view_mutex_debug(self):
        self.canvas.delete("all")
        if not (self.dot_path and self.txt_path):
            messagebox.showerror("错误", "请先选择 dot 与 txt 文件")
            return

        # 1. 读取 circle.txt
        raw_lines, entries = [], []
        with open(self.txt_path, "r", encoding="utf-8") as f:
            for i, line in enumerate(f, 1):
                s = norm(line)
                raw_lines.append((i, s))
        self.log(f"[TXT] 有效行：{len(raw_lines)}")

        # 2. 提取 lock/unlock 信息
        for i, s in raw_lines:
            if not s or s.startswith("互斥量") or s.startswith("信号量"):
                continue
            parts = s.split()
            if len(parts) < 3:
                continue
            func, var, idx = norm(parts[0]), norm(parts[1]), norm(parts[2])
            fl = func.lower()
            if "pthread_mutex_unlock" in fl or "/unlock" in fl:
                entries.append((func, var, idx, "unlock", i))
            elif "pthread_mutex_lock" in fl or "/lock" in fl:
                entries.append((func, var, idx, "lock", i))

        self.log(f"[解析] 共识别互斥锁记录：{len(entries)}")

        # 3. 按编号配对 lock/unlock
        stacks, pairs = {}, []
        for func, var, idx, typ, ln in entries:
            stacks.setdefault(idx, [])
            if typ == "lock":
                stacks[idx].append((func, var, ln))
            elif typ == "unlock":
                if stacks[idx]:
                    lock_func, v, ln_lock = stacks[idx].pop()
                    pairs.append((lock_func, func, var, idx))
        if not pairs:
            self.log("[警告] 未找到配对互斥锁")
            return
        self.log(f"[配对] 成功配对 {len(pairs)} 组")

        # 4. 计算覆盖节点
        covered_by_id = {}
        mutex_info_full = []
        color_by_var = {}
        color_index = 0

        for lock_node, unlock_node, var, idx in pairs:
            L, U = norm(lock_node), norm(unlock_node)
            if L not in self.G.nodes or U not in self.G.nodes:
                continue
            reach_from_L = nx.descendants(self.G, L)
            reach_to_U = nx.ancestors(self.G, U)
            between = reach_from_L & reach_to_U
            between.update({L, U})

            covered_by_id[idx] = (var, between)
            mutex_info_full.append([idx, L, U, sorted(list(between))])

            # 分配颜色
            if var not in color_by_var:
                color_by_var[var] = MUTEX_COLORS[color_index % len(MUTEX_COLORS)]
                color_index += 1

        self.mutex_info = mutex_info_full
        self.log(f"[结果] 共生成 {len(self.mutex_info)} 个互斥锁区域")

        # 5. 生成 DOT 图
        dot_lines = ['digraph G {', 'rankdir=LR;', 'fontname="Microsoft YaHei";']
        # 边
        for u, v in self.G.edges():
            dot_lines.append(f'"{u}" -> "{v}";')
        # 节点样式
        for n in self.G.nodes():
            dot_lines.append(f'"{n}" [shape=box, style=filled, fillcolor="#E3F2FD"];')

        # 每个锁区域生成 cluster
        cluster_id = 0
        for idx, (var, nodes) in covered_by_id.items():
            cluster_id += 1
            color = color_by_var[var]
            dot_lines.append(f'subgraph cluster_{cluster_id} {{')
            dot_lines.append(f'label="mutex var: {var} id: {idx}";')
            dot_lines.append(f'color="{color}";')
            for n in nodes:
                dot_lines.append(f'"{n}";')
            dot_lines.append('}')

        dot_lines.append("}")

        dot_str = "\n".join(dot_lines)
        self._render_dot_to_canvas(dot_str)
        self.log("[渲染] 互斥锁图已生成并保存为 mutex_result.png")

    # ================== 显示互斥锁信息 ==================
    def show_mutex_info(self):
        self.canvas.delete("all")
        y = 20
        self.canvas.create_text(20, y, anchor="nw",
                                text="互斥锁信息（编号、锁节点、解锁节点、覆盖节点）",
                                font=("Microsoft YaHei", 14, "bold"), fill="#000")
        y += 40
        if not self.mutex_info:
            self.canvas.create_text(20, y, anchor="nw",
                                    text="暂无数据，请先点击“查看互斥锁”生成",
                                    font=("Consolas", 12), fill="#555")
            return
        for idx, lock, unlock, nodes in self.mutex_info:
            text = (f"ID={idx}\nLOCK: {lock}\nUNLOCK: {unlock}\n"
                    f"COVERED: {', '.join(nodes)}\n")
            self.canvas.create_text(20, y, anchor="nw",
                                    text=text, font=("Consolas", 11), fill="#263238")
            y += 90


if __name__ == "__main__":
    root = tk.Tk()
    app = MutexTracerApp(root)
    root.mainloop()
