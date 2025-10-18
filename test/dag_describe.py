#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Tarjan 强连通分量可视化系统（整合版，信号量管线）

import os
import re
import json
import random
import subprocess
import hashlib
import tkinter as tk
from tkinter import filedialog, messagebox

import networkx as nx
from PIL import Image, ImageTk

try:
    import pydot
except Exception:
    pydot = None


def _norm(s: str) -> str:
    return s.strip().strip('"').strip("'")


def _suffix_num(name: str) -> int:
    tail = name.split('/')[-1]
    m = re.findall(r"(\d+)$", tail)
    return int(m[-1]) if m else 0


def _md5_path(path: str) -> str:
    return hashlib.md5(os.path.abspath(path).encode()).hexdigest()


class TarjanGUI:
    def __init__(self, root):
        self.root = root
        self.root.title("Tarjan 强连通分量可视化（整合版）")
        self.root.geometry("1380x860")
        self.root.configure(bg="#ECEFF1")

        # 目录
        self.dot_dir = os.path.join(os.getcwd(), "配置文件")
        self.output_root = os.path.join(os.getcwd(), "dag图")
        os.makedirs(self.output_root, exist_ok=True)

        # 状态
        self.G = nx.DiGraph()            # 原始图
        self.sccs = []                   # Tarjan 结果
        self.threads = []                # 线程名
        self.cycle_data = {}             # 信号量环
        self.mutex_info = []             # 互斥锁信息
        self.sem_pairs = []              # [(post, wait, var, id)] —— 最近一次管线解析结果
        self.mode = "tarjan"

        self.current_config_dir = None
        self.current_dot_path = None
        self.current_circle_path = None
        self.current_output_dir = None
        self.current_intermediate_dot = None

        # 缓存的图片路径（“查看原始图/强连通分量/信号量图”）
        self.cached_images = {"original": None, "tarjan": None, "threads": None}

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

        # UI
        self._build_ui()
        self._toggle_subtoolbar(False)
        self.use_default()

    # ===================== UI =====================
    def _build_ui(self):
        main = tk.Frame(self.root, bg="#ECEFF1")
        main.pack(fill=tk.BOTH, expand=True, padx=10, pady=10)

        # 左侧
        left = tk.LabelFrame(main, text="操作", bg="#CFD8DC",
                             padx=10, pady=10, font=("Microsoft YaHei", 10, "bold"))
        left.pack(side=tk.LEFT, fill=tk.Y, padx=8, pady=8)

        def btn(text, cmd):
            return tk.Button(left, text=text, command=cmd, width=22, height=2,
                             bg="#ECEFF1", relief=tk.RAISED,
                             activebackground="#CFD8DC", font=("Microsoft YaHei", 9))

        btn("使用默认配置（dag1）", self._wrap_hide(self.use_default)).pack(pady=5)
        btn("选择 dot 文件", self._wrap_hide(self.select_dot_file)).pack(pady=5)
        btn("选择 txt 文件", self._wrap_hide(self.select_txt_file)).pack(pady=5)
        btn("生成原始图", self._wrap_hide(self.generate_original_graph)).pack(pady=5)
        btn("查看互斥锁", self._wrap_hide(self.view_mutex)).pack(pady=5)
        btn("显示互斥锁信息", self._wrap_hide(self.show_mutex_info)).pack(pady=5)
        # 合并入口：生成信号量图
        btn("生成信号量图", self.generate_semaphore_pipeline).pack(pady=5)
        btn("显示信号量信息", self._wrap_hide(self.show_semaphore_info)).pack(pady=5)

        # 右侧
        right = tk.LabelFrame(main, text="可视化", bg="#FFFFFF",
                              font=("Microsoft YaHei", 10, "bold"))
        right.pack(side=tk.RIGHT, fill=tk.BOTH, expand=True, padx=10)

        self.status = tk.Label(right, text="当前配置：<未加载>",
                               anchor="w", bg="#ECEFF1", font=("Consolas", 10))
        self.status.pack(fill=tk.X)

        self.canvas = tk.Canvas(right, bg="#FAFAFA", highlightthickness=1, relief=tk.SUNKEN)
        self.canvas.pack(fill=tk.BOTH, expand=True)

        # 底部子功能区（默认隐藏，仅生成信号量图后显示）
        self.bottom = tk.Frame(right, bg="#ECEFF1")
        def view_btn(text, cmd):
            return tk.Button(self.bottom, text=text, command=cmd, width=18,
                             bg="#ECEFF1", activebackground="#CFD8DC",
                             font=("Microsoft YaHei", 9))
        view_btn("查看原始图", lambda: self._display_cached_image("original")).pack(side=tk.LEFT, padx=4)
        view_btn("查看强连通分量", lambda: self._display_cached_image("tarjan")).pack(side=tk.LEFT, padx=4)
        view_btn("查看信号量图", lambda: self._display_cached_image("threads")).pack(side=tk.LEFT, padx=4)
        view_btn("查看信号量数据结构", self.show_semaphore_structure).pack(side=tk.LEFT, padx=4)
        view_btn("显示线程颜色图例", self.show_thread_legend).pack(side=tk.LEFT, padx=4)

        # 画布交互
        self.canvas.bind("<ButtonPress-1>", self._start_move)
        self.canvas.bind("<B1-Motion>", self._on_move)
        self.canvas.bind("<MouseWheel>", self._on_zoom)
        self.canvas.bind("<Button-4>", lambda e: self._on_zoom(e))
        self.canvas.bind("<Button-5>", lambda e: self._on_zoom(e))

    def _toggle_subtoolbar(self, show: bool):
        # 子功能区显隐控制
        if show:
            if not getattr(self, "_subtoolbar_visible", False):
                self.bottom.pack(fill=tk.X, pady=8)
                self._subtoolbar_visible = True
        else:
            if getattr(self, "_subtoolbar_visible", False):
                self.bottom.pack_forget()
                self._subtoolbar_visible = False

    def _wrap_hide(self, func):
        # 包装器：在执行左侧除“生成信号量图”之外的动作前，隐藏子工具区
        def _inner():
            self._toggle_subtoolbar(False)
            return func()
        return _inner

    # ===================== 状态管理 / 文件加载 =====================
    def _update_status(self):
        cfg = self.current_config_dir or "<未选择>"
        dot = os.path.basename(self.current_dot_path) if self.current_dot_path else "无"
        txt = os.path.basename(self.current_circle_path) if self.current_circle_path else "无"
        self.status.config(text=f"当前配置：{cfg} | DOT: {dot} | TXT: {txt}")

    def _ensure_output_dir(self):
        if not self.current_config_dir:
            self.current_output_dir = self.output_root
            return self.current_output_dir
        info_path = os.path.join(self.output_root, "info.json")
        mapping = {}
        if os.path.exists(info_path):
            try:
                with open(info_path, 'r', encoding='utf-8') as f:
                    mapping = json.load(f)
            except Exception:
                mapping = {}
        key = _md5_path(self.current_config_dir)
        if key in mapping and os.path.exists(mapping[key]):
            self.current_output_dir = mapping[key]
            return self.current_output_dir
        idx = 1
        existing = [d for d in os.listdir(self.output_root) if d.startswith("图")]
        if existing:
            idx = len(existing) + 1
        outdir = os.path.join(self.output_root, f"图{idx}")
        os.makedirs(outdir, exist_ok=True)
        mapping[key] = outdir
        with open(info_path, 'w', encoding='utf-8') as f:
            json.dump(mapping, f, ensure_ascii=False, indent=2)
        self.current_output_dir = outdir
        return outdir

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
        g = nx.relabel_nodes(g, lambda x: _norm(x))
        return g

    def _extract_threads(self):
        threads = set()
        for n in self.G.nodes():
            if '/' in n:
                threads.add(n.split('/')[0])
        self.threads = sorted(threads)
        self.thread_color_map = {
            t: self.THREAD_COLORS[i % len(self.THREAD_COLORS)]
            for i, t in enumerate(self.threads)
        }

    # ===================== 左侧基础功能 =====================
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
                    self._ensure_output_dir()
                    self._update_status()
                    messagebox.showinfo("成功", f"已加载默认配置：{dot}")
                    return
        messagebox.showwarning("提示", "未找到默认 DOT 文件，请手动选择。")

    def select_dot_file(self):
        path = filedialog.askopenfilename(title="选择 DOT 文件",
                                          filetypes=[("DOT 文件", "*.dot")])
        if not path:
            return
        try:
            G_test = self._read_dot_to_graph(path)
        except Exception as e:
            messagebox.showerror("错误", f"读取 .dot 失败：\n{e}")
            return
        self.current_dot_path = path
        self.current_config_dir = os.path.dirname(path)
        self.G = G_test
        self._extract_threads()
        self.mutex_info.clear()
        self.cached_images = {"original": None, "tarjan": None, "threads": None}
        self._ensure_output_dir()
        self._update_status()
        messagebox.showinfo("成功", f"已加载 DOT 文件：{os.path.basename(path)}")

    def select_txt_file(self):
        path = filedialog.askopenfilename(title="选择 TXT 文件",
                                          filetypes=[("TXT 文件", "*.txt")])
        if not path:
            return
        if not os.path.isfile(path):
            messagebox.showerror("错误", "文件不存在。")
            return
        self.current_circle_path = path
        self._update_status()
        messagebox.showinfo("成功", f"已选择 TXT 文件：{os.path.basename(path)}")

    def generate_original_graph(self):
        if not self.current_dot_path:
            messagebox.showerror("错误", "请先选择 dot 文件。")
            return
        out_dir = self._ensure_output_dir()
        out_png = os.path.join(out_dir, "原始图.png")
        try:
            subprocess.run(["dot", "-Tpng", self.current_dot_path, "-o", out_png], check=True)
            self.cached_images["original"] = out_png
            self._show_image(out_png)
            messagebox.showinfo("成功", f"已生成原始图：\n{out_png}")
        except Exception as e:
            messagebox.showerror("错误", f"生成原始图失败：\n{e}")

    # ===================== 合并入口：生成信号量图 =====================
    def generate_semaphore_pipeline(self):
        # 前置
        if not self.current_dot_path:
            messagebox.showerror("错误", "请先加载 dot 文件。")
            return
        if not self.current_circle_path:
            messagebox.showerror("错误", "请先加载 txt 文件。")
            return

        out_dir = self._ensure_output_dir()

        # Step 1: 解析 TXT -> sem_pairs；生成“工作图”(算法上当作实边)
        self.sem_pairs = self._parse_semaphore_pairs()
        work_graph = self.G.copy()
        for post, wait, _, _ in self.sem_pairs:
            if post not in work_graph:
                work_graph.add_node(post)
            if wait not in work_graph:
                work_graph.add_node(wait)
            work_graph.add_edge(post, wait)

        # 写“中间结果 DOT”（展示层写虚线）
        graph_idx = os.path.basename(out_dir).lstrip("图") or "1"
        inter_dir = os.path.join(out_dir, "中间结果")
        os.makedirs(inter_dir, exist_ok=True)
        self.current_intermediate_dot = os.path.join(inter_dir, f"文件图{graph_idx}.dot")

        inter_lines = [
            "digraph G {",
            '  rankdir=LR;',
            '  fontname="Microsoft YaHei";'
        ]
        for u, v in self.G.edges():
            inter_lines.append(f'  "{u}" -> "{v}";')
        for post, wait, var, idx in self.sem_pairs:
            inter_lines.append(
                f'  "{post}" -> "{wait}" [style=dashed, color="#FF7043", label="{var} {idx}"];'
            )
        inter_lines.append("}")
        try:
            with open(self.current_intermediate_dot, 'w', encoding='utf-8') as f:
                f.write("\n".join(inter_lines))
        except Exception as e:
            messagebox.showerror("错误", f"写入中间结果失败：\n{e}")
            return

        # 用中间结果渲染“查看原始图”（要求：不是最初 DOT，而是叠加虚线后的图）
        self.cached_images["original"] = os.path.join(out_dir, "原始图.png")
        self._render_dot_quiet("\n".join(inter_lines), self.cached_images["original"])

        # Step 2: Tarjan（算法上包含 post→wait 的实边）
        self._run_tarjan_on_graph(work_graph, out_dir)

        # Step 3: 矩形框（算法上包含 post→wait 的实边）
        self._generate_threads_on_graph(work_graph, out_dir)

        # 显示信号量图，并展示子功能按钮
        self._display_cached_image("threads")
        self._toggle_subtoolbar(True)
        messagebox.showinfo("完成", "信号量图已生成。")

    # ===================== 互斥锁（保留） =====================
    def view_mutex(self):
        if not self.current_dot_path or not self.current_circle_path:
            messagebox.showerror("错误", "请先加载 dot 与 txt 文件。")
            return
        entries = []
        with open(self.current_circle_path, 'r', encoding='utf-8', errors='ignore') as f:
            for line in f:
                s = _norm(line)
                if not s or s.startswith('信号量') or s.startswith('互斥量'):
                    continue
                parts = s.split()
                if len(parts) < 3:
                    continue
                func, var, idx = parts[0], parts[1], parts[2]
                fl = func.lower()
                if 'pthread_mutex_lock' in fl or '/lock' in fl:
                    entries.append((func, var, idx, 'lock'))
                elif 'pthread_mutex_unlock' in fl or '/unlock' in fl:
                    entries.append((func, var, idx, 'unlock'))
        stacks, pairs = {}, []
        for func, var, idx, typ in entries:
            stacks.setdefault(idx, [])
            if typ == 'lock':
                stacks[idx].append((func, var))
            elif typ == 'unlock' and stacks[idx]:
                lock_func, v = stacks[idx].pop()
                pairs.append((lock_func, func, v, idx))
        if not pairs:
            messagebox.showwarning('提示', '未找到配对的互斥锁记录')
            return

        dot_lines = ['digraph Mutex {', 'rankdir=LR;', 'fontname="Microsoft YaHei";']
        for u, v in self.G.edges():
            dot_lines.append(f'"{u}" -> "{v}";')
        for n in self.G.nodes():
            dot_lines.append(f'"{n}" [shape=box, style=filled, fillcolor="#E3F2FD"];')

        color_map, self.mutex_info, cluster_id = {}, [], 0
        for lock_node, unlock_node, var, idx in pairs:
            L = _norm(lock_node); U = _norm(unlock_node)
            if L not in self.G.nodes or U not in self.G.nodes:
                continue
            reach_from_L = nx.descendants(self.G, L)
            reach_to_U = nx.ancestors(self.G, U)
            between = set(reach_from_L) & set(reach_to_U)
            between.update({L, U})
            self.mutex_info.append([idx, L, U, sorted(between)])
            if var not in color_map:
                color_map[var] = self.MUTEX_COLORS[len(color_map) % len(self.MUTEX_COLORS)]
            color = color_map[var]
            cluster_id += 1
            dot_lines.append(f'subgraph cluster_{cluster_id}{{')
            dot_lines.append(f'label="mutex var: {var} id: {idx}"; color="{color}";')
            for n in between:
                dot_lines.append(f'"{n}";')
            dot_lines.append('}')
        dot_lines.append('}')
        out_dir = self._ensure_output_dir()
        out_png = os.path.join(out_dir, 'mutex.png')
        self._render_dot_to_canvas("\n".join(dot_lines), out_png)

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
            nodes_sorted = sorted(nodes, key=lambda x: (x.split('/')[0] if '/' in x else x, _suffix_num(x)))
            text = (f"ID={idx}\nLOCK: {lock}\nUNLOCK: {unlock}\n"
                    f"COVERED: {', '.join(nodes_sorted)}\n")
            self.canvas.create_text(20, y, anchor="nw",
                                    text=text, font=("Consolas", 11), fill="#263238")
            y += 90
        self.canvas.config(scrollregion=self.canvas.bbox(tk.ALL))

    # ===================== 信号量 =====================
    def _parse_semaphore_pairs(self):
        if not self.current_circle_path:
            return []
        by_id, block = {}, None
        with open(self.current_circle_path, 'r', encoding='utf-8', errors='ignore') as f:
            for line in f:
                s = _norm(line)
                if not s:
                    continue
                if s == "互斥量":
                    block = "mutex"; continue
                if s == "信号量":
                    block = "sem"; continue
                parts = s.split()
                if len(parts) < 3:
                    continue
                func, var, idx = parts[0], parts[1], parts[2]
                if block != "sem":
                    continue
                by_id.setdefault(idx, {"post": None, "wait": None, "var": var})
                if 'sem_post' in func:
                    by_id[idx]['post'] = func
                elif 'sem_wait' in func:
                    by_id[idx]['wait'] = func
        pairs = []
        for idx, info in by_id.items():
            if info['post'] and info['wait']:
                pairs.append((info['post'], info['wait'], info['var'], idx))
        return pairs

    def show_semaphore_info(self):
        pairs = self._parse_semaphore_pairs()
        self.canvas.delete('all')
        y = 20
        self.canvas.create_text(20, y, anchor='nw', text='信号量配对（post → wait）',
                                font=("Microsoft YaHei", 14, 'bold'), fill='#000')
        y += 36
        if not pairs:
            self.canvas.create_text(20, y, anchor='nw',
                                    text='暂无数据，请先加载 txt 或检查内容',
                                    font=("Consolas", 12), fill='#555')
            return
        for post, wait, var, idx in pairs:
            self.canvas.create_text(20, y, anchor='nw',
                                    text=f'ID={idx}  VAR={var}  {post} -> {wait}',
                                    font=("Consolas", 11), fill='#263238')
            y += 24
        self.canvas.config(scrollregion=self.canvas.bbox(tk.ALL))

    def show_semaphore_structure(self):
        if not self.cycle_data:
            messagebox.showerror("错误", "信号量环数据为空，请先生成信号量图。")
            return
        info = ["信号量环数据结构："]
        for cname, threads in self.cycle_data.items():
            info.append(f"\n{cname}:")
            for t, nds in threads.items():
                info.append(f"  {t}: {', '.join(nds)}")
        self.canvas.delete("all")
        self.canvas.create_text(20, 20, anchor="nw",
                                text="\n".join(info), font=("Consolas", 12), fill="#263238")
        self.canvas.config(scrollregion=self.canvas.bbox(tk.ALL))

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
        self.canvas.config(scrollregion=self.canvas.bbox(tk.ALL))

    # ===================== Tarjan/矩形框（保留逻辑） =====================
    def run_tarjan(self):
        if not self.current_dot_path:
            messagebox.showerror("错误", "请先加载 dot 文件。")
            return
        self.sccs = list(nx.strongly_connected_components(self.G))
        self.mode = "tarjan"
        self.generate_graphviz_scc()
        messagebox.showinfo("Tarjan", f"强连通分量数量: {len(self.sccs)}")

    def remove_cycle(self):
        if not self.threads:
            messagebox.showerror("错误", "未检测到线程名，请检查 dot 文件。")
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
            groups = {}
            for node in comp:
                prefix = node.split('/')[0] if '/' in node else "Unknown"
                groups.setdefault(prefix, []).append(node)
            for t in groups:
                groups[t] = sorted(groups[t], key=_suffix_num)
            cname = f"Cycle{len(self.cycle_data) + 1}"
            self.cycle_data[cname] = dict(sorted(groups.items()))

    def generate_graphviz_scc(self):
        dotfile = "temp_graph.dot"
        node_colors = {}

        if self.mode == "tarjan":
            for comp in self.sccs:
                color = "#%06x" % random.randint(0, 0xFFFFFF)
                for node in comp:
                    node_colors[node] = color
        elif self.mode == "thread":
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

        out_dir = self._ensure_output_dir()
        filename = "tarjan.png" if self.mode == "tarjan" else "threads.png"
        img_path = os.path.join(out_dir, filename)
        subprocess.run(["dot", "-Tpng", dotfile, "-o", img_path], check=True)
        self._show_image(img_path)
        os.remove(dotfile)

    # ===================== Tarjan/矩形框（基于管线的输出） =====================
    def _run_tarjan_on_graph(self, graph: nx.DiGraph, out_dir: str):
        self.sccs = list(nx.strongly_connected_components(graph))
        colors = {}
        for comp in self.sccs:
            color = "#%06x" % random.randint(0, 0xFFFFFF)
            for node in comp:
                colors[node] = color

        lines = [
            "digraph Tarjan {",
            '  rankdir=LR;',
            '  fontname="Microsoft YaHei";'
        ]
        for u, v in graph.edges():
            lines.append(f'  "{u}" -> "{v}";')
        # 叠加写入信号量虚线依赖（展示层用虚线）
        for post, wait, var, idx in self.sem_pairs:
            lines.append(f'  "{post}" -> "{wait}" [style=dashed, color="#FF7043", label="{var} {idx}"];')
        for node in graph.nodes():
            col = colors.get(node, "#B0BEC5")
            lines.append(f'  "{node}" [style=filled, fillcolor="{col}"];')
        lines.append("}")

        self.cached_images["tarjan"] = os.path.join(out_dir, "tarjan.png")
        self._render_dot_quiet("\n".join(lines), self.cached_images["tarjan"])

    def _generate_threads_on_graph(self, graph: nx.DiGraph, out_dir: str):
        # 线程配色
        threads = set()
        for n in graph.nodes():
            if '/' in n:
                threads.add(n.split('/')[0])
        self.thread_color_map = {
            t: self.THREAD_COLORS[i % len(self.THREAD_COLORS)]
            for i, t in enumerate(sorted(threads))
        }
        # 构建信号量环
        cycles = {}
        idx = 0
        for comp in self.sccs:
            if len(comp) <= 1:
                continue
            per_thread = {}
            for node in comp:
                prefix = node.split('/')[0] if '/' in node else "Unknown"
                per_thread.setdefault(prefix, []).append(node)
            if len(per_thread) <= 1:
                continue
            for t in per_thread:
                per_thread[t] = sorted(per_thread[t], key=_suffix_num)
            idx += 1
            cycles[f"Cycle{idx}"] = dict(sorted(per_thread.items()))
        self.cycle_data = cycles

        node_colors = {}
        for node in graph.nodes():
            prefix = node.split('/')[0] if '/' in node else "Unknown"
            node_colors[node] = self.thread_color_map.get(prefix, "#CFD8DC")

        lines = [
            "digraph Threads {",
            '  rankdir=LR;',
            '  fontname="Microsoft YaHei";'
        ]
        for u, v in graph.edges():
            lines.append(f'  "{u}" -> "{v}";')
        # 叠加写入信号量虚线依赖
        for post, wait, var, idx in self.sem_pairs:
            lines.append(f'  "{post}" -> "{wait}" [style=dashed, color="#FF7043", label="{var} {idx}"];')

        for cname, tnodes in self.cycle_data.items():
            lines.append(f'  subgraph cluster_{cname} {{')
            lines.append('    style=dashed;')
            lines.append('    color=gray;')
            lines.append(f'    label="{cname}";')
            for t, nds in tnodes.items():
                for node in nds:
                    col = node_colors.get(node, "#FFFFFF")
                    lines.append(f'    "{node}" [style=filled, fillcolor="{col}"];')
            lines.append("  }")

        for node, col in node_colors.items():
            lines.append(f'  "{node}" [style=filled, fillcolor="{col}"];')
        lines.append("}")

        self.cached_images["threads"] = os.path.join(out_dir, "threads.png")
        self._render_dot_quiet("\n".join(lines), self.cached_images["threads"])

    # ===================== 渲染/显示 工具 =====================
    def _render_dot_quiet(self, dot_str: str, out_png: str):
        tmp = "_temp_render.dot"
        with open(tmp, 'w', encoding='utf-8') as f:
            f.write(dot_str)
        try:
            subprocess.run(["dot", "-Tpng", tmp, "-o", out_png], check=True)
        except Exception as e:
            messagebox.showerror("Graphviz 错误", str(e))
        finally:
            if os.path.exists(tmp):
                os.remove(tmp)

    def _render_dot_to_canvas(self, dot_str: str, out_png: str):
        tmp = "_temp_render.dot"
        with open(tmp, 'w', encoding='utf-8') as f:
            f.write(dot_str)
        try:
            subprocess.run(["dot", "-Tpng", tmp, "-o", out_png], check=True)
            self._show_image(out_png)
            messagebox.showinfo("完成", f"已生成图像：\n{out_png}")
        except Exception as e:
            messagebox.showerror("Graphviz 错误", str(e))
        finally:
            if os.path.exists(tmp):
                os.remove(tmp)

    def _display_cached_image(self, key: str):
        path = self.cached_images.get(key)
        if not path or not os.path.exists(path):
            messagebox.showwarning("提示", "对应图像不存在，请先点击“生成信号量图”。")
            return
        self._show_image(path)

    def _show_image(self, path):
        img = Image.open(path)
        self.tk_img = ImageTk.PhotoImage(img)
        self.canvas.delete("all")
        self.canvas.create_image(0, 0, anchor=tk.NW, image=self.tk_img)
        self.canvas.config(scrollregion=self.canvas.bbox(tk.ALL))

    def _start_move(self, e): self.canvas.scan_mark(e.x, e.y)
    def _on_move(self, e): self.canvas.scan_dragto(e.x, e.y, gain=1)
    def _on_zoom(self, e):
        scale = 1.1 if getattr(e, "delta", 0) > 0 or getattr(e, "num", 0) == 4 else 0.9
        self.canvas.scale(tk.ALL, e.x, e.y, scale, scale)
        self.canvas.configure(scrollregion=self.canvas.bbox(tk.ALL))


if __name__ == "__main__":
    root = tk.Tk()
    app = TarjanGUI(root)
    root.mainloop()
