#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os, io, re
import tkinter as tk
from tkinter import filedialog, messagebox
import networkx as nx
from graphviz import Source
from PIL import Image, ImageTk

def norm(s: str) -> str:
    return s.strip().strip('"').strip("'")

class MutexSemaphoreApp:
    def __init__(self, root):
        self.root = root
        self.root.title("互斥锁与信号量查看器")
        self.root.geometry("1400x900")

        self.dot_path = None
        self.txt_path = None
        self.G = nx.DiGraph()
        self.tk_img = None

        self._build_ui()

    # ======================== UI ========================
    def _build_ui(self):
        main = tk.Frame(self.root, bg="#ECEFF1")
        main.pack(fill=tk.BOTH, expand=True, padx=10, pady=10)

        left = tk.LabelFrame(main, text="功能区", bg="#CFD8DC", font=("Microsoft YaHei", 10, "bold"), padx=10, pady=10)
        left.pack(side=tk.LEFT, fill=tk.Y, padx=10, pady=10)

        def btn(text, cmd):
            return tk.Button(left, text=text, command=cmd, width=22, height=2,
                             bg="#ECEFF1", activebackground="#CFD8DC", relief=tk.RAISED)

        btn("选择 dot 文件", self.select_dot).pack(pady=6)
        btn("选择 txt 文件", self.select_txt).pack(pady=6)
        btn("查看原始图", self.show_original_graph).pack(pady=6)
        btn("查看互斥锁", self.view_mutex).pack(pady=6)
        btn("查看信号量", self.view_semaphore).pack(pady=6)
        btn("查看信号量图", self.view_semaphore_graph).pack(pady=6)

        self.log_box = tk.Text(main, width=70, height=50, bg="#1E1E1E", fg="#80CBC4", font=("Consolas", 10))
        self.log_box.pack(side=tk.LEFT, fill=tk.Y, padx=8)

        right = tk.LabelFrame(main, text="图像显示区", bg="#FFFFFF", font=("Microsoft YaHei", 10, "bold"))
        right.pack(side=tk.RIGHT, fill=tk.BOTH, expand=True, padx=10)
        self.canvas = tk.Canvas(right, bg="#FAFAFA")
        self.canvas.pack(fill=tk.BOTH, expand=True)

    def log(self, msg):
        self.log_box.insert(tk.END, msg + "\n")
        self.log_box.see(tk.END)

    # ======================== 文件选择 ========================
    def select_dot(self):
        path = filedialog.askopenfilename(title="选择 DOT 文件", filetypes=[("DOT 文件", "*.dot")])
        if not path:
            return
        self.dot_path = path
        self.G = nx.DiGraph(nx.nx_pydot.read_dot(path))
        self.G = nx.relabel_nodes(self.G, lambda x: norm(x))
        self.log(f"[DOT] 加载成功: {os.path.basename(path)}, 节点数 {len(self.G.nodes())}")

    def select_txt(self):
        path = filedialog.askopenfilename(title="选择 TXT 文件", filetypes=[("TXT 文件", "*.txt")])
        if not path:
            return
        self.txt_path = path
        self.log(f"[TXT] 加载成功: {os.path.basename(path)}")

    # ======================== 显示图像 ========================
    def _render_dot(self, dot_str: str, name: str):
        src = Source(dot_str)
        src.render(name, format="png", cleanup=True)
        self.log(f"[生成图] {name}.png 已生成")
        png_data = src.pipe(format="png")
        img = Image.open(io.BytesIO(png_data))
        self.tk_img = ImageTk.PhotoImage(img)
        self.canvas.delete("all")
        self.canvas.create_image(0, 0, anchor=tk.NW, image=self.tk_img)

    # ======================== 原始图 ========================
    def show_original_graph(self):
        if not self.dot_path:
            messagebox.showerror("错误", "请先选择 dot 文件")
            return
        with open(self.dot_path, "r", encoding="utf-8") as f:
            dot_str = f.read()
        self._render_dot(dot_str, "original_graph")

    # ======================== 互斥锁图 ========================
    def view_mutex(self):
        if not (self.dot_path and self.txt_path):
            messagebox.showerror("错误", "请先选择 dot 与 txt 文件")
            return

        with open(self.txt_path, "r", encoding="utf-8") as f:
            lines = [l.strip() for l in f if l.strip() and not l.startswith("信号量")]

        entries = []
        for line in lines:
            parts = line.split()
            if len(parts) < 3:
                continue
            func, var, idx = parts[0], parts[1], parts[2]
            if "lock" in func:
                entries.append((func, var, idx, "lock"))
            elif "unlock" in func:
                entries.append((func, var, idx, "unlock"))

        stacks, pairs = {}, []
        for func, var, idx, typ in entries:
            stacks.setdefault(idx, [])
            if typ == "lock":
                stacks[idx].append((func, var))
            elif typ == "unlock" and stacks[idx]:
                lock_func, varname = stacks[idx].pop()
                pairs.append((lock_func, func, varname, idx))

        dot_lines = ['digraph MutexGraph {', 'rankdir=LR;', 'fontname="Microsoft YaHei";']
        for u, v in self.G.edges():
            dot_lines.append(f'"{u}" -> "{v}";')
        for n in self.G.nodes():
            dot_lines.append(f'"{n}" [shape=box, style=filled, fillcolor="#E3F2FD"];')

        color_list = ["#FFB74D", "#81C784", "#64B5F6", "#BA68C8"]
        color_map = {}
        for i, (lock, unlock, var, idx) in enumerate(pairs):
            color = color_map.setdefault(var, color_list[i % len(color_list)])
            dot_lines.append(f'subgraph cluster_{idx} {{label="mutex {var}({idx})"; color="{color}";')
            dot_lines.append(f'"{lock}";"{unlock}";}}')

        dot_lines.append("}")
        self._render_dot("\n".join(dot_lines), "mutex_graph")

    # ======================== 信号量图（普通） ========================
    def view_semaphore(self):
        if not (self.dot_path and self.txt_path):
            messagebox.showerror("错误", "请先选择 dot 与 txt 文件")
            return
        with open(self.txt_path, "r", encoding="utf-8") as f:
            lines = [l.strip() for l in f if l.strip() and not l.startswith("信号量")]
        pairs = []
        by_id = {}
        for line in lines:
            parts = line.split()
            if len(parts) < 3: continue
            func, var, idx = parts[0], parts[1], parts[2]
            if idx not in by_id:
                by_id[idx] = {"post": None, "wait": None, "var": var}
            if "sem_post" in func:
                by_id[idx]["post"] = func
            elif "sem_wait" in func:
                by_id[idx]["wait"] = func
        for idx, info in by_id.items():
            if info["post"] and info["wait"]:
                pairs.append((info["post"], info["wait"], info["var"], idx))
        dot_lines = ['digraph Semaphore {', 'rankdir=LR;', 'fontname="Microsoft YaHei";']
        for u, v in self.G.edges():
            dot_lines.append(f'"{u}" -> "{v}";')
        for post, wait, var, idx in pairs:
            dot_lines.append(f'"{post}" -> "{wait}" [style=dashed, color="#FF7043", label="{var} {idx}"];')
        dot_lines.append("}")
        self._render_dot("\n".join(dot_lines), "semaphore_graph")

    # ======================== 新功能：只显示 post->wait 信号量图 ========================
    def view_semaphore_graph(self):
        if not self.txt_path:
            messagebox.showerror("错误", "请先选择 txt 文件")
            return

        sem_pairs = {}
        with open(self.txt_path, "r", encoding="utf-8") as f:
            for line in f:
                line = line.strip()
                if not line or line.startswith("信号量"):
                    continue
                parts = line.split()
                if len(parts) < 3:
                    continue
                func, var, idx = parts[0], parts[1], parts[2]
                sem_pairs.setdefault(idx, {"post": None, "wait": None, "var": var})
                if "sem_post" in func:
                    sem_pairs[idx]["post"] = func
                elif "sem_wait" in func:
                    sem_pairs[idx]["wait"] = func

        dot_lines = [
            "digraph SemaphoreOnly {",
            'rankdir=LR;',
            'node [shape=box, style=filled, fillcolor="#E3F2FD", fontname="Microsoft YaHei"];'
        ]
        for idx, info in sem_pairs.items():
            post, wait, var = info.get("post"), info.get("wait"), info.get("var")
            if post and wait:
                dot_lines.append(
                    f'"{post}" -> "{wait}" [style=dashed, color="#FF7043", label="{var} {idx}"];'
                )
        dot_lines.append("}")
        self._render_dot("\n".join(dot_lines), "semaphore_only")
        self.log("[信号量图] 仅post→wait边已生成 semaphore_only.png")

# ======================== 启动程序 ========================
if __name__ == "__main__":
    root = tk.Tk()
    app = MutexSemaphoreApp(root)
    root.mainloop()
