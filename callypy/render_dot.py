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
        m = EDGE_RE.search(raw)
        if m:
            edges.append((m.group("src"), m.group("dst")))
            continue
        n = NODE_RE.search(raw)
        if n:
            name = n.group("name")
            attr_dict: Dict[str, str] = {}
            for chunk in n.group("attrs").split(","):
                if "=" in chunk:
                    k, v = chunk.split("=", 1)
                    attr_dict[k.strip()] = v.strip()
            attrs[name] = attr_dict
    return edges, attrs


def render(dot_path: Path, output: Path, root: str | None = None) -> None:
    edges, attrs = parse_dot(dot_path)
    if not edges and not attrs:
        raise ValueError(f"No graph data parsed from {dot_path}")

    G = nx.DiGraph()
    for s, t in edges:
        G.add_edge(s, t)
    for node in list(G.nodes):
        G.nodes[node]["style"] = attrs.get(node, {}).get("style", "")
    for extra in attrs.keys() - G.nodes.keys():
        G.add_node(extra, style=attrs[extra].get("style", ""))

    pos = nx.spring_layout(G, seed=7)
    styles = nx.get_node_attributes(G, "style")
    colors = []
    sizes = []
    for n in G.nodes:
        sty = styles.get(n, "")
        if root and n == root:
            colors.append("#ffcc00")
            sizes.append(900)
        elif "dashed" in sty:
            colors.append("#dddddd")
            sizes.append(200)
        else:
            colors.append("#a2d2ff")
            sizes.append(400)

    plt.figure(figsize=(12, 8))
    nx.draw_networkx_edges(G, pos, arrows=True, arrowstyle="->", arrowsize=12, edge_color="#666666")
    nx.draw_networkx_nodes(G, pos, node_color=colors, node_size=sizes, edgecolors="#333333", linewidths=0.5)
    nx.draw_networkx_labels(G, pos, font_size=9)
    plt.axis("off")
    output.parent.mkdir(parents=True, exist_ok=True)
    plt.tight_layout()
    plt.savefig(output, dpi=200)
    plt.close()


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("dot", type=Path)
    ap.add_argument("-o", "--output", type=Path, required=True)
    ap.add_argument("--root", type=str, default=None)
    a = ap.parse_args()
    render(a.dot, a.output, a.root)
    print(f"Wrote {a.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

