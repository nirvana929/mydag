#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os, hashlib, json, subprocess
import tkinter as tk
from tkinter import ttk, filedialog, messagebox
from PIL import Image, ImageTk
import networkx as nx
from typing import Optional


# ========== 工具函数 ==========
def md5_of_path(path: str) -> str:
    return hashlib.md5(os.path.abspath(path).encode()).hexdigest()


def find_file(folder: str, suffix: str) -> Optional[str]:
    try:
        for f in sorted(os.listdir(folder)):
            if f.lower().endswith(suffix):
                return os.path.join(folder, f)
    except Exception:
        return None
    return None


# ========== 主类 ==========
class TarjanGUI:
    def __init__(self, root):
        self.root = root
        self.root.title("Tarjan 强连通分量与去环可视化 - 图像浏览版")
        self.root.geometry("1400x800")

        # 状态
        self.G = nx.DiGraph()
        self.threads = []
        self.sccs = []
        self.cycle_data = {}
        self.mode = "scc"
        self.config_dir = None
        self.output_dir = os.path.join(os.getcwd(), "dag图")
        os.makedirs(self.output_dir, exist_ok=True)

        self.palette = [
            "#64B5F6", "#81C784", "#FFD54F", "#BA68C8", "#4DB6AC",
            "#E57373", "#FF8A65", "#90A4AE", "#F06292", "#A1887F",
            "#4FC3F7", "#AED581", "#FFB74D", "#9575CD", "#26A69A",
        ]
        self.thread_colors = {}
        self.scc_colors = {}

        # 图像浏览状态
        self.current_img = None
        self.zoom = 1.0
        self.min_zoom, self.max_zoom = 0.2, 4.0
        self.img_tk = None

        self._build_ui()
        self._apply_style()

    # ========== UI 构建 ==========
    def _build_ui(self):
        main = ttk.Frame(self.root, padding=8)
        main.pack(fill=tk.BOTH, expand=True)
        main.columnconfigure(0, weight=0, minsize=280)
        main.columnconfigure(1, weight=0, minsize=220)
        main.columnconfigure(2, weight=1)
        main.rowconfigure(0, weight=1)

        # 左侧控制区
        ctrl = ttk.LabelFrame(main, text="操作区", padding=10)
        ctrl.grid(row=0, column=0, sticky="nsew", padx=(0, 8))
        self._build_controls(ctrl)

        # 中间浏览区
        browser = ttk.LabelFrame(main, text="图像浏览区", padding=6)
        browser.grid(row=0, column=1, sticky="nsew", padx=(0, 8))
        self._build_browser(browser)

        # 右侧画布区
        vis = ttk.LabelFrame(main, text="图像预览", padding=6)
        vis.grid(row=0, column=2, sticky="nsew")
        self._build_canvas(vis)

        # 底部状态栏
        self.status = ttk.Label(self.root, text="就绪", anchor="w", padding=6)
        self.status.pack(fill=tk.X, side=tk.BOTTOM)

    def _apply_style(self):
        style = ttk.Style()
        style.configure("TFrame", background="#0f172a")
        style.configure("TLabelframe", background="#0f172a", foreground="#e5e7eb")
        style.configure("TLabel", background="#0f172a", foreground="#e5e7eb")
        style.configure("TButton", padding=8)
        self.root.configure(background="#0f172a")

    # ========== 控制区 ==========
    def _build_controls(self, frame):
        ttk.Button(frame, text="使用默认配置", command=self.use_default).pack(fill="x", pady=4)
        ttk.Button(frame, text="选择配置文件夹", command=self.load_config_folder).pack(fill="x", pady=4)
        ttk.Separator(frame).pack(fill="x", pady=6)
        ttk.Button(frame, text="运行 Tarjan", command=self.run_tarjan).pack(fill="x", pady=4)
        ttk.Button(frame, text="去环并生成矩形框", command=self.remove_cycle).pack(fill="x", pady=4)
        ttk.Button(frame, text="显示信号量结构", command=self.show_cycles).pack(fill="x", pady=4)
        ttk.Separator(frame).pack(fill="x", pady=6)
        ttk.Button(frame, text="刷新浏览区", command=self.refresh_browser).pack(fill="x", pady=4)
        ttk.Button(frame, text="打开当前文件夹", command=self.open_current_folder).pack(fill="x", pady=4)
        ttk.Separator(frame).pack(fill="x", pady=6)
        self.lbl_cfg = ttk.Label(frame, text="配置文件夹: 未加载", wraplength=240)
        self.lbl_cfg.pack(fill="x", pady=4)

    # ========== 浏览区 ==========
    def _build_browser(self, frame):
        frame.rowconfigure(0, weight=1)
        frame.columnconfigure(0, weight=1)
        self.listbox = tk.Listbox(frame, selectmode=tk.SINGLE, background="#0f172a", fg="#e5e7eb")
        self.listbox.grid(row=0, column=0, sticky="nsew")
        self.listbox.bind("<Double-Button-1>", self._on_image_double_click)
        ttk.Button(frame, text="打开选中图像", command=self._open_selected_image).grid(row=1, column=0, sticky="ew", pady=4)

    def refresh_browser(self):
        """扫描 dag图/ 文件夹，刷新列表"""
        self.listbox.delete(0, tk.END)
        for folder in sorted(os.listdir(self.output_dir)):
            fpath = os.path.join(self.output_dir, folder)
            if not os.path.isdir(fpath):
                continue
            for img in sorted(os.listdir(fpath)):
                if img.lower().endswith(".png"):
                    self.listbox.insert(tk.END, os.path.join(fpath, img))
        self._set_status("已刷新浏览列表")

    def _on_image_double_click(self, event):
        self._open_selected_image()

    def _open_selected_image(self):
        sel = self.listbox.curselection()
        if not sel:
            return
        img_path = self.listbox.get(sel[0])
        self._show_image(img_path)
        self._set_status(f"已打开图像: {img_path}")

    # ========== 画布显示 ==========
    def _build_canvas(self, frame):
        frame.rowconfigure(0, weight=1)
        frame.columnconfigure(0, weight=1)
        self.canvas = tk.Canvas(frame, background="#0b1020", highlightthickness=0)
        hbar = ttk.Scrollbar(frame, orient=tk.HORIZONTAL, command=self.canvas.xview)
        vbar = ttk.Scrollbar(frame, orient=tk.VERTICAL, command=self.canvas.yview)
        self.canvas.configure(xscrollcommand=hbar.set, yscrollcommand=vbar.set)
        self.canvas.grid(row=0, column=0, sticky="nsew")
        vbar.grid(row=0, column=1, sticky="ns")
        hbar.grid(row=1, column=0, sticky="ew")

        self.canvas.bind("<ButtonPress-1>", self._start_pan)
        self.canvas.bind("<B1-Motion>", self._do_pan)
        self.canvas.bind("<MouseWheel>", self._on_mousewheel)
        self.canvas.bind("<Button-4>", lambda e: self._zoom_at(e.x, e.y, 1.1))
        self.canvas.bind("<Button-5>", lambda e: self._zoom_at(e.x, e.y, 1/1.1))

    def _show_image(self, path):
        try:
            img = Image.open(path)
            self.current_img = img
            self.zoom = 1.0
            self._render_image()
        except Exception as e:
            messagebox.showerror("错误", str(e))

    def _render_image(self):
        if not self.current_img:
            return
        w, h = self.current_img.size
        new_size = (int(w * self.zoom), int(h * self.zoom))
        resized = self.current_img.resize(new_size, Image.LANCZOS)
        self.img_tk = ImageTk.PhotoImage(resized)
        self.canvas.delete("all")
        self.canvas.create_image(0, 0, anchor="nw", image=self.img_tk)
        self.canvas.config(scrollregion=(0, 0, new_size[0], new_size[1]))

    def _on_mousewheel(self, event):
        factor = 1.1 if event.delta > 0 else 1/1.1
        self._zoom_at(event.x, event.y, factor)

    def _zoom_at(self, x, y, factor):
        new_zoom = max(self.min_zoom, min(self.max_zoom, self.zoom * factor))
        if abs(new_zoom - self.zoom) < 1e-3:
            return
        self.zoom = new_zoom
        self._render_image()

    def _start_pan(self, e):
        self.canvas.scan_mark(e.x, e.y)

    def _do_pan(self, e):
        self.canvas.scan_dragto(e.x, e.y, gain=1)

    def open_current_folder(self):
        """打开当前输出文件夹"""
        try:
            subprocess.run(["xdg-open", self.output_dir])
        except Exception as e:
            messagebox.showerror("错误", str(e))

    # ========== 配置加载、算法、颜色、生成图，与 targan_test3 一致 ==========
    def use_default(self):
        default_path = os.path.join(os.getcwd(), "配置文件", "dag1")
        if not os.path.exists(default_path):
            messagebox.showerror("错误", "默认配置文件夹不存在")
            return
        self.load_config_folder(default_path)

    def load_config_folder(self, folder=None):
        if folder is None:
            folder = filedialog.askdirectory(title="选择配置文件夹")
        if not folder:
            return
        dot_file = find_file(folder, ".dot")
        txt_file = find_file(folder, ".txt")
        if not dot_file or not txt_file:
            messagebox.showerror("错误", f"未找到 .dot 或 .txt 文件\n{folder}")
            return
        self.G = nx.DiGraph(nx.nx_pydot.read_dot(dot_file))
        with open(txt_file, "r", encoding="utf-8", errors="ignore") as f:
            self.threads = [line.strip().replace('"', '') for line in f if line.strip()]
        self.config_dir = folder
        self.lbl_cfg.config(text=f"配置文件夹: {folder}")
        self._set_status(f"已加载配置文件夹: {folder}")

    def _get_output_folder(self):
        md5v = md5_of_path(self.config_dir)
        info_path = os.path.join(self.output_dir, "info.json")
        mapping = {}
        if os.path.exists(info_path):
            with open(info_path, "r", encoding="utf-8") as f:
                mapping = json.load(f)
        if md5v in mapping and os.path.exists(mapping[md5v]):
            return mapping[md5v]
        idx = len([d for d in os.listdir(self.output_dir) if d.startswith("图")]) + 1
        folder = os.path.join(self.output_dir, f"图{idx}")
        os.makedirs(folder, exist_ok=True)
        mapping[md5v] = folder
        with open(info_path, "w", encoding="utf-8") as f:
            json.dump(mapping, f, ensure_ascii=False, indent=2)
        return folder

    def run_tarjan(self):
        if not self.G:
            messagebox.showerror("错误", "请先加载配置文件")
            return
        self.sccs = list(nx.strongly_connected_components(self.G))
        self.mode = "scc"
        folder = self._get_output_folder()
        target = os.path.join(folder, "scc.png")
        self._generate_graph(target)
        self.refresh_browser()
        messagebox.showinfo("完成", f"已生成 Tarjan 图：{target}")

    def remove_cycle(self):
        if not self.sccs:
            messagebox.showerror("错误", "请先运行 Tarjan")
            return
        self.mode = "threads"
        self._create_cycles()
        folder = self._get_output_folder()
        target = os.path.join(folder, "threads.png")
        self._generate_graph(target)
        self.refresh_browser()
        messagebox.showinfo("完成", f"已生成矩形框图：{target}")

    def _create_cycles(self):
        self.cycle_data.clear()
        for comp in self.sccs:
            if len(comp) <= 1:
                continue
            thr = {}
            for n in comp:
                prefix = n.split('/')[0]
                thr.setdefault(prefix, []).append(n)
            if len(thr) > 1:
                cname = f"Cycle{len(self.cycle_data)+1}"
                self.cycle_data[cname] = thr

    def _color_for_scc(self, node):
        for i, comp in enumerate(self.sccs):
            if node in comp:
                if i not in self.scc_colors:
                    self.scc_colors[i] = self.palette[i % len(self.palette)]
                return self.scc_colors[i]
        return "#BDBDBD"

    def _color_for_thread(self, node):
        prefix = node.split('/')[0]
        if prefix not in self.thread_colors:
            self.thread_colors[prefix] = self.palette[len(self.thread_colors) % len(self.palette)]
        return self.thread_colors[prefix]

    def _generate_graph(self, output_png):
        dotfile = output_png.replace(".png", ".dot")
        with open(dotfile, "w", encoding="utf-8") as f:
            f.write('digraph G {\n  rankdir=LR;\n  node [shape=box, style=filled];\n')
            for u, v in self.G.edges():
                f.write(f'  "{u}" -> "{v}";\n')
            for node in self.G.nodes():
                col = self._color_for_scc(node) if self.mode == "scc" else self._color_for_thread(node)
                f.write(f'  "{node}" [fillcolor="{col}"];\n')
            if self.mode == "threads":
                for cname, thr in self.cycle_data.items():
                    f.write(f'  subgraph cluster_{cname} {{\n    label="{cname}"; style=dashed; color="#90A4AE";\n')
                    for t, nds in thr.items():
                        for n in nds:
                            col = self._color_for_thread(n)
                            f.write(f'    "{n}" [fillcolor="{col}"];\n')
                    f.write("  }\n")
            f.write("}\n")
        subprocess.run(["dot", "-Tpng", dotfile, "-o", output_png], check=True)

    def show_cycles(self):
        if not self.cycle_data:
            messagebox.showinfo("信息", "当前无信号量环。")
            return
        info = ""
        for cname, thr in self.cycle_data.items():
            info += f"{cname}:\n"
            for t, nds in thr.items():
                info += f"  {t}: {', '.join(nds)}\n"
        messagebox.showinfo("信号量结构", info)

    def _set_status(self, text):
        self.status.config(text=text)


if __name__ == "__main__":
    root = tk.Tk()
    TarjanGUI(root)
    root.mainloop()
