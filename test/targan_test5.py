#!/usr/bin/env python3
# =========================================================
# Tarjan 强连通分量可视化系统（整合版）
# =========================================================
# 说明（在 targan_test4 基础上增量整合）：
# - 保留原有 Tarjan / 线程矩形框（去环）/ 环数据结构展示 / 画布交互。
# - 增加：
#   1) 使用默认配置（test/配置文件/dag1）与选择 .dot / .txt 文件。
#   2) 生成原始图。
#   3) 互斥锁视图与信息（覆盖区域算法，来自 mutex_test1 思路）。
#   4) 信号量叠加图与信息（post→wait，来自 mutex_test2 思路）。
#   5) 输出采用 dag图/图N/ 归档（仿 targan_test3）。
# =========================================================

import tkinter as tk
from tkinter import filedialog, messagebox
import os, re, io, json, subprocess, random, hashlib
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
        self.root.title("Tarjan 强连通分量可视化（v6）")
        self.root.geometry("1380x860")
        self.root.configure(bg="#ECEFF1")

        # 基础路径
        self.dot_dir = os.path.join(os.getcwd(), "配置文件")
        self.output_root = os.path.join(os.getcwd(), "dag图")
        os.makedirs(self.output_root, exist_ok=True)

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
        self.mutex_info = []  # [ [id, lock, unlock, covered_nodes(list)] ]

        # 输出目录索引
        self.current_output_dir = None  # dag图/图N

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

    # === 新增：输出目录映射（仿 targan_test3） ===
    def _ensure_output_dir(self):
        if not self.current_config_dir:
            # 没有配置目录时，退化到根 dag图 直接输出
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
        # 新建 图N
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
        # 规范化节点名
        g = nx.relabel_nodes(g, lambda x: _norm(x))
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
        self._ensure_output_dir()
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
                    self._ensure_output_dir()
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
        out_dir = self._ensure_output_dir()
        out_png = os.path.join(out_dir, "原始图.png")
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
                groups[t] = sorted(groups[t], key=_suffix_num)
            cname = f"Cycle{len(self.cycle_data) + 1}"
            self.cycle_data[cname] = dict(sorted(groups.items()))

    # =====================================================
    # 互斥锁显示 / 信息输出
    # =====================================================
    # === 新增功能：互斥锁视图（覆盖区域算法） ===
    def view_mutex(self):
        if not self.current_dot_path:
            messagebox.showerror("错误", "请先加载 dot 文件。")
            return
        if not self.current_circle_path:
            messagebox.showerror("错误", "请先加载 txt 文件。")
            return
        # 解析互斥量段
        entries = []  # (func, var, id, type)
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

        # 配对 lock/unlock（按 id 使用栈）
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

        # 计算覆盖区域并生成 DOT
        # 边
        dot_lines = ['digraph Mutex {', 'rankdir=LR;', 'fontname="Microsoft YaHei";']
        for u, v in self.G.edges():
            dot_lines.append(f'"{u}" -> "{v}";')
        # 节点默认样式
        for n in self.G.nodes():
            dot_lines.append(f'"{n}" [shape=box, style=filled, fillcolor="#E3F2FD"];')

        # 颜色分配
        color_map = {}
        color_list = self.MUTEX_COLORS

        self.mutex_info = []
        cluster_id = 0
        for i, (lock_node, unlock_node, var, idx) in enumerate(pairs, 1):
            L = _norm(lock_node)
            U = _norm(unlock_node)
            if L not in self.G.nodes or U not in self.G.nodes:
                continue
            reach_from_L = nx.descendants(self.G, L)
            reach_to_U = nx.ancestors(self.G, U)
            between = set(reach_from_L) & set(reach_to_U)
            between.update({L, U})

            self.mutex_info.append([idx, L, U, sorted(between)])

            if var not in color_map:
                color_map[var] = color_list[len(color_map) % len(color_list)]
            color = color_map[var]

            cluster_id += 1
            dot_lines.append(f'subgraph cluster_{cluster_id} {{')
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
            # 排序：线程名 + 尾号
            nodes_sorted = sorted(nodes, key=lambda x: (x.split('/')[0] if '/' in x else x, _suffix_num(x)))
            text = (f"ID={idx}\nLOCK: {lock}\nUNLOCK: {unlock}\n"
                    f"COVERED: {', '.join(nodes_sorted)}\n")
            self.canvas.create_text(20, y, anchor="nw",
                                    text=text, font=("Consolas", 11), fill="#263238")
            y += 90

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

    # === 新增功能：信号量图（叠加）与信息 ===
    def _parse_semaphore_pairs(self):
        if not self.current_circle_path:
            return []
        by_id = {}
        with open(self.current_circle_path, 'r', encoding='utf-8', errors='ignore') as f:
            for line in f:
                s = _norm(line)
                if not s or s.startswith('互斥量'):
                    continue
                parts = s.split()
                if len(parts) < 3:
                    continue
                func, var, idx = parts[0], parts[1], parts[2]
                if 'sem_post' in func:
                    by_id.setdefault(idx, {"post": None, "wait": None, "var": var})
                    by_id[idx]['post'] = func
                elif 'sem_wait' in func:
                    by_id.setdefault(idx, {"post": None, "wait": None, "var": var})
                    by_id[idx]['wait'] = func
        pairs = []
        for idx, info in by_id.items():
            if info['post'] and info['wait']:
                pairs.append((info['post'], info['wait'], info['var'], idx))
        return pairs

    def view_semaphore_graph(self):
        if not (self.current_dot_path and self.current_circle_path):
            messagebox.showerror('错误', '请先选择 dot 与 txt 文件')
            return
        pairs = self._parse_semaphore_pairs()
        dot_lines = ['digraph Semaphore {', 'rankdir=LR;', 'fontname="Microsoft YaHei";']
        for u, v in self.G.edges():
            dot_lines.append(f'"{u}" -> "{v}";')
        for post, wait, var, idx in pairs:
            dot_lines.append(f'"{post}" -> "{wait}" [style=dashed, color="#FF7043", label="{var} {idx}"];')
        dot_lines.append('}')
        out_dir = self._ensure_output_dir()
        out_png = os.path.join(out_dir, 'semaphore.png')
        self._render_dot_to_canvas("\n".join(dot_lines), out_png)

    def show_semaphore_info(self):
        pairs = self._parse_semaphore_pairs()
        self.canvas.delete('all')
        y = 20
        self.canvas.create_text(20, y, anchor='nw', text='信号量配对（post → wait）',
                                font=("Microsoft YaHei", 14, 'bold'), fill='#000')
        y += 36
        if not pairs:
            self.canvas.create_text(20, y, anchor='nw', text='暂无数据，请先加载 txt 或检查内容',
                                    font=("Consolas", 12), fill='#555')
            return
        for post, wait, var, idx in pairs:
            self.canvas.create_text(20, y, anchor='nw',
                                    text=f'ID={idx}  VAR={var}  {post} -> {wait}',
                                    font=("Consolas", 11), fill='#263238')
            y += 24

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

        out_dir = self._ensure_output_dir()
        img = os.path.join(out_dir, f"{self.mode}.png")
        subprocess.run(["dot", "-Tpng", dotfile, "-o", img], check=True)
        self._show_image(img)
        os.remove(dotfile)

    # === 复用：将 DOT 字符串渲染并在画布显示，同时落盘 ===
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
