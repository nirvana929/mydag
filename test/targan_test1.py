import tkinter as tk
from tkinter import simpledialog, messagebox, filedialog
import networkx as nx
import random
import subprocess
import os
import re


class TarjanGUI:
    def __init__(self, root):
        self.root = root
        self.root.title("Tarjan 强连通分量可视化")

        # 初始化图
        self.G = nx.DiGraph()
        self.sccs = []  # 保存 Tarjan 结果
        self.threads = []  # 保存线程名
        self.cycle_data = {}  # 保存信号量环数据结构

        # 按钮区
        btn_add_node = tk.Button(root, text="添加节点", command=self.add_node)
        btn_add_node.pack()

        btn_add_edge = tk.Button(root, text="添加边", command=self.add_edge)
        btn_add_edge.pack()

        btn_load_dot = tk.Button(root, text="从 DOT 文件加载图", command=self.load_dot)
        btn_load_dot.pack()

        btn_load_threads = tk.Button(root, text="选择线程名文件", command=self.load_threads)
        btn_load_threads.pack()

        btn_run = tk.Button(root, text="运行 Tarjan 算法并生成美观图", command=self.run_tarjan)
        btn_run.pack()

        btn_remove_cycle = tk.Button(root, text="去除环", command=self.remove_cycle)
        btn_remove_cycle.pack()

        btn_show_semaphore = tk.Button(root, text="读取信号量数据结构", command=self.show_semaphore_structure)
        btn_show_semaphore.pack()

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

    def load_threads(self):
        """选择线程名文件并加载"""
        file_path = filedialog.askopenfilename(
            title="选择线程名文件",
            filetypes=[("Text files", "*.txt"), ("All files", "*.*")]
        )
        if file_path:
            try:
                with open(file_path, 'r') as f:
                    self.threads = [line.strip().replace('"', '') for line in f.readlines()]
                messagebox.showinfo("提示", f"已加载线程名文件: {file_path}")
            except Exception as e:
                messagebox.showerror("错误", f"加载线程名文件失败: {e}")

    def run_tarjan(self):
        if not self.G:
            messagebox.showerror("错误", "当前图为空，无法运行 Tarjan")
            return

        # 运行 Tarjan 算法
        self.sccs = list(nx.strongly_connected_components(self.G))
        messagebox.showinfo("Tarjan 结果", f"强连通分量: {self.sccs}")

        # 自动调用 Graphviz 美观绘图
        self.generate_graphviz_scc()

    def remove_cycle(self):
        if not self.threads:
            messagebox.showerror("错误", "线程名文件未加载，请先加载线程名文件")
            return

        # 删除交叉依赖关系
        self.G.remove_edge("Thread1/1_3", "Thread2/2_1")
        self.G.remove_edge("Thread2/2_3", "Thread3/3_1")
        self.G.remove_edge("Thread3/3_3", "Thread1/1_1")

        # 生成信号量环
        self.create_semaphore_cycles()

        messagebox.showinfo("去环", "已删除交叉依赖关系并生成信号量环")

        # 重新生成图
        self.generate_graphviz_scc()

    def create_semaphore_cycles(self):
        """生成信号量环"""
        self.cycle_data = {}

        # 遍历图中的强连通分量，找到符合信号量环条件的分量
        for component in self.sccs:
            if len(component) > 1:  # 节点数大于1
                thread_nodes = {}
                # 遍历环中的每个节点，分类到相应的线程中
                for node in component:
                    # 假设线程名称格式为 "Thread1/1_1" ，提取线程名称
                    match = re.match(r"(Thread\d+)", node)
                    if match:
                        thread = match.group(1)
                        if thread not in thread_nodes:
                            thread_nodes[thread] = []
                        thread_nodes[thread].append(node)

                # 判断该强连通分量是否为有效的信号量环（即有多个线程）
                if len(thread_nodes) > 1:
                    cycle_name = f"Cycle{len(self.cycle_data) + 1}"
                    self.cycle_data[cycle_name] = thread_nodes

                    # 对每个线程中的节点进行排序，按节点后缀排序
                    for thread, nodes in thread_nodes.items():
                        # 排序：根据节点名中的后缀数字进行排序
                        thread_nodes[thread] = sorted(nodes, key=lambda x: int(x.split('_')[1]))

                    # 为每个线程的首尾节点连接到环节点
                    cycle_counter = 1
                    for thread, nodes in thread_nodes.items():
                        # 首节点是该线程节点列表的第一个节点
                        first_node = nodes[0]
                        # 尾节点是该线程节点列表的最后一个节点
                        last_node = nodes[-1]
                        print(f"线程 {thread} 的首节点: {first_node}, 尾节点: {last_node}")

                        # 连接首尾节点
                        self.G.add_edge(first_node, cycle_name)  # 首节点连接环
                        self.G.add_edge(cycle_name, last_node)  # 尾节点连接环
                        for node in nodes[1:-1]:  # 中间节点连接环
                            self.G.add_edge(node, cycle_name)
                            self.G.add_edge(cycle_name, node)

    def show_semaphore_structure(self):
        """显示信号量数据结构"""
        if not self.cycle_data:
            messagebox.showerror("错误", "信号量环数据结构为空，请先生成信号量环")
            return

        # 显示信号量环数据结构
        structure = "信号量环数据结构：\n"
        for cycle, thread_nodes in self.cycle_data.items():
            structure += f"\n{cycle}:"
            for thread, thread_nodes_list in thread_nodes.items():
                structure += f"\n  {thread}: {', '.join(thread_nodes_list)}"
        messagebox.showinfo("信号量数据结构", structure)

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
