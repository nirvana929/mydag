#!/usr/bin/env python3
from __future__ import annotations

import os
import subprocess
import sys
import tempfile
import threading
import time
import tkinter as tk
from tkinter import filedialog, messagebox
from dataclasses import dataclass
from pathlib import Path
from typing import Optional

from rtl_generator import generate_rtl_from_source
from rtl_filter import filter_rtl
from rtl_rewriter import rewrite_rtl

try:
    from PIL import Image, ImageTk  # type: ignore
except Exception:  # pragma: no cover
    Image = None
    ImageTk = None


@dataclass
class AppState:
    expand_file: Optional[Path] = None
    source_file: Optional[Path] = None
    output_base: Path = Path(".")
    caller: str = ""
    mode_full: bool = False
    simplify: bool = True
    debug: bool = False


class CallyPlusGUI:
    def __init__(self, root: tk.Tk) -> None:
        self.root = root
        self.root.title("Cally++ GUI")
        self.state = AppState()
        self._build_ui()
        self.tk_img: Optional[ImageTk.PhotoImage] = None
        self.current_png: Optional[Path] = None

    # UI
    def _build_ui(self) -> None:
        root = self.root
        root.geometry("1200x800")

        top = tk.Frame(root)
        top.pack(fill=tk.X, padx=10, pady=8)

        # Row 1: expand + source + output
        row1 = tk.Frame(top)
        row1.pack(fill=tk.X, pady=4)

        tk.Label(row1, text="expand:").pack(side=tk.LEFT)
        self.expand_var = tk.StringVar()
        tk.Entry(row1, textvariable=self.expand_var, width=70).pack(side=tk.LEFT, padx=5)
        tk.Button(row1, text="选择…", command=self._choose_expand).pack(side=tk.LEFT)

        tk.Label(row1, text="  源文件(可选):").pack(side=tk.LEFT)
        self.source_var = tk.StringVar()
        tk.Entry(row1, textvariable=self.source_var, width=40).pack(side=tk.LEFT, padx=5)
        tk.Button(row1, text="选择…", command=self._choose_source).pack(side=tk.LEFT)

        # Row 2: caller / mode / simplify / output
        row2 = tk.Frame(top)
        row2.pack(fill=tk.X, pady=4)

        self.mode_var = tk.StringVar(value="caller")
        tk.Radiobutton(row2, text="Caller 图", variable=self.mode_var, value="caller").pack(side=tk.LEFT)
        tk.Radiobutton(row2, text="Full 图", variable=self.mode_var, value="full").pack(side=tk.LEFT)

        tk.Label(row2, text="  根函数:").pack(side=tk.LEFT)
        self.caller_var = tk.StringVar(value="main")
        self.caller_entry = tk.Entry(row2, textvariable=self.caller_var, width=40)
        self.caller_entry.pack(side=tk.LEFT, padx=5)

        self.simplify_var = tk.BooleanVar(value=True)
        tk.Checkbutton(row2, text="简化 C++ 图", variable=self.simplify_var).pack(side=tk.LEFT, padx=10)

        self.debug_var = tk.BooleanVar(value=False)
        tk.Checkbutton(row2, text="Debug", variable=self.debug_var).pack(side=tk.LEFT)

        tk.Label(row2, text="  输出目录:").pack(side=tk.LEFT)
        default_output = Path(__file__).resolve().parent
        self.out_var = tk.StringVar(value=str(default_output))
        tk.Entry(row2, textvariable=self.out_var, width=36).pack(side=tk.LEFT, padx=5)
        tk.Button(row2, text="选择…", command=self._choose_output).pack(side=tk.LEFT)

        # Row 3: actions
        row3 = tk.Frame(top)
        row3.pack(fill=tk.X, pady=6)
        tk.Button(row3, text="生成 RTL", width=12, bg="#90EE90", command=self._generate_rtl).pack(side=tk.LEFT, padx=(0, 4))
        tk.Button(row3, text="生成调用图", width=12, command=self._run_generate).pack(side=tk.LEFT)
        tk.Button(row3, text="打开配置目录", command=self._open_config_dir).pack(side=tk.LEFT, padx=8)
        tk.Button(row3, text="打开图片目录", command=self._open_img_dir).pack(side=tk.LEFT)

        # Body: left log, right image
        body = tk.Frame(root)
        body.pack(fill=tk.BOTH, expand=True)

        # Log box
        left = tk.Frame(body)
        left.pack(side=tk.LEFT, fill=tk.BOTH, expand=False, padx=10)
        tk.Label(left, text="日志").pack(anchor=tk.W)
        self.log = tk.Text(left, width=80, height=30)
        self.log.pack(fill=tk.BOTH, expand=True)

        # Image canvas
        right = tk.Frame(body)
        right.pack(side=tk.RIGHT, fill=tk.BOTH, expand=True, padx=10)
        tk.Label(right, text="预览").pack(anchor=tk.W)
        self.canvas = tk.Canvas(right, bg="#f8f8f8")
        self.canvas.pack(fill=tk.BOTH, expand=True)
        self.canvas.bind("<ButtonPress-1>", self._on_pan_start)
        self.canvas.bind("<B1-Motion>", self._on_pan_drag)
        self.canvas.bind("<MouseWheel>", self._on_zoom)
        self.canvas.bind("<Button-4>", self._on_zoom)  # Linux scroll up
        self.canvas.bind("<Button-5>", self._on_zoom)  # Linux scroll down

        self.original_image = None
        self.display_scale = 1.0
        self.canvas_img_id = None

    # Handlers
    def _choose_expand(self) -> None:
        path = filedialog.askopenfilename(title="选择 .expand 文件", filetypes=[("expand", "*.expand"), ("All", "*.*")])
        if path:
            self.expand_var.set(path)

    def _choose_source(self) -> None:
        path = filedialog.askopenfilename(
            title="选择源文件",
            filetypes=[
                ("C/C++", "*.c *.C *.cc *.cpp *.cxx *.c++"),
                ("All", "*.*"),
            ],
        )
        if path:
            self.source_var.set(path)

    def _choose_output(self) -> None:
        path = filedialog.askdirectory(title="选择输出目录")
        if path:
            self.out_var.set(path)

    def _append_log(self, msg: str) -> None:
        ts = time.strftime("%H:%M:%S")
        self.log.insert(tk.END, f"[{ts}] {msg}\n")
        self.log.see(tk.END)

    def _generate_rtl(self) -> None:
        """生成 RTL expand 文件并进行去改编处理"""
        source_input = self.source_var.get().strip()
        if not source_input:
            messagebox.showerror("错误", "请先选择源文件")
        return

    @staticmethod
    def _source_subdir(path: Path) -> Optional[Path]:
        """查找路径在 source/ 下的子目录（用于配置输出结构）"""
        for parent in path.parents:
            if parent.name == "source":
                try:
                    rel = path.parent.relative_to(parent)
                    return None if rel == Path(".") else rel
                except ValueError:
                    continue
        return None
        source = Path(source_input).expanduser()
        if not source.exists():
            messagebox.showerror("错误", f"源文件不存在: {source}")
            return
        
        # 开始生成
        self._append_log("=" * 60)
        self._append_log(f"开始为 {source.name} 生成 RTL expand 文件...")
        
        # 在后台线程中执行，避免界面卡死
        threading.Thread(
            target=self._do_generate_rtl,
            args=(source,),
            daemon=True
        ).start()
    
    def _do_generate_rtl(self, source: Path) -> None:
        """实际执行 RTL 生成和过滤"""
        # 步骤 1: 生成 RTL expand 文件
        self._append_log("步骤 1/4: 编译生成 RTL expand 文件...")
        
        try:
            expand_file = generate_rtl_from_source(
                str(source),
                compile_flags="-O0 -std=c++17",
                output_dir=str(source.parent),
                debug=self.debug_var.get()
            )
            
            if not expand_file:
                self._append_log("✗ RTL 生成失败")
                return
            
            expand_path = Path(expand_file)
            expand_size = expand_path.stat().st_size / 1024  # KB
            self._append_log(f"✓ RTL 文件生成成功: {expand_path.name}")
            self._append_log(f"  文件大小: {expand_size:.1f} KB")
            
        except Exception as e:
            self._append_log(f"✗ RTL 生成出错: {e}")
            if self.debug_var.get():
                import traceback
                self._append_log(traceback.format_exc())
            return

        # 步骤 2: 改编 RTL（符号去改编）
        self._append_log("步骤 2/4: 改编 RTL（符号去改编）...")
        rewrite_result = rewrite_rtl(str(expand_path), debug=self.debug_var.get())
        if rewrite_result:
            expand_path = rewrite_result.final_path
            expand_size = expand_path.stat().st_size / 1024  # 更新为改编后的大小
            self._append_log(f"✓ 改编完成: {expand_path.name}")
            if self.debug_var.get():
                self._append_log(f"  改编详情: {rewrite_result.summary()}")
        else:
            self._append_log("⚠ 改编失败，继续使用原始 RTL")
        
        # 步骤 3: 过滤 RTL 文件
        self._append_log("步骤 3/4: 过滤 RTL 文件...")
        
        try:
            filtered_file = filter_rtl(str(expand_path), debug=self.debug_var.get())
            
            if not filtered_file:
                self._append_log("⚠ RTL 过滤失败，将使用原始文件")
                filtered_path = expand_path
            else:
                filtered_path = Path(filtered_file)
                filtered_size = filtered_path.stat().st_size / 1024  # KB
                reduction = (1 - filtered_size / expand_size) * 100
                self._append_log(f"✓ RTL 过滤成功: {filtered_path.name}")
                self._append_log(f"  过滤后大小: {filtered_size:.1f} KB")
                self._append_log(f"  压缩率: {reduction:.1f}%")
                
                # 使用过滤后的文件
                expand_path = filtered_path
            
        except Exception as e:
            self._append_log(f"⚠ RTL 过滤出错: {e}")
            self._append_log("  将使用原始 RTL 文件")
        
        # 步骤 4: 解析并验证
        self._append_log("步骤 4/4: 解析并验证...")
        
        try:
            # 导入去改编模块
            from rtl_parser import RTLParser
            
            # 创建解析器（改编后符号可读，无需再启用去改编）
            parser = RTLParser(enable_demangle=False, debug=self.debug_var.get())
            
            # 解析文件
            self._append_log(f"  解析 RTL 文件...")
            graph = parser.parse_file(str(expand_path))
            
            total_funcs = len(graph.functions)
            self._append_log(f"✓ 解析完成，共 {total_funcs} 个函数")
            
            self._append_log("=" * 60)
            self._append_log("✓ RTL 文件生成、过滤并验证完成！")
            self._append_log(f"  文件路径: {expand_path}")
            self._append_log(f"  可以点击「生成调用图」继续处理")
            self._append_log("=" * 60)
            
            # 自动填充到 expand 输入框
            self.expand_var.set(str(expand_path))
            
            # 弹出成功提示
            messagebox.showinfo(
                "成功",
                f"RTL 文件已生成、过滤并验证完成！\n\n"
                f"文件: {expand_path.name}\n"
                f"函数数量: {total_funcs}\n\n"
                f"已自动填充到 expand 输入框"
            )
            
        except ImportError as e:
            self._append_log(f"✗ 导入模块失败: {e}")
            self._append_log(f"  请确保 rtl_parser.py 在同一目录")
        except Exception as e:
            self._append_log(f"✗ 解析验证失败: {e}")
            if self.debug_var.get():
                import traceback
                self._append_log(traceback.format_exc())

    def _run_generate(self) -> None:
        expand_input = self.expand_var.get().strip()
        expand = Path(expand_input).expanduser() if expand_input else None
        caller = self.caller_var.get().strip()
        mode = self.mode_var.get()
        out_base = Path(self.out_var.get()).expanduser()
        out_base.mkdir(parents=True, exist_ok=True)
        simplify = self.simplify_var.get()
        debug = self.debug_var.get()
        source = Path(self.source_var.get()).expanduser() if self.source_var.get().strip() else None

        if (not expand or not expand.exists()) and source and source.exists():
            expand = self._build_expand_from_source(source)
            if not expand:
                return
            self.expand_var.set(str(expand))

        if not expand or not expand.exists():
            messagebox.showerror("错误", "请先选择有效的 expand 文件或源文件")
            return

        cmd = [sys.executable, str(Path(__file__).with_name("generate.py")), "--expand", str(expand)]
        if mode == "full":
            cmd.append("--full")
        else:
            if not caller:
                messagebox.showerror("错误", "Caller 模式需要填写根函数名")
                return
            cmd += ["--caller", caller]
        cmd += ["--output-base", str(out_base)]
        if simplify:
            cmd.append("--simplify-cxx")
            if source and source.exists():
                cmd += ["--source-hint", str(source)]
        if debug:
            cmd.append("--debug")

        self._append_log("运行: " + " ".join(cmd))
        threading.Thread(
            target=self._run_and_update,
            args=(cmd, expand, out_base, mode, simplify),
            daemon=True,
        ).start()

    def _run_and_update(self, cmd: list[str], expand: Path, out_base: Path, mode: str, simplify: bool) -> None:
        try:
            proc = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
            self._append_log(proc.stdout)
        except Exception as e:
            self._append_log(f"执行出错: {e}")
            return

        # 推断输出文件名
        base = expand.stem
        if base.endswith('.233r'):
            base = base[:-5]
        subdir = self._source_subdir(expand)
        cfg_dir = out_base / "config"
        img_dir = out_base / "img"
        if subdir:
            cfg_dir = cfg_dir / subdir
            img_dir = img_dir / subdir
        cfg_dir = cfg_dir / base
        suffix = "full" if mode == "full" else "caller"
        png = img_dir / f"{base}_{suffix}.png"
        if simplify:
            simple_png = img_dir / f"{base}_{suffix}_simple.png"
            if simple_png.exists():
                png = simple_png

        if png.exists():
            self._append_log(f"显示图片: {png}")
            self._show_image(png)
        else:
            self._append_log("未找到输出 PNG")

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

        # 回退: 让系统打开图片
        try:
            if sys.platform.startswith("linux"):
                subprocess.Popen(["xdg-open", str(path)])
            elif sys.platform == "darwin":
                subprocess.Popen(["open", str(path)])
            else:
                os.startfile(str(path))  # type: ignore
        except Exception as e:
            messagebox.showinfo("提示", f"请手动打开图片:\n{path}\n错误: {e}")

    def _open_config_dir(self) -> None:
        expand = Path(self.expand_var.get()).expanduser()
        if not expand.exists():
            return
        base = expand.stem
        if base.endswith('.233r'):
            base = base[:-5]
        subdir = self._source_subdir(expand)
        cfg_dir = Path(self.out_var.get()).expanduser() / "config"
        if subdir:
            cfg_dir = cfg_dir / subdir
        cfg_dir = cfg_dir / base
        self._open_dir(cfg_dir)

    def _open_img_dir(self) -> None:
        expand = Path(self.expand_var.get()).expanduser()
        subdir = self._source_subdir(expand) if expand.exists() else None
        img_dir = Path(self.out_var.get()).expanduser() / "img"
        if subdir:
            img_dir = img_dir / subdir
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

    # Build expand --------------------------------------------------------
    def _build_expand_from_source(self, source: Path) -> Optional[Path]:
        if not source.exists():
            messagebox.showerror("错误", "源文件不存在")
            return None

        workdir = source.parent
        self._append_log(f"编译源文件生成 expand: {source}")

        try:
            tmp = tempfile.NamedTemporaryFile(dir=workdir, suffix=".o", delete=False)
            tmp_name = Path(tmp.name).name
            tmp.close()
        except Exception as e:
            messagebox.showerror("错误", f"创建临时文件失败: {e}")
            return None

        cmd = [
            "g++",
            "-O0",
            "-std=c++17",
            "-fdump-rtl-expand",
            "-c",
            source.name,
            "-o",
            tmp_name,
        ]

        try:
            proc = subprocess.run(cmd, cwd=workdir, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
            self._append_log(proc.stdout)
        finally:
            try:
                (workdir / tmp_name).unlink(missing_ok=True)
            except Exception:
                pass

        if proc.returncode != 0:
            messagebox.showerror("错误", f"编译失败，无法生成 expand。命令输出已记录日志。")
            return None

        expands = sorted(workdir.glob(f"{source.name}*.expand"), key=lambda p: p.stat().st_mtime, reverse=True)
        if not expands:
            messagebox.showerror("错误", "未在源文件目录找到生成的 expand")
            return None

        expand_path = expands[0]
        self._append_log(f"使用 expand: {expand_path}")
        return expand_path

    # Canvas interactions -------------------------------------------------
    def _render_image(self) -> None:
        if not (self.original_image and Image and ImageTk):
            return
        img = self.original_image
        scale = max(0.2, min(self.display_scale, 5.0))
        if abs(scale - 1.0) > 1e-3:
            new_size = (
                max(1, int(img.width * scale)),
                max(1, int(img.height * scale)),
            )
            img = img.resize(new_size, Image.LANCZOS)
        self.tk_img = ImageTk.PhotoImage(img)
        self.canvas.delete("all")
        self.canvas_img_id = self.canvas.create_image(0, 0, anchor=tk.NW, image=self.tk_img)
        self.canvas.config(scrollregion=self.canvas.bbox(tk.ALL))

    def _on_pan_start(self, event):
        self.canvas.scan_mark(event.x, event.y)

    def _on_pan_drag(self, event):
        self.canvas.scan_dragto(event.x, event.y, gain=1)

    def _on_zoom(self, event):
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


def main() -> int:
    root = tk.Tk()
    app = CallyPlusGUI(root)
    root.mainloop()
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
