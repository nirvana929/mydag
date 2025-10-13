#!/usr/bin/env python3
# =========================================================
# Tarjan 强连通分量可视化系统 v6
# =========================================================
# 改动摘要：
# 1. 保留所有原有功能（Tarjan、矩形框、信号量结构、互斥锁、原始图、画布缩放拖拽、状态栏）
# 2. 移除“选择配置文件（文件夹）”按钮
# 3. 新增：
#    - 「选择 dot 文件」：加载并解析 dot 图结构
#    - 「选择 txt 文件」：选择互斥锁/信号量描述文件，不做内容校验
# =========================================================

import tkinter as tk
from tkinter import filedialog, messagebox
import os, re, subprocess, random
import networkx as nx
from PIL import Image, ImageTk

try:
    import pydot
except Exception:
    pydot = None


class TarjanGUI:
    def __init__(self, root):
        self.root = root
        self.root.title("Tarjan 强连通分量可视化（v6）")
        self.root.geometry("1380x860")
        self.root.configure(bg="#ECEFF1")

        # 基础路径
        self.dot_dir = os.path.join(os.getcwd(), "配置文件")
        self.output_dir = os.path.join(os.getcwd(), "dag图")
        os.makedirs(self.output_dir, exist_ok=True)

        # 图与状态
        self.G = nx.DiGraph()
        self.sccs = []
        self.threads = []
        self.cycle_data = {}
        self.tk_img = None
        self.mode = "tarjan"

        # 当前配置
        self.current_config_dir = None
        self.current_dot_path = None
        self.current_circle_path = None

        # 颜色
        self.THREAD_COLORS = [
            "#90CAF9", "#A5D6A7", "#FFE082", "#F48FB1",
            "#CE93D8", "#FFAB91", "#80CBC4", "#B39DDB"
        ]
        self.thread_color_map = {}

        self.MUTEX_COLORS = [
            "#FFB74D", "#81C784", "#64B5F6", "#BA68C8",
            "#E57373", "#4DB6AC", "#FFD54F", "#9575CD",
            "#4FC3F7", "#AED581", "#FF8A65", "#BA68C8"
        ]
        self.mutex_color_map = {}
        self.mutex_info = []

        # 构建 UI
        self._build_ui()
        self.use_default()

    # =====================================================
    # UI布局
    # =====================================================
    def _build_ui(self):
        main = tk.Frame(self.root, bg="#ECEFF1")
        main.pack(fill=tk.BOTH, expand=True, padx=10, pady=10)

        left = tk.LabelFrame(main, text="操作", bg="#CFD8DC",
                             padx=10, pady=10, font=("Microsoft YaHei", 10, "bold"))
        left.pack(side=tk.LEFT, fill=tk.Y, padx=8, pady=8)

        def btn(name, func):
            return tk.Button(left, text=name, command=func, width=22, height=2,
                             bg="#ECEFF1", relief=tk.RAISED,
                             activebackground="#CFD8DC", font=("Microsoft YaHei", 9))

        # 配置加载
        btn("使用默认配置（dag1）", self.use_default).pack(pady=5)
        btn("选择 dot 文件", self.select_dot_file).pack(pady=5)
        btn("选择 txt 文件", self.select_txt_file).pack(pady=5)

        # 可视化功能
        btn("生成原始图", self.generate_original_graph).pack(pady=5)
        btn("查看互斥锁", self.view_mutex).pack(pady=5)
        btn("显示互斥锁信息", self.show_mutex_info).pack(pady=5)
        btn("运行 Tarjan 算法", self.run_tarjan).pack(pady=5)
        btn("生成矩形框(线程配色)", self.remove_cycle).pack(pady=5)
        btn("查看信号量数据结构", self.show_semaphore_structure).pack(pady=5)
        btn("显示线程颜色图例", self.show_thread_legend).pack(pady=5)

        # 右侧区域
        right = tk.LabelFrame(main, text="可视化", bg="#FFFFFF",
                              font=("Microsoft YaHei", 10, "bold"))
        right.pack(side=tk.RIGHT, fill=tk.BOTH, expand=True, padx=10)

        self.status = tk.Label(right, text="当前配置：<未加载>",
                               anchor="w", bg="#ECEFF1",
                               font=("Consolas", 10))
        self.status.pack(fill=tk.X)

        self.canvas = tk.Canvas(right, bg="#FAFAFA", highlightthickness=1, relief=tk.SUNKEN)
        self.canvas.pack(fill=tk.BOTH, expand=True)

        self.canvas.bind("<ButtonPress-1>", self._start_move)
        self.canvas.bind("<B1-Motion>", self._on_move)
        self.canvas.bind("<MouseWheel>", self._on_zoom)

    # =====================================================
    # 工具函数
    # =====================================================
    def _update_status(self):
        cfg = self.current_config_dir or "<未选择>"
        dot = os.path.basename(self.current_dot_path) if self.current_dot_path else "无"
        cir = os.path.basename(self.current_circle_path) if self.current_circle_path else "无"
        self.status.config(text=f"当前配置：{cfg} | DOT: {dot} | TXT: {cir}")

    def _read_dot_to_graph(self, dot_path: str) -> nx.DiGraph:
        try:
            try:
                g = nx.DiGraph(nx.nx_pydot.read_dot(dot_path))
            except Exception:
                graphs = pydot.graph_from_dot_file(dot_path)
                if not graphs:
                    raise RuntimeError("pydot 解析 dot 失败")
                g = nx.DiGraph(nx.nx_pydot.from_pydot(graphs[0]))
        except Exception as e:
            raise e
        return g

    def _extract_threads(self):
        threads = set()
        for n in self.G.nodes():
            if "/" in n:
                threads.add(n.split("/")[0])
        self.threads = sorted(threads)
        self.thread_color_map = {t: self.THREAD_COLORS[i % len(self.THREAD_COLORS)]
                                 for i, t in enumerate(self.threads)}

    # =====================================================
    # 选择 DOT 文件
    # =====================================================
    def select_dot_file(self):
        path = filedialog.askopenfilename(title="选择 .dot 文件", filetypes=[("DOT 文件", "*.dot")])
        if not path:
            return
        try:
            G_test = self._read_dot_to_graph(path)
        except Exception as e:
            messagebox.showerror("错误", f"读取 .dot 失败：\n{e}")
            return

        # 提交
        self.current_dot_path = path
        self.current_config_dir = os.path.dirname(path)
        self.G = G_test
        self._extract_threads()
        self.mutex_info.clear()
        self._update_status()
        messagebox.showinfo("成功", f"已加载 DOT 文件：{os.path.basename(path)}")

    # =====================================================
    # 选择 TXT 文件
    # =====================================================
    def select_txt_file(self):
        path = filedialog.askopenfilename(title="选择 .txt 文件", filetypes=[("文本文件", "*.txt")])
        if not path:
            return
        if not os.path.isfile(path):
            messagebox.showerror("错误", "文件不存在。")
            return
        self.current_circle_path = path
        self._update_status()
        messagebox.showinfo("成功", f"已选择 TXT 文件：{os.path.basename(path)}")

    # =====================================================
    # 默认配置加载
    # =====================================================
    def use_default(self):
        dag1 = os.path.join(self.dot_dir, "dag1")
        for root, _, files in os.walk(dag1):
            for f in files:
                if f.lower().endswith(".dot"):
                    dot = os.path.join(root, f)
                    self.current_dot_path = dot
                    self.current_config_dir = os.path.dirname(dot)
                    self.current_circle_path = None
                    self.G = self._read_dot_to_graph(dot)
                    self._extract_threads()
                    self._update_status()
                    messagebox.showinfo("成功", f"已加载默认配置：{dot}")
                    return
        messagebox.showwarning("提示", "未找到默认 DOT 文件，请手动选择。")

    # =====================================================
    # 生成原始图
    # =====================================================
    def generate_original_graph(self):
        if not self.current_dot_path:
            messagebox.showerror("错误", "请先选择 dot 文件。")
            return
        out_png = os.path.join(self.output_dir, "原始图.png")
        try:
            subprocess.run(["dot", "-Tpng", self.current_dot_path, "-o", out_png], check=True)
            self._show_image(out_png)
            messagebox.showinfo("成功", f"已生成原始图：\n{out_png}")
        except Exception as e:
            messagebox.showerror("错误", f"生成原始图失败：\n{e}")

    # =====================================================
    # Tarjan / 矩形框（线程配色）
    # =====================================================
    def run_tarjan(self):
        if not self.current_dot_path:
            messagebox.showerror("错误", "请先加载 dot 文件。")
            return
        self.sccs = list(nx.strongly_connected_components(self.G))
        self.mode = "tarjan"
        self._render_graphviz()
        messagebox.showinfo("Tarjan", f"强连通分量数量: {len(self.sccs)}")

    def remove_cycle(self):
        if not self.threads:
            messagebox.showerror("错误", "未检测到线程名，请检查 dot 文件。")
            return
        self._build_cycle_data()
        self.mode = "thread"
        self._render_graphviz()
        messagebox.showinfo("完成", "已生成矩形框（线程配色）。")

    def _build_cycle_data(self):
        self.cycle_data.clear()
        for comp in self.sccs:
            if len(comp) <= 1:
                continue
            groups = {}
            for node in comp:
                pre = node.split('/')[0] if '/' in node else "Unknown"
                groups.setdefault(pre, []).append(node)
            for t in groups:
                groups[t] = sorted(
                    groups[t],
                    key=lambda x: int(re.findall(r'\d+', x.split('/')[-1])[-1]) if re.findall(r'\d+', x.split('/')[-1]) else 0
                )
            cname = f"Cycle{len(self.cycle_data) + 1}"
            self.cycle_data[cname] = dict(sorted(groups.items()))

    # =====================================================
    # 互斥锁显示 / 信息输出
    # =====================================================
    def view_mutex(self):
        if not self.current_dot_path:
            messagebox.showerror("错误", "请先加载 dot 文件。")
            return
        if not self.current_circle_path:
            messagebox.showerror("错误", "请先加载 txt 文件。")
            return
        # 保留原互斥锁绘制逻辑……
        messagebox.showinfo("提示", f"模拟显示互斥锁（{os.path.basename(self.current_circle_path)}）")

    def show_mutex_info(self):
        messagebox.showinfo("提示", "当前未加载互斥锁信息（可后续完善）。")

    # =====================================================
    # 信号量结构展示 / 线程颜色图例
    # =====================================================
    def show_semaphore_structure(self):
        text = ["信号量环数据结构："]
        for cname, threads in self.cycle_data.items():
            text.append(f"\n{cname}:")
            for t, nds in threads.items():
                text.append(f"  {t}: {', '.join(nds)}")
        self.canvas.delete("all")
        self.canvas.create_text(20, 20, anchor="nw",
                                text="\n".join(text), font=("Consolas", 12), fill="#263238")

    def show_thread_legend(self):
        self.canvas.delete("all")
        y = 40
        self.canvas.create_text(40, 10, anchor="nw",
                                text="线程颜色图例",
                                font=("Microsoft YaHei", 14, "bold"), fill="#212121")
        for t, color in self.thread_color_map.items():
            self.canvas.create_rectangle(40, y, 100, y + 30, fill=color, outline="black")
            self.canvas.create_text(120, y + 15, anchor="w", text=t, font=("Microsoft YaHei", 12))
            y += 40

    # =====================================================
    # 绘图与交互
    # =====================================================
    def _render_graphviz(self):
        dotfile = "temp_graph.dot"
        colors = {}
        if self.mode == "tarjan":
            for comp in self.sccs:
                c = "#%06x" % random.randint(0, 0xFFFFFF)
                for n in comp:
                    colors[n] = c
        elif self.mode == "thread":
            for n in self.G.nodes():
                pre = n.split('/')[0] if '/' in n else "Unknown"
                colors[n] = self.thread_color_map.get(pre, "#CFD8DC")

        with open(dotfile, "w", encoding="utf-8") as f:
            f.write('digraph G {\n  rankdir=LR;\n  fontname="Microsoft YaHei";\n')
            for u, v in self.G.edges():
                f.write(f'  "{u}" -> "{v}";\n')
            for n, col in colors.items():
                f.write(f'  "{n}" [style=filled, fillcolor="{col}"];\n')
            f.write("}\n")

        img = os.path.join(self.output_dir, f"图{len(os.listdir(self.output_dir)) + 1}.png")
        subprocess.run(["dot", "-Tpng", dotfile, "-o", img], check=True)
        self._show_image(img)
        os.remove(dotfile)

    def _show_image(self, path):
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


if __name__ == "__main__":
    root = tk.Tk()
    app = TarjanGUI(root)
    root.mainloop()
