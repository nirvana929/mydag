import tkinter as tk
from tkinter import simpledialog, messagebox, filedialog
import networkx as nx
import random
import subprocess
import os


class TarjanGUI:
    def __init__(self, root):
        self.root = root
        self.root.title("Tarjan 强连通分量可视化")

        # 初始化图
        self.G = nx.DiGraph()
        self.sccs = []  # 保存 Tarjan 结果

        # 按钮区
        btn_add_node = tk.Button(root, text="添加节点", command=self.add_node)
        btn_add_node.pack()

        btn_add_edge = tk.Button(root, text="添加边", command=self.add_edge)
        btn_add_edge.pack()

        btn_load_dot = tk.Button(root, text="从 DOT 文件加载图", command=self.load_dot)
        btn_load_dot.pack()

        btn_run = tk.Button(root, text="运行 Tarjan 算法并生成美观图", command=self.run_tarjan)
        btn_run.pack()

        # 确保 dag图 文件夹存在
        self.output_dir = os.path.join(os.getcwd(), "dag图")
        os.makedirs(self.output_dir, exist_ok=True)

    def add_node(self):
        node = simpledialog.askstring("添加节点", "输入节点名称：")
        if node:
            self.G.add_node(node)
            messagebox.showinfo("提示", f"已添加节点 {node}")

    def add_edge(self):
        u = simpledialog.askstring("添加边", "输入起点：")
        v = simpledialog.askstring("添加边", "输入终点：")
        if u and v:
            self.G.add_edge(u, v)
            messagebox.showinfo("提示", f"已添加边 {u} → {v}")

    def load_dot(self):
        file_path = filedialog.askopenfilename(
            title="选择 DOT 文件",
            filetypes=[("DOT files", "*.dot"), ("All files", "*.*")]
        )
        if file_path:
            try:
                self.G = nx.DiGraph(nx.nx_pydot.read_dot(file_path))
                messagebox.showinfo("提示", f"已加载 DOT 文件: {file_path}")
            except Exception as e:
                messagebox.showerror("错误", f"加载 DOT 文件失败: {e}")

    def run_tarjan(self):
        if not self.G:
            messagebox.showerror("错误", "当前图为空，无法运行 Tarjan")
            return

        # 运行 Tarjan 算法
        self.sccs = list(nx.strongly_connected_components(self.G))
        messagebox.showinfo("Tarjan 结果", f"强连通分量: {self.sccs}")

        # 自动调用 Graphviz 美观绘图
        self.generate_graphviz_scc()

    def generate_graphviz_scc(self):
        dotfile = "temp_graph.dot"

        # 给每个 SCC 随机分配颜色
        node_colors = {}
        for comp in self.sccs:
            color = "#%06x" % random.randint(0, 0xFFFFFF)
            for node in comp:
                node_colors[node] = color

        # 写 dot 文件
        with open(dotfile, "w") as f:
            f.write("digraph G {\n")
            f.write("  rankdir=LR;\n")  # 从左到右布局
            for u, v in self.G.edges():
                f.write(f'  "{u}" -> "{v}";\n')
            for node in self.G.nodes():
                if node in node_colors:
                    f.write(f'  "{node}" [style=filled, fillcolor="{node_colors[node]}"];\n')
            f.write("}\n")

        # 找到下一个文件编号
        existing = [f for f in os.listdir(self.output_dir) if f.startswith("图") and f.endswith(".png")]
        next_index = len(existing) + 1
        outfile = os.path.join(self.output_dir, f"图{next_index}.png")

        # 调用 graphviz 渲染
        try:
            subprocess.run(["dot", "-Tpng", dotfile, "-o", outfile], check=True)
            messagebox.showinfo("提示", f"已生成美观图: {outfile}")

            # 自动打开图片
            subprocess.run(["xdg-open", outfile], check=False)
        except Exception as e:
            messagebox.showerror("错误", f"Graphviz 调用失败: {e}")
        finally:
            if os.path.exists(dotfile):
                os.remove(dotfile)


if __name__ == "__main__":
    root = tk.Tk()
    app = TarjanGUI(root)
    root.mainloop()
