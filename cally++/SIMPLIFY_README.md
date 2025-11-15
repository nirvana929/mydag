# C++ 调用图简化功能说明

## 功能概述

cally++ 的 `--simplify-cxx` 选项可以将包含大量 STL 模板实现细节的 C++ 调用图简化为用户友好的形式，专注于业务逻辑和线程/锁语义。

## 使用方法

```bash
python3 generate.py --expand <file.expand> --full --simplify-cxx --source <source.cpp>
```

### 参数说明

- `--expand <file>`: RTL expand 文件（必需）
- `--full`: 生成完整调用图（所有函数）
- `--caller <func>`: 生成从指定函数出发的 caller 图
- `--simplify-cxx`: 启用 C++ 简化（隐藏 STL 内部实现）
- `--source <file>`: 源代码文件，用于线程函数推断（可选）
- `--debug`: 调试模式

## 简化效果
此文档已合并归档到 `ARCHIVE_DOCS.md`（历史参考）。

请查看 `ARCHIVE_DOCS.md` 中的 “From: SIMPLIFY_README.md” 部分以获取完整内容。
**原始图**（329 行）：
