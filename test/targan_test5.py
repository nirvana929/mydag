#!/usr/bin/env python3
# =========================================================
# Tarjan 强连通分量可视化系统（增强版 + 原始图 + 互斥锁 + 目录解析增强 + 当前配置状态）
# =========================================================
# 说明：
# - 保留原有功能（Tarjan、线程矩形框、信号量结构展示、画布交互）
# - 新增/修复：
#   1) 选择配置文件夹：严格以用户选择的目录为根，递归寻找 .dot；circle 仅在同目录匹配 *circle*.txt
#   2) 使用默认配置：优先加载 配置文件/dag1
#   3) 生成原始图 & 查看互斥锁：均基于“当前配置”；切换配置后立即生效
#   4) 状态栏：实时显示当前配置目录 / DOT / CIRCLE
#   5) 加强 DOT 读取容错（pydot→networkx 双分支）
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
        self.root.title("Tarjan 强连通分量可视化（增强版）")
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

        # 当前配置（会被覆盖）
        self.current_config_dir = None
        self.current_dot_path = None
        self.current_circle_path = None

        # 线程颜色
        self.THREAD_COLORS = [
            "#90CAF9", "#A5D6A7", "#FFE082", "#F48FB1",
            "#CE93D8", "#FFAB91", "#80CBC4", "#B39DDB"
        ]
        self.thread_color_map = {}

        # 互斥锁可视化
        self.MUTEX_COLORS = [
            "#FFB74D", "#81C784", "#64B5F6", "#BA68C8",
            "#E57373", "#4DB6AC", "#FFD54F", "#9575CD",
            "#4FC3F7", "#AED581", "#FF8A65", "#BA68C8"
        ]
        self.mutex_color_map = {}
        self.mutex_info = []  # [ [编号, [节点...]], ... ]

        # UI
        self._build_ui()
        self.use_default()

    # ===================== UI =====================
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

        # 配置相关（覆盖当前配置）
        btn("使用默认配置（dag1）", self.use_default).pack(pady=5)
        btn("选择配置文件（文件夹）", self.select_config_dir).pack(pady=5)

        # 基于当前配置生成/查看
        btn("生成原始图", self.generate_original_graph).pack(pady=5)
        btn("查看互斥锁", self.view_mutex).pack(pady=5)
        btn("显示互斥锁信息", self.show_mutex_info).pack(pady=5)

        # 原有功能（保留）
        btn("运行 Tarjan 算法", self.run_tarjan).pack(pady=5)
        btn("生成矩形框(线程配色)", self.remove_cycle).pack(pady=5)
        btn("查看信号量数据结构", self.show_semaphore_structure).pack(pady=5)
        btn("显示线程颜色图例", self.show_thread_legend).pack(pady=5)

        # 右侧
        right = tk.LabelFrame(main, text="可视化", bg="#FFFFFF",
                              font=("Microsoft YaHei", 10, "bold"))
        right.pack(side=tk.RIGHT, fill=tk.BOTH, expand=True, padx=10)

        # 当前配置状态栏
        self.status = tk.Label(right, text="当前配置：<未加载>",
                               anchor="w", bg="#ECEFF1",
                               font=("Consolas", 10))
        self.status.pack(fill=tk.X)

        self.canvas = tk.Canvas(right, bg="#FAFAFA", highlightthickness=1, relief=tk.SUNKEN)
        self.canvas.pack(fill=tk.BOTH, expand=True)

        self.canvas.bind("<ButtonPress-1>", self._start_move)
        self.canvas.bind("<B1-Motion>", self._on_move)
        self.canvas.bind("<MouseWheel>", self._on_zoom)

    # ===================== 状态栏 =====================
    def _update_status(self):
        cfg = self.current_config_dir or "<未选择>"
        dot = os.path.basename(self.current_dot_path) if self.current_dot_path else "无"
        cir = os.path.basename(self.current_circle_path) if self.current_circle_path else "无"
        self.status.config(text=f"当前配置：{cfg} | DOT: {dot} | CIRCLE: {cir}")

    # ===================== 目录解析（严格以选中目录为根） =====================
    def _find_first_dot_recursively(self, base_dir: str):
        """在 base_dir 下递归找第一个 .dot 文件；返回 .dot 的绝对路径；找不到返回 None"""
        for root, _, files in os.walk(base_dir):
            for f in sorted(files):
                if f.lower().endswith(".dot"):
                    return os.path.join(root, f)
        return None

    def _pick_circle_in_same_dir(self, dot_path: str):
        """只在 dot 所在目录挑选 circle：匹配 *circle*.txt（忽略大小写）；找不到返回 None"""
        if not dot_path:
            return None
        d = os.path.dirname(dot_path)
        for f in sorted(os.listdir(d)):
            if f.lower().endswith(".txt") and "circle" in f.lower():
                return os.path.join(d, f)
        return None

    # ===================== 配置装载 =====================
    def use_default(self):
        """强制加载 配置文件/dag1；不存在则在 配置文件/ 下递归解析；再不行深度遍历找到第一个 dot。"""
        # 1) 首选 dag1
        dag1 = os.path.join(self.dot_dir, "dag1")
        if os.path.isdir(dag1):
            dot = self._find_first_dot_recursively(dag1)
            if dot:
                self.current_config_dir = os.path.dirname(dot)
                self.current_dot_path = dot
                self.current_circle_path = self._pick_circle_in_same_dir(dot)
                self._load_graph_from_current_dot()
                return

        # 2) 回退：在 配置文件/ 下递归找
        if os.path.isdir(self.dot_dir):
            dot = self._find_first_dot_recursively(self.dot_dir)
            if dot:
                self.current_config_dir = os.path.dirname(dot)
                self.current_dot_path = dot
                self.current_circle_path = self._pick_circle_in_same_dir(dot)
                self._load_graph_from_current_dot()
                return

        messagebox.showwarning("提示", "未找到默认 DOT 文件，请手动选择。")
        self._update_status()

    def select_config_dir(self):
        """选择配置文件夹（覆盖当前配置）；严格以用户选择的目录为根进行递归搜索。"""
        folder = filedialog.askdirectory(title="选择配置文件夹")
        if not folder:
            return
        dot = self._find_first_dot_recursively(folder)
        if not dot:
            messagebox.showerror("错误", "该目录（及其子目录）未找到 .dot 文件。")
            return
        self.current_config_dir = os.path.dirname(dot)
        self.current_dot_path = dot
        self.current_circle_path = self._pick_circle_in_same_dir(dot)
        self._load_graph_from_current_dot()

    def _load_graph_from_current_dot(self):
        """读取 self.current_dot_path 到 self.G，并刷新状态；包含 pydot→networkx 容错。"""
        try:
            # 首选：nx.nx_pydot.read_dot
            try:
                self.G = nx.DiGraph(nx.nx_pydot.read_dot(self.current_dot_path))
            except Exception:
                # 备选：pydot 转 nx
                if pydot is None:
                    raise
                graphs = pydot.graph_from_dot_file(self.current_dot_path)
                if not graphs:
                    raise RuntimeError("pydot 解析 dot 失败")
                self.G = nx.DiGraph(nx.nx_pydot.from_pydot(graphs[0]))
            # 线程信息与状态刷新
            self._extract_threads()
            self.mutex_info.clear()
            self._update_status()
            msg = f"加载成功：\nDOT：{os.path.basename(self.current_dot_path)}"
            if self.current_circle_path:
                msg += f"\nCIRCLE：{os.path.basename(self.current_circle_path)}"
            messagebox.showinfo("成功", msg)
        except Exception as e:
            messagebox.showerror("错误", f"加载 DOT 失败：\n{e}")
            self._update_status()

    def _extract_threads(self):
        threads = set()
        for n in self.G.nodes():
            if "/" in n:
                threads.add(n.split("/")[0])
        self.threads = sorted(threads)
        self.thread_color_map = {t: self.THREAD_COLORS[i % len(self.THREAD_COLORS)]
                                 for i, t in enumerate(self.threads)}
        print(f"[INFO] 线程：{self.threads}")

    # ===================== 原有功能：Tarjan 与线程矩形框 =====================
    def run_tarjan(self):
        if not self.current_dot_path:
            messagebox.showerror("错误", "请先加载配置（dot）。")
            return
        self.sccs = list(nx.strongly_connected_components(self.G))
        self.mode = "tarjan"
        self._render_graphviz()
        messagebox.showinfo("Tarjan", f"强连通分量数量: {len(self.sccs)}")

    def remove_cycle(self):
        if not self.current_dot_path:
            messagebox.showerror("错误", "请先加载配置（dot）。")
            return
        if not self.threads:
            messagebox.showerror("错误", "未检测到线程名，请检查 dot 节点命名。")
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
        print(f"[INFO] 信号量环数量: {len(self.cycle_data)}")

    # ===================== 原有功能：Graphviz 绘图 =====================
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

            if self.mode == "thread" and self.cycle_data:
                for cname, tnodes in self.cycle_data.items():
                    f.write(f'  subgraph cluster_{cname} {{\n    style=dashed;\n    color=gray;\n    label="{cname}";\n')
                    for _, nds in tnodes.items():
                        for n in nds:
                            col = colors.get(n, "#FFFFFF")
                            f.write(f'    "{n}" [style=filled, fillcolor="{col}"];\n')
                    f.write("  }\n")

            for n, col in colors.items():
                f.write(f'  "{n}" [style=filled, fillcolor="{col}"];\n')
            f.write("}\n")

        img = os.path.join(self.output_dir, f"图{len(os.listdir(self.output_dir)) + 1}.png")
        subprocess.run(["dot", "-Tpng", dotfile, "-o", img], check=True)
        self._show_image(img)
        os.remove(dotfile)

    # ===================== 新增：原始图 & 互斥锁 =====================
    def generate_original_graph(self):
        """直接用当前 dot 生成原始图（不做任何处理）"""
        if not self.current_dot_path:
            messagebox.showerror("错误", "请先加载配置（dot）。")
            return
        out_png = os.path.join(self.output_dir, "原始图.png")
        try:
            subprocess.run(["dot", "-Tpng", self.current_dot_path, "-o", out_png], check=True)
            self._show_image(out_png)
            messagebox.showinfo("成功", f"已生成原始图：\n{out_png}")
        except Exception as e:
            messagebox.showerror("错误", f"生成原始图失败：\n{e}")

    def view_mutex(self):
        """
        基于当前配置：
        - circle 第1列=节点名；第2列=变量名；第3列=编号（为空跳过）
        - lock/unlock 配对，同编号一把锁
        - 覆盖节点：可从 lock 达到 ∩ 可到达 unlock；若空则至少包含 lock/unlock
        - 矩形框以变量名命名，同变量名同色
        """
        if not self.current_dot_path:
            messagebox.showerror("错误", "请先加载配置（dot）。")
            return
        if not self.current_circle_path or not os.path.isfile(self.current_circle_path):
            messagebox.showerror("错误", "未检测到 circle 文件或文件不存在。")
            return

        # 读取最新 dot（避免用户修改后未重启）
        try:
            try:
                self.G = nx.DiGraph(nx.nx_pydot.read_dot(self.current_dot_path))
            except Exception:
                if pydot is None:
                    raise
                graphs = pydot.graph_from_dot_file(self.current_dot_path)
                if not graphs:
                    raise RuntimeError("pydot 解析 dot 失败")
                self.G = nx.DiGraph(nx.nx_pydot.from_pydot(graphs[0]))
        except Exception as e:
            messagebox.showerror("错误", f"读取 DOT 失败：\n{e}")
            return

        entries = self._parse_circle_mutex(self.current_circle_path)
        pairs = self._pair_mutex_lock_unlock(entries)
        if not pairs:
            messagebox.showinfo("提示", "未形成有效互斥锁配对或编号为空。")
            return

        covered_by_id, var_by_id = {}, {}
        for lock, unlock, var, mid in pairs:
            if lock not in self.G or unlock not in self.G:
                continue
            reach_from_lock = nx.descendants(self.G, lock) | {lock}
            reach_to_unlock = nx.ancestors(self.G, unlock) | {unlock}
            covered = sorted(list(reach_from_lock & reach_to_unlock))
            if not covered:
                covered = [lock, unlock]
            covered_by_id.setdefault(mid, set()).update(covered)
            var_by_id[mid] = var

        self.mutex_info = [[mid, sorted(list(nodes))] for mid, nodes in covered_by_id.items()]

        self.mutex_color_map.clear()
        for var in set(var_by_id.values()):
            self.mutex_color_map[var] = self.MUTEX_COLORS[len(self.mutex_color_map) % len(self.MUTEX_COLORS)]

        # 输出互斥锁图
        tmp_dot = "temp_mutex.dot"
        try:
            with open(tmp_dot, "w", encoding="utf-8") as f:
                f.write('digraph G {\n  rankdir=LR;\n  fontname="Microsoft YaHei";\n')
                for u, v in self.G.edges():
                    f.write(f'  "{u}" -> "{v}";\n')
                for mid, nodes in self.mutex_info:
                    var = var_by_id.get(mid, "mutex")
                    color = self.mutex_color_map.get(var, "#B0BEC5")
                    f.write(f'  subgraph cluster_{mid} {{\n    style=dashed;\n    color="{color}";\n    label="{var}";\n')
                    for n in nodes:
                        f.write(f'    "{n}";\n')
                    f.write("  }\n")
                f.write("}\n")

            out_png = os.path.join(self.output_dir, "原始图_互斥锁.png")
            subprocess.run(["dot", "-Tpng", tmp_dot, "-o", out_png], check=True)
            self._show_image(out_png)
            messagebox.showinfo("完成", f"已生成互斥锁可视化：\n{out_png}")
        except Exception as e:
            messagebox.showerror("错误", f"生成互斥锁图失败：\n{e}")
        finally:
            if os.path.exists(tmp_dot):
                try: os.remove(tmp_dot)
                except: pass

    def _parse_circle_mutex(self, circle_path):
        """解析 circle 的“互斥量”段（或包含 pthread_mutex_* 的行）；第三列编号为空则跳过。"""
        entries, in_mutex = [], False
        try:
            with open(circle_path, "r", encoding="utf-8") as f:
                for raw in f:
                    line = raw.strip()
                    if not line:
                        continue
                    if "互斥量" in line:
                        in_mutex = True
                        continue
                    if "信号量" in line:
                        in_mutex = False
                        continue
                    if not in_mutex and not re.search(r"pthread_mutex_(lock|unlock)", line):
                        continue
                    parts = re.split(r"\s+", line)
                    if len(parts) < 2:
                        continue
                    node, var = parts[0], parts[1]
                    mid = parts[2] if len(parts) >= 3 else ""
                    if not mid:
                        continue
                    entries.append((node, var, mid))
        except Exception as e:
            messagebox.showerror("错误", f"解析 circle 失败：\n{e}")
            return []
        return entries

    def _pair_mutex_lock_unlock(self, entries):
        """顺序配对 lock/unlock → [(lock, unlock, var, id), ...]"""
        stacks, pairs = {}, []
        for node, var, mid in entries:
            if re.search(r"pthread_mutex_lock", node):
                stacks.setdefault(mid, []).append((node, var))
            elif re.search(r"pthread_mutex_unlock", node):
                st = stacks.get(mid, [])
                if st:
                    lock_node, lock_var = st.pop()
                    pairs.append((lock_node, node, lock_var, mid))
        return pairs

    # ===================== 原有：文本展示/图交互 =====================
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
        self.canvas.create_text(20, 20, anchor="nw",
                                text="\n".join(text), font=("Consolas", 12), fill="#263238")
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

    def show_mutex_info(self):
        if not self.mutex_info:
            messagebox.showwarning("提示", "暂无互斥锁信息，请先点击“查看互斥锁”。")
            return
        self.canvas.delete("all")
        y = 20
        self.canvas.create_text(20, y, anchor="nw",
                                text="互斥锁信息（编号 → 覆盖节点列表）：",
                                font=("Microsoft YaHei", 13, "bold"), fill="#212121")
        y += 30
        for mid, nodes in sorted(self.mutex_info, key=lambda x: str(x[0])):
            line = f"[{mid}] → {', '.join(nodes)}"
            self.canvas.create_text(30, y, anchor="nw", text=line,
                                    font=("Consolas", 11), fill="#263238")
            y += 24
        self.canvas.config(scrollregion=self.canvas.bbox(tk.ALL))

    # 画布交互
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
