import re

def generate_circle_sections(dot_path, output_path="circle.txt"):
    """
    从 .dot 文件中提取互斥锁与信号量相关节点，生成 circle.txt
    文件分为两个区域：互斥量 和 信号量
    """

    # 1. 读取 .dot 文件内容
    with open(dot_path, "r", encoding="utf-8") as f:
        content = f.read()

    # 2. 匹配所有节点名，例如 "main/while/pthread_mutex_lock5"
    nodes = re.findall(r'"([\w/]+)"', content)

    # 3. 分类提取
    mutex_nodes = [n for n in nodes if ("pthread_mutex_lock" in n or "pthread_mutex_unlock" in n)]
    sem_nodes = [n for n in nodes if ("sem_post" in n or "sem_wait" in n)]

    # 4. 去重并保持原顺序
    def unique_order(seq):
        seen = set()
        ordered = []
        for x in seq:
            if x not in seen:
                ordered.append(x)
                seen.add(x)
        return ordered

    mutex_nodes = unique_order(mutex_nodes)
    sem_nodes = unique_order(sem_nodes)

    # 5. 写入 circle.txt
    with open(output_path, "w", encoding="utf-8") as f:
        f.write("互斥量\n")
        for node in mutex_nodes:
            f.write(f"{node}\t\t\n")

        f.write("\n信号量\n")
        for node in sem_nodes:
            f.write(f"{node}\t\t\n")

    print(f"[OK] 已生成 {output_path}")
    print(f"互斥量节点数: {len(mutex_nodes)}，信号量节点数: {len(sem_nodes)}")

# 示例调用
if __name__ == "__main__":
    generate_circle_sections("simpletest.dot")
