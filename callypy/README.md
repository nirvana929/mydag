# callypy：Python 调用图测试与生成

该目录提供一套最小可用的 Python 线程/函数调用示例与调用图生成工具（动态采样法）。

## 快速开始

1) 运行一键脚本（会生成 DOT 与 PNG）

```bash
cd mydag
python3 callypy/generate.py
```

- 源代码：`callypy/source/demo_threads.py`
- DOT：`callypy/config/demo_threads.py/demo_threads.py.dot`
- PNG：`callypy/img/demo_threads.py_caller.png`

2) 自定义输入脚本

```bash
python3 callypy/generate.py \
  --input callypy/source/demo_threads.py \
  --args "--loops 2" \
  --root demo_threads:main
```

- `--args` 会在被测脚本的 `__main__` 中可读取（如用 `argparse`）。
- `--root` 用于在 PNG 渲染时高亮某个入口（格式：`<模块>:<函数>`）。

## 目录结构

- `source/`：示例 Python 脚本（包含多线程与函数间调用）
- `callgraph.py`：动态采样生成调用图（基于 `sys.setprofile` + `threading.setprofile`）
- `render_dot.py`：DOT→PNG 渲染（基于 networkx + matplotlib）
- `generate.py`：一键流程（运行示例→采样→导出 DOT→渲染 PNG）

## 依赖

- Python 3.8+
- `matplotlib`, `networkx`（脚本会自动检测，如缺失请：`pip3 install --user networkx matplotlib`）

---

注意：动态采样仅记录实际运行路径的调用边；若要覆盖更多路径，请调整示例脚本或参数使之执行到相应分支。
