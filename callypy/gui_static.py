#!/usr/bin/env python3
from __future__ import annotations

import os
import subprocess
import sys
import threading
import time
import tkinter as tk
from tkinter import filedialog, messagebox
from dataclasses import dataclass
from pathlib import Path
from typing import Optional, List

try:
    from PIL import Image, ImageTk  # type: ignore
except Exception:  # pragma: no cover
    Image = None
    ImageTk = None


def _current_time() -> str:
    return time.strftime("%H:%M:%S")


@dataclass
class UIState:
    source: Optional[Path] = None
    output_base: Path = Path(".")
    mode: str = "caller"  # caller | full | thread
    caller: str = "main"
    simplify: bool = True
    debug: bool = False


class CallyPyGUI:
    def __init__(self, root: tk.Tk) -> None:
        self.root = root
        self.root.title("CallyPy Static GUI")
        self.state = UIState()
        self._build_ui()
        self.tk_img: Optional[ImageTk.PhotoImage] = None
        self.original_image = None
        self.display_scale = 1.0
        self.canvas_img_id = None
        self.current_png: Optional[Path] = None

    # ------------------------------------------------------------------ UI
    def _build_ui(self) -> None:
        self.root.geometry("1200x800")
        top = tk.Frame(self.root)
        top.pack(fill=tk.X, padx=10, pady=8)

        # Row 1: source + output
        row1 = tk.Frame(top)
        row1.pack(fill=tk.X, pady=4)

        tk.Label(row1, text="源文件:").pack(side=tk.LEFT)
        self.source_var = tk.StringVar()
        tk.Entry(row1, textvariable=self.source_var, width=70).pack(side=tk.LEFT, padx=5)
        tk.Button(row1, text="选择…", command=self._choose_source).pack(side=tk.LEFT)

        tk.Label(row1, text="  输出目录:").pack(side=tk.LEFT)
        self.out_var = tk.StringVar(value=str(Path("callypy_output").resolve()))
        tk.Entry(row1, textvariable=self.out_var, width=40).pack(side=tk.LEFT, padx=5)
        tk.Button(row1, text="选择…", command=self._choose_output).pack(side=tk.LEFT)

        # Row 2: mode + caller + options
        row2 = tk.Frame(top)
        row2.pack(fill=tk.X, pady=4)

        self.mode_var = tk.StringVar(value="caller")
        tk.Radiobutton(row2, text="Caller 图", variable=self.mode_var, value="caller", command=self._toggle_inputs).pack(side=tk.LEFT)
        tk.Radiobutton(row2, text="Full 图", variable=self.mode_var, value="full", command=self._toggle_inputs).pack(side=tk.LEFT)
        tk.Radiobutton(row2, text="Thread Only", variable=self.mode_var, value="thread", command=self._toggle_inputs).pack(side=tk.LEFT)

        tk.Label(row2, text="  根函数:").pack(side=tk.LEFT)
        self.caller_var = tk.StringVar(value="main")
        self.caller_entry = tk.Entry(row2, textvariable=self.caller_var, width=40)
        self.caller_entry.pack(side=tk.LEFT, padx=5)

        self.simplify_var = tk.BooleanVar(value=True)
        tk.Checkbutton(row2, text="简化图", variable=self.simplify_var).pack(side=tk.LEFT, padx=10)
        self.debug_var = tk.BooleanVar(value=False)
        tk.Checkbutton(row2, text="Debug", variable=self.debug_var).pack(side=tk.LEFT)

        # Row3: buttons
        row3 = tk.Frame(top)
        row3.pack(fill=tk.X, pady=6)
        tk.Button(row3, text="生成", width=12, command=self._run_generate).pack(side=tk.LEFT)
        tk.Button(row3, text="打开配置目录", command=self._open_config_dir).pack(side=tk.LEFT, padx=8)
        tk.Button(row3, text="打开图片目录", command=self._open_img_dir).pack(side=tk.LEFT)

        # Body (log + preview)
        body = tk.Frame(self.root)
        body.pack(fill=tk.BOTH, expand=True)

        left = tk.Frame(body)
        left.pack(side=tk.LEFT, fill=tk.BOTH, expand=False, padx=10)
        tk.Label(left, text="日志").pack(anchor=tk.W)
        self.log_box = tk.Text(left, width=80, height=30)
        self.log_box.pack(fill=tk.BOTH, expand=True)

        right = tk.Frame(body)
        right.pack(side=tk.RIGHT, fill=tk.BOTH, expand=True, padx=10)
        tk.Label(right, text="预览").pack(anchor=tk.W)
        self.canvas = tk.Canvas(right, bg="#f8f8f8")
        self.canvas.pack(fill=tk.BOTH, expand=True)
        self.canvas.bind("<ButtonPress-1>", self._on_pan_start)
        self.canvas.bind("<B1-Motion>", self._on_pan_drag)
        self.canvas.bind("<MouseWheel>", self._on_zoom)
        self.canvas.bind("<Button-4>", self._on_zoom)
        self.canvas.bind("<Button-5>", self._on_zoom)

    # ---------------------------------------------------------------- events
    def _toggle_inputs(self) -> None:
        mode = self.mode_var.get()
        state = tk.NORMAL if mode == "caller" else tk.DISABLED
        self.caller_entry.config(state=state)

    def _choose_source(self) -> None:
        path = filedialog.askopenfilename(
            title="选择 Python 源文件",
            filetypes=[("Python", "*.py"), ("All", "*.*")],
        )
        if path:
            self.source_var.set(path)

    def _choose_output(self) -> None:
        path = filedialog.askdirectory(title="选择输出目录")
        if path:
            self.out_var.set(path)

    def _append_log(self, msg: str) -> None:
        self.log_box.insert(tk.END, f"[{_current_time()}] {msg}\n")
        self.log_box.see(tk.END)

    def _run_generate(self) -> None:
        source = Path(self.source_var.get().strip()).expanduser()
        if not source.exists():
            messagebox.showerror("错误", "请先选择有效的 Python 源文件")
            return
        out_base = Path(self.out_var.get()).expanduser()
        out_base.mkdir(parents=True, exist_ok=True)

        mode = self.mode_var.get()
        caller = self.caller_var.get().strip()
        simplify = self.simplify_var.get()
        debug = self.debug_var.get()

        cmd = [sys.executable, str(Path(__file__).with_name("generate_static.py")), "--source", str(source), "--output-base", str(out_base)]
        graph_type = "caller"
        if mode == "full":
            cmd.append("--full")
            graph_type = "full"
        elif mode == "thread":
            cmd.append("--thread-only")
            graph_type = "thread_only"
        else:
            if not caller:
                messagebox.showerror("错误", "Caller 模式需要指定根函数")
                return
            cmd += ["--caller", caller]

        if simplify:
            cmd.append("--simplify")
        if debug:
            cmd.append("--debug")

        self._append_log("运行: " + " ".join(cmd))
        threading.Thread(
            target=self._run_and_update,
            args=(cmd, source, out_base, graph_type, simplify),
            daemon=True,
        ).start()

    def _run_and_update(self, cmd: List[str], source: Path, out_base: Path, graph_type: str, simplify: bool) -> None:
        proc = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
        self._append_log(proc.stdout)

        base = source.stem
        cfg_dir = out_base / "config" / base
        img_dir = out_base / "img"
        png = img_dir / f"{base}_{graph_type}.png"
        if simplify:
            simple_png = img_dir / f"{base}_{graph_type}_simple.png"
            if simple_png.exists():
                png = simple_png
        if png.exists():
            self._append_log(f"显示图片: {png}")
            self._show_image(png)
        else:
            self._append_log("未找到输出 PNG")

    # ---------------------------------------------------------------- image
    def _show_image(self, path: Path) -> None:
        self.current_png = path
        if Image and ImageTk:
            try:
                self.original_image = Image.open(path)
                self.display_scale = 1.0
                self._render_image()
                return
            except Exception as e:
                self._append_log(f"PIL 显示失败: {e}")
                self.original_image = None

        try:
            if sys.platform.startswith("linux"):
                subprocess.Popen(["xdg-open", str(path)])
            elif sys.platform == "darwin":
                subprocess.Popen(["open", str(path)])
            else:
                os.startfile(str(path))  # type: ignore
        except Exception as e:
            messagebox.showinfo("提示", f"请手动打开图片:\n{path}\n错误: {e}")

    def _render_image(self) -> None:
        if not (Image and ImageTk and self.original_image):
            return
        img = self.original_image
        scale = max(0.2, min(self.display_scale, 5.0))
        if abs(scale - 1.0) > 1e-3:
            new_size = (max(1, int(img.width * scale)), max(1, int(img.height * scale)))
            img = img.resize(new_size, Image.LANCZOS)
        self.tk_img = ImageTk.PhotoImage(img)
        self.canvas.delete("all")
        self.canvas_img_id = self.canvas.create_image(0, 0, anchor=tk.NW, image=self.tk_img)
        self.canvas.config(scrollregion=self.canvas.bbox(tk.ALL))

    def _on_pan_start(self, event) -> None:
        self.canvas.scan_mark(event.x, event.y)

    def _on_pan_drag(self, event) -> None:
        self.canvas.scan_dragto(event.x, event.y, gain=1)

    def _on_zoom(self, event) -> None:
        if self.original_image is None:
            return
        delta = 0
        if getattr(event, "delta", 0):
            delta = event.delta
        elif getattr(event, "num", None) == 4:
            delta = 120
        elif getattr(event, "num", None) == 5:
            delta = -120
        if delta == 0:
            return
        factor = 1.1 if delta > 0 else 0.9
        self.display_scale = max(0.2, min(5.0, self.display_scale * factor))
        self._render_image()

    # ---------------------------------------------------------------- open dir
    def _open_config_dir(self) -> None:
        source = Path(self.source_var.get().strip())
        if not source.exists():
            return
        base = source.stem
        cfg_dir = Path(self.out_var.get()).expanduser() / "config" / base
        self._open_dir(cfg_dir)

    def _open_img_dir(self) -> None:
        img_dir = Path(self.out_var.get()).expanduser() / "img"
        self._open_dir(img_dir)

    def _open_dir(self, path: Path) -> None:
        try:
            path.mkdir(parents=True, exist_ok=True)
            if sys.platform.startswith("linux"):
                subprocess.Popen(["xdg-open", str(path)])
            elif sys.platform == "darwin":
                subprocess.Popen(["open", str(path)])
            else:
                os.startfile(str(path))  # type: ignore
        except Exception as e:
            messagebox.showerror("错误", f"打开目录失败: {e}")


def main() -> int:
    root = tk.Tk()
    app = CallyPyGUI(root)
    root.mainloop()
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
