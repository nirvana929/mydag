#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os, io, hashlib, subprocess
import tkinter as tk
from tkinter import ttk, messagebox, simpledialog, filedialog
from PIL import Image, ImageTk
import networkx as nx
from typing import Optional


# ------------------ 工具函数 ------------------
def first_file_in(folder: str, suffix: str) -> Optional[str]:
    """取文件夹中字典序第一个指定后缀文件"""
    try:
        files = [os.path.join(folder, f) for f in os.listdir(folder)
                 if f.lower().endswith(suffix) and os.path.isfile(os.path.join(folder, f))]
        return sorted(files, key=lambda x: os.path.basename(x).lower())[0] if files else None
    except Exception:
        return None


def md5_of_files(paths) -> str:
    """根据文件内容计算MD5，用于生成唯一图像名"""
    h = hashlib.md5()
    for p in paths:
        if isinstance(p, io.BytesIO):
            h.update(p.getvalue())
            continue
        if p and os.path.exists(p):
            with open(p, 'rb') as f:
                while True:
                    chunk = f.read(8192)
                    if not chunk:
                        break
                    h.update(chunk)
        else:
            h.update(b"<EMPTY>")
    return h.hexdigest()


# ------------------ 主 GUI ------------------
class TarjanGUI:
    def __init__(self, root):
        self.root = root
        self.root.title("Tarjan 强连通分量与去环可视化")

        # 状态变量
        self.G = nx.DiGraph()
        self.sccs = []
        self.threads = []
        self.cycle_data = {}
        self.current_dot_path = None
        self.current_threads_path = None
        self.mode = "scc"  # 当前颜色模式： "scc" / "threads"

        # 输出目录
        self.output_dir = os.path.join(os.getcwd(), "dag图")
        os.makedirs(self.output_dir, exist_ok=True)

        # 颜色调色板
        self.palette = [
            "#64B5F6", "#81C784", "#FFD54F", "#BA68C8", "#4DB6AC",
            "#E57373", "#FF8A65", "#90A4AE", "#F06292", "#A1887F",
            "#4FC3F7", "#AED581", "#FFB74D", "#9575CD", "#26A69A",
        ]

        # 存储颜色映射
        self.thread_colors = {}
        self.scc_colors = {}
        self._color_index = 0

        # 图像显示
        self.img_pil = None
        self.img_tk = None
        self.zoom = 1.0
        self.min_zoom, self.max_zoom = 0.2, 4.0

        # 初始化UI
        self._build_ui()
        self._apply_style()


    # ---------------- UI ----------------
    def _build_ui(self):
        root = self.root
        root.geometry("1200x720")

        main = ttk.Frame(root, padding=8)
        main.pack(fill=tk.BOTH, expand=True)
        main.columnconfigure(0, weight=0, minsize=320)
        main.columnconfigure(1, weight=1)
        main.rowconfigure(0, weight=1)

        # 左侧控制面板
        ctrl = ttk.LabelFrame(main, text="操作", padding=10)
        ctrl.grid(row=0, column=0, sticky="nsew", padx=(0, 8))

        ttk.Button(ctrl, text="使用默认配置", command=self.use_default).grid(row=0, column=0, sticky="ew", pady=4)
        ttk.Button(ctrl, text="选择 DOT", command=self.load_dot).grid(row=1, column=0, sticky="ew", pady=4)
        ttk.Button(ctrl, text="选择线程名", command=self.load_threads).grid(row=2, column=0, sticky="ew", pady=4)
        ttk.Separator(ctrl).grid(row=3, column=0, sticky="ew", pady=8)
        ttk.Button(ctrl, text="运行 Tarjan", command=self.run_tarjan).grid(row=4, column=0, sticky="ew", pady=4)
        ttk.Button(ctrl, text="去环并生成矩形框", command=self.remove_cycle).grid(row=5, column=0, sticky="ew", pady=4)
        ttk.Button(ctrl, text="显示信号量结构", command=self.show_semaphore_structure).grid(row=6, column=0, sticky="ew", pady=4)

        self.lbl_dot = ttk.Label(ctrl, text="DOT: 未加载", foreground="#9aa4b2", wraplength=280, anchor="w")
        self.lbl_thr = ttk.Label(ctrl, text="THREADS: 未加载", foreground="#9aa4b2", wraplength=280, anchor="w")
        self.lbl_dot.grid(row=7, column=0, sticky="ew", pady=(12, 2))
        self.lbl_thr.grid(row=8, column=0, sticky="ew", pady=2)

        # 可视化区
        vis = ttk.LabelFrame(main, text="可视化", padding=6)
        vis.grid(row=0, column=1, sticky="nsew")
        vis.rowconfigure(0, weight=1)
        vis.columnconfigure(0, weight=1)

        self.canvas = tk.Canvas(vis, background="#0b1020", highlightthickness=0)
        hbar = ttk.Scrollbar(vis, orient=tk.HORIZONTAL, command=self.canvas.xview)
        vbar = ttk.Scrollbar(vis, orient=tk.VERTICAL, command=self.canvas.yview)
        self.canvas.configure(xscrollcommand=hbar.set, yscrollcommand=vbar.set)
        self.canvas.grid(row=0, column=0, sticky="nsew")
        vbar.grid(row=0, column=1, sticky="ns")
        hbar.grid(row=1, column=0, sticky="ew")

        self.canvas.bind("<ButtonPress-1>", self._start_pan)
        self.canvas.bind("<B1-Motion>", self._do_pan)
        self.canvas.bind("<MouseWheel>", self._on_wheel_win)
        self.canvas.bind("<Button-4>", lambda e: self._zoom_at(e.x, e.y, 1.1))
        self.canvas.bind("<Button-5>", lambda e: self._zoom_at(e.x, e.y, 1/1.1))

        self.status = ttk.Label(root, text="就绪", anchor="w", padding=6)
        self.status.pack(fill=tk.X, side=tk.BOTTOM)


    def _apply_style(self):
        style = ttk.Style()
        try:
            style.theme_use("clam")
        except Exception:
            pass
        style.configure("TFrame", background="#0f172a")
        style.configure("TLabelframe", background="#0f172a", foreground="#e5e7eb")
        style.configure("TLabel", background="#0f172a", foreground="#e5e7eb")
        style.configure("TButton", padding=8)
        self.root.configure(background="#0f172a")


    # ---------------- 文件加载 ----------------
    def load_dot(self):
        fp = filedialog.askopenfilename(title="选择 DOT 文件", filetypes=[("DOT files", "*.dot")])
        if fp:
            self.G = nx.DiGraph(nx.nx_pydot.read_dot(fp))
            self.current_dot_path = fp
            self.lbl_dot.config(text=f"DOT: {fp}")
            messagebox.showinfo("提示", f"已加载 DOT 文件: {fp}")

    def load_threads(self):
        fp = filedialog.askopenfilename(title="选择线程名文件", filetypes=[("Text files", "*.txt")])
        if fp:
            with open(fp, "r", encoding="utf-8", errors="ignore") as f:
                self.threads = [line.strip().replace('"', '') for line in f if line.strip()]
            self.current_threads_path = fp
            self.lbl_thr.config(text=f"THREADS: {fp}")
            messagebox.showinfo("提示", f"已加载线程名文件: {fp}")

    def use_default(self):
        dot = first_file_in(os.path.join(os.getcwd(), "dot文件"), ".dot")
        thr = first_file_in(os.path.join(os.getcwd(), "线程名"), ".txt")
        if not dot or not thr:
            messagebox.showerror("错误", "默认配置文件未找到！")
            return
        self.G = nx.DiGraph(nx.nx_pydot.read_dot(dot))
        with open(thr, "r", encoding="utf-8", errors="ignore") as f:
            self.threads = [line.strip().replace('"', '') for line in f if line.strip()]
        self.current_dot_path, self.current_threads_path = dot, thr
        self.lbl_dot.config(text=f"DOT: {dot}")
        self.lbl_thr.config(text=f"THREADS: {thr}")
        self._set_status("默认配置已加载。")


    # ---------------- Tarjan 模式 ----------------
    def run_tarjan(self):
        if not self.G:
            messagebox.showerror("错误", "图为空")
            return
        self.sccs = list(nx.strongly_connected_components(self.G))
        self.mode = "scc"  # 切换到SCC着色模式
        messagebox.showinfo("Tarjan", f"强连通分量数量: {len(self.sccs)}")
        self.generate_graphviz_scc()


    # ---------------- 去环模式 ----------------
    def remove_cycle(self):
        if not self.sccs:
            messagebox.showerror("错误", "请先运行 Tarjan")
            return
        self.create_semaphore_cycles()
        self.mode = "threads"  # 切换到线程着色模式
        self.generate_graphviz_scc()
        messagebox.showinfo("去环完成", "已生成矩形框信号量环。")


    # ---------------- 环检测 ----------------
    def create_semaphore_cycles(self):
        self.cycle_data.clear()
        for comp in self.sccs:
            if len(comp) <= 1:
                continue
            threads = {}
            for n in comp:
                prefix = n.split('/')[0]
                threads.setdefault(prefix, []).append(n)
            if len(threads) > 1:
                cname = f"Cycle{len(self.cycle_data)+1}"
                self.cycle_data[cname] = threads


    # ---------------- 颜色逻辑 ----------------
    def _color_for_scc(self, node: str) -> str:
        """不同强连通分量用不同颜色"""
        for i, comp in enumerate(self.sccs):
            if node in comp:
                if i not in self.scc_colors:
                    self.scc_colors[i] = self.palette[i % len(self.palette)]
                return self.scc_colors[i]
        return "#BDBDBD"  # 默认灰色（不属于任何SCC）

    def _color_for_thread(self, node: str) -> str:
        """不同线程用不同颜色"""
        prefix = node.split('/')[0]
        if prefix not in self.thread_colors:
            self.thread_colors[prefix] = self.palette[len(self.thread_colors) % len(self.palette)]
        return self.thread_colors[prefix]


    # ---------------- Graphviz 生成 ----------------
    def generate_graphviz_scc(self):
        dotfile = os.path.join(self.output_dir, "_temp.dot")
        target = os.path.join(self.output_dir, f"{self.mode}.png")

        with open(dotfile, "w", encoding="utf-8") as f:
            f.write('digraph G {\n  rankdir=LR;\n  node [shape=box, style=filled];\n')

            # 写入边
            for u, v in self.G.edges():
                f.write(f'  "{u}" -> "{v}";\n')

            # 写入节点颜色
            for node in self.G.nodes():
                if self.mode == "scc":
                    col = self._color_for_scc(node)
                else:
                    col = self._color_for_thread(node)
                f.write(f'  "{node}" [fillcolor="{col}"];\n')

            # 写入环 cluster（仅线程模式下）
            if self.mode == "threads":
                for cname, thr in self.cycle_data.items():
                    f.write(f'  subgraph cluster_{cname} {{\n    label="{cname}"; style=dashed; color="#90A4AE";\n')
                    for t, nds in thr.items():
                        for n in nds:
                            col = self._color_for_thread(n)
                            f.write(f'    "{n}" [fillcolor="{col}"];\n')
                    f.write("  }\n")

            f.write("}\n")

        try:
            subprocess.run(["dot", "-Tpng", dotfile, "-o", target], check=True)
            self._show_image(target)
            self._set_status(f"已生成：{target}")
        except Exception as e:
            messagebox.showerror("Graphviz 错误", str(e))
        finally:
            if os.path.exists(dotfile):
                os.remove(dotfile)


    # ---------------- 图像显示 ----------------
    def _show_image(self, path):
        try:
            self.img_pil = Image.open(path).convert("RGBA")
            self.zoom = 1.0
            self._render_image()
        except Exception as e:
            messagebox.showerror("错误", f"打开图片失败：{e}")

    def _render_image(self):
        if not self.img_pil:
            return
        w, h = self.img_pil.size
        img = self.img_pil.resize((int(w * self.zoom), int(h * self.zoom)), Image.LANCZOS)
        self.img_tk = ImageTk.PhotoImage(img)
        self.canvas.delete("all")
        self.canvas_img_id = self.canvas.create_image(0, 0, image=self.img_tk, anchor="nw")
        self.canvas.config(scrollregion=(0, 0, img.width, img.height))

    def _start_pan(self, event):
        self.canvas.scan_mark(event.x, event.y)

    def _do_pan(self, event):
        self.canvas.scan_dragto(event.x, event.y, gain=1)

    def _on_wheel_win(self, event):
        self._zoom_at(event.x, event.y, 1.1 if event.delta > 0 else 1/1.1)

    def _zoom_at(self, x, y, factor):
        self.zoom = max(self.min_zoom, min(self.max_zoom, self.zoom * factor))
        self._render_image()


    # ---------------- 环信息显示 ----------------
    def show_semaphore_structure(self):
        if not self.cycle_data:
            messagebox.showerror("错误", "信号量环为空")
            return
        info = ""
        for cname, thr in self.cycle_data.items():
            info += f"{cname}:\n"
            for t, nds in thr.items():
                info += f"  {t}: {', '.join(nds)}\n"
        messagebox.showinfo("信号量环数据结构", info)

    def _set_status(self, text):
        self.status.config(text=text)


if __name__ == "__main__":
    root = tk.Tk()
    app = TarjanGUI(root)
    root.mainloop()
