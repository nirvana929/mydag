#!/usr/bin/env python3
from __future__ import annotations

import argparse
import re
from pathlib import Path
from typing import Dict, List, Tuple

import matplotlib.pyplot as plt
import networkx as nx

EDGE_RE = re.compile(r'"(?P<src>[^"]+)"\s*->\s*"(?P<dst>[^"]+)"')
NODE_RE = re.compile(r'"(?P<name>[^"]+)"\s*\[(?P<attrs>[^\]]+)\]')


def parse_dot(path: Path) -> Tuple[List[Tuple[str, str]], Dict[str, Dict[str, str]]]:
    edges: List[Tuple[str, str]] = []
    attrs: Dict[str, Dict[str, str]] = {}
    for raw in path.read_text(encoding="utf-8", errors="ignore").splitlines():
        raw = raw.strip().rstrip(";")
        if not raw or raw.startswith("strict") or raw in ("{", "}"):
            continue
        edge_match = EDGE_RE.search(raw)
        if edge_match:
            edges.append((edge_match.group("src"), edge_match.group("dst")))
        node_match = NODE_RE.search(raw)
        if node_match:
            name = node_match.group("name")
            attr_dict: Dict[str, str] = {}
            for chunk in node_match.group("attrs").split(","):
                if "=" in chunk:
                    k, v = chunk.split("=", 1)
                    attr_dict[k.strip()] = v.strip()
            attrs[name] = attr_dict
    return edges, attrs


def render(dot_path: Path, output: Path, root: str | None = None) -> None:
    edges, attrs = parse_dot(dot_path)
    if not edges and not attrs:
        raise ValueError(f"No graph data parsed from {dot_path}")

    graph = nx.DiGraph()
    for src, dst in edges:
        graph.add_edge(src, dst)
    for node in list(graph.nodes):
        graph.nodes[node]["style"] = attrs.get(node, {}).get("style", "")
    for extra_node in attrs.keys() - graph.nodes.keys():
        graph.add_node(extra_node, style=attrs[extra_node].get("style", ""))

    pos = nx.spring_layout(graph, seed=42)

    styles = nx.get_node_attributes(graph, "style")
    node_colors = []
    node_sizes = []
    edge_colors = []
    for node in graph.nodes:
        style = styles.get(node, "")
        if node == root:
            node_colors.append("#ffcc00")
            node_sizes.append(900)
        elif "dashed" in style:
            node_colors.append("#dddddd")
            node_sizes.append(200)
        else:
            node_colors.append("#9ec9ff")
            node_sizes.append(400)
    for src, dst in graph.edges:
        if root and src == root:
            edge_colors.append("#ff8800")
        else:
            edge_colors.append("#666666")

    plt.figure(figsize=(12, 8))
    nx.draw_networkx_edges(graph, pos, edge_color=edge_colors, arrows=True, arrowstyle="->", arrowsize=12, width=1.2)
    nx.draw_networkx_nodes(graph, pos, node_color=node_colors, node_size=node_sizes, linewidths=0.5, edgecolors="#333333")
    nx.draw_networkx_labels(graph, pos, font_size=9)
    plt.axis("off")
    output.parent.mkdir(parents=True, exist_ok=True)
    plt.tight_layout()
    plt.savefig(output, dpi=200)
    plt.close()


def main() -> int:
    parser = argparse.ArgumentParser(description="Render DOT via networkx/matplotlib (local fallback)")
    parser.add_argument("dot", type=Path, help="DOT file path")
    parser.add_argument("-o", "--output", type=Path, required=True, help="PNG output path")
    parser.add_argument("--root", type=str, help="Optional root function to highlight")
    args = parser.parse_args()

    render(args.dot, args.output, args.root)
    print(f"Wrote {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

