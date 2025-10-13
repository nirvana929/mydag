#!/usr/bin/env python3
# =========================================================
# Tarjan 强连通分量可视化系统（增强版）
# 【开发约定】
# 本程序在原基础上进行功能增强：
#  - 不删除任何原有逻辑、UI、功能；
#  - 仅添加功能，如UI美化、图例、颜色优化；
#  - 保持兼容性与可扩展性。
# =========================================================

import tkinter as tk
from tkinter import filedialog, messagebox
import networkx as nx
import random, os, re, subprocess
from PIL import Image, ImageTk


class TarjanGUI:
    def __init__(self, root):
        self.root = root
        self.root.title("Tarjan 强连通分量可视化（增强版）")
        self.root.geometry("1380x820")
        self.root.configure(bg="#ECEFF1")

        # 路径配置
        self.dot_dir = os.path.join(os.getcwd(), "配置文件")
        self.output_dir = os.path.join(os.getcwd(), "dag图")
        os.makedirs(self.output_dir, exist_ok=True)

        # 图数据结构
        self.G = nx.DiGraph()
        self.sccs = []
        self.threads = []
        self.cycle_data = {}
        self.tk_img = None
        self.current_dot_path = None
        self.mode = "tarjan"

        # 固定线程颜色
        self.THREAD_COLORS = [
            "#90CAF9", "#A5D6A7", "#FFE082", "#F48FB1",
            "#CE93D8", "#FFAB91", "#80CBC4", "#B39DDB"
        ]
        self.thread_color_map = {}

        self._build_ui()
        self.use_default()

    # =========================================================
    # UI 构建
    # =========================================================
    def _build_ui(self):
        main_frame = tk.Frame(self.root, bg="#ECEFF1")
        main_frame.pack(fill=tk.BOTH, expand=True, padx=10, pady=10)

        # 左侧操作面板
        left = tk.LabelFrame(main_frame, text="操作", bg="#CFD8DC", padx=10, pady=10, font=("Microsoft YaHei", 10, "bold"))
        left.pack(side=tk.LEFT, fill=tk.Y, padx=8, pady=8)

        def btn(name, func):
            return tk.Button(left, text=name, command=func, width=20, height=2,
                             bg="#ECEFF1", relief=tk.RAISED, activebackground="#CFD8DC", font=("Microsoft YaHei", 9))

        # 原功能按钮（未删除）
        btn("使用默认配置", self.use_default).pack(pady=5)
        btn("选择 DOT 文件", self.load_dot_file).pack(pady=5)
        btn("运行 Tarjan 算法", self.run_tarjan).pack(pady=5)
        btn("生成矩形框(线程配色)", self.remove_cycle).pack(pady=5)
        btn("查看信号量数据结构", self.show_semaphore_structure).pack(pady=5)
        btn("显示线程颜色图例", self.show_thread_legend).pack(pady=5)

        # 右侧画布区
        right = tk.LabelFrame(main_frame, text="可视化", bg="#FFFFFF", font=("Microsoft YaHei", 10, "bold"))
        right.pack(side=tk.RIGHT, fill=tk.BOTH, expand=True, padx=10)

        self.canvas = tk.Canvas(right, bg="#FAFAFA", highlightthickness=1, relief=tk.SUNKEN)
        self.canvas.pack(fill=tk.BOTH, expand=True)

        # 支持平移与缩放
        self.canvas.bind("<ButtonPress-1>", self._start_move)
        self.canvas.bind("<B1-Motion>", self._on_move)
        self.canvas.bind("<MouseWheel>", self._on_zoom)

    # =========================================================
    # 功能逻辑
    # =========================================================
    def extract_threads_from_graph(self):
        """从节点名中提取线程名前缀"""
        threads = set()
        for node in self.G.nodes():
            if '/' in node:
                prefix = node.split('/')[0]
                threads.add(prefix)
        self.threads = sorted(list(threads))
        print(f"[INFO] 提取线程名: {self.threads}")

        # 为每个线程分配固定颜色
        self.thread_color_map = {
            t: self.THREAD_COLORS[i % len(self.THREAD_COLORS)]
            for i, t in enumerate(self.threads)
        }

    def use_default(self):
        for root, _, files in os.walk(self.dot_dir):
            for f in files:
                if f.endswith(".dot"):
                    self.load_graph_from_dot(os.path.join(root, f))
                    return
        messagebox.showwarning("提示", "未找到默认 DOT 文件，请手动选择。")

    def load_dot_file(self):
        path = filedialog.askopenfilename(title="选择 DOT 文件", filetypes=[("DOT 文件", "*.dot")])
        if path:
            self.load_graph_from_dot(path)

    def load_graph_from_dot(self, path):
        try:
            self.current_dot_path = path
            self.G = nx.DiGraph(nx.nx_pydot.read_dot(path))
            self.extract_threads_from_graph()
            messagebox.showinfo("成功", f"加载 DOT 文件:\n{os.path.basename(path)}\n线程数: {len(self.threads)}")
        except Exception as e:
            messagebox.showerror("错误", f"加载 DOT 文件失败:\n{e}")

    # =========================================================
    # Tarjan 与环检测
    # =========================================================
    def run_tarjan(self):
        if not self.G:
            messagebox.showerror("错误", "图为空，请先加载 DOT 文件。")
            return
        self.sccs = list(nx.strongly_connected_components(self.G))
        self.mode = "tarjan"
        self.generate_graphviz_scc()
        messagebox.showinfo("Tarjan", f"强连通分量数量: {len(self.sccs)}")

    def remove_cycle(self):
        if not self.threads:
            messagebox.showerror("错误", "未检测到线程名，请先加载 DOT 文件。")
            return
        self.create_semaphore_cycles()
        self.mode = "thread"
        self.generate_graphviz_scc()
        messagebox.showinfo("完成", "已生成矩形框（线程配色）。")

    def create_semaphore_cycles(self):
        self.cycle_data.clear()
        for comp in self.sccs:
            if len(comp) <= 1:
                continue
            thread_nodes = {}
            for node in comp:
                prefix = node.split('/')[0] if '/' in node else "Unknown"
                thread_nodes.setdefault(prefix, []).append(node)
            for t in thread_nodes:
                thread_nodes[t] = sorted(thread_nodes[t], key=lambda x: int(re.findall(r'\d+', x.split('/')[-1])[-1]) if re.findall(r'\d+', x.split('/')[-1]) else 0)
            cname = f"Cycle{len(self.cycle_data) + 1}"
            self.cycle_data[cname] = dict(sorted(thread_nodes.items()))
        print(f"[INFO] 信号量环数量: {len(self.cycle_data)}")

    # =========================================================
    # Graphviz 绘图逻辑
    # =========================================================
    def generate_graphviz_scc(self):
        dotfile = "temp_graph.dot"
        node_colors = {}

        if self.mode == "tarjan":
            # 每个SCC随机一种颜色
            for comp in self.sccs:
                color = "#%06x" % random.randint(0, 0xFFFFFF)
                for node in comp:
                    node_colors[node] = color
        elif self.mode == "thread":
            # 每个线程固定一种颜色（环内外节点都上色）
            for node in self.G.nodes():
                prefix = node.split('/')[0] if '/' in node else "Unknown"
                node_colors[node] = self.thread_color_map.get(prefix, "#CFD8DC")

        with open(dotfile, "w", encoding="utf-8") as f:
            f.write('digraph G {\n  rankdir=LR;\n  fontname="Microsoft YaHei";\n')

            for u, v in self.G.edges():
                f.write(f'  "{u}" -> "{v}";\n')

            if self.mode == "thread" and self.cycle_data:
                for cname, tnodes in self.cycle_data.items():
                    f.write(f'  subgraph cluster_{cname} {{\n    style=dashed;\n    color=gray;\n    label="{cname}";\n')
                    for t, nds in tnodes.items():
                        for node in nds:
                            col = node_colors.get(node, "#FFFFFF")
                            f.write(f'    "{node}" [style=filled, fillcolor="{col}"];\n')
                    f.write("  }\n")

            for node, col in node_colors.items():
                f.write(f'  "{node}" [style=filled, fillcolor="{col}"];\n')

            f.write("}\n")

        img_path = os.path.join(self.output_dir, f"图{len(os.listdir(self.output_dir)) + 1}.png")
        subprocess.run(["dot", "-Tpng", dotfile, "-o", img_path], check=True)
        self.display_image(img_path)
        os.remove(dotfile)

    # =========================================================
    # 图像展示与交互
    # =========================================================
    def display_image(self, path):
        img = Image.open(path)
        self.tk_img = ImageTk.PhotoImage(img)
        self.canvas.delete("all")
        self.canvas.create_image(0, 0, anchor=tk.NW, image=self.tk_img)
        self.canvas.config(scrollregion=self.canvas.bbox(tk.ALL))

    def _start_move(self, e): self.canvas.scan_mark(e.x, e.y)
    def _on_move(self, e): self.canvas.scan_dragto(e.x, e.y, gain=1)
    def _on_zoom(self, e):
        scale = 1.1 if e.delta > 0 else 0.9
        self.canvas.scale(tk.ALL, e.x, e.y, scale, scale)
        self.canvas.configure(scrollregion=self.canvas.bbox(tk.ALL))

    # =========================================================
    # 数据结构与图例展示
    # =========================================================
    def show_semaphore_structure(self):
        if not self.cycle_data:
            messagebox.showerror("错误", "信号量环数据为空，请先运行 Tarjan。")
            return
        text = ["信号量环数据结构："]
        for cname, threads in self.cycle_data.items():
            text.append(f"\n{cname}:")
            for t, nds in threads.items():
                text.append(f"  {t}: {', '.join(nds)}")
        self.canvas.delete("all")
        self.canvas.create_text(20, 20, anchor="nw", text="\n".join(text), font=("Consolas", 12), fill="#263238")
        self.canvas.config(scrollregion=self.canvas.bbox(tk.ALL))

    def show_thread_legend(self):
        """显示线程与颜色的对应图例"""
        self.canvas.delete("all")
        y = 40
        self.canvas.create_text(40, 10, anchor="nw", text="线程颜色图例", font=("Microsoft YaHei", 14, "bold"), fill="#212121")
        for t, color in self.thread_color_map.items():
            self.canvas.create_rectangle(40, y, 100, y + 30, fill=color, outline="black")
            self.canvas.create_text(120, y + 15, anchor="w", text=t, font=("Microsoft YaHei", 12))
            y += 40
        self.canvas.config(scrollregion=self.canvas.bbox(tk.ALL))


if __name__ == "__main__":
    root = tk.Tk()
    app = TarjanGUI(root)
    root.mainloop()
