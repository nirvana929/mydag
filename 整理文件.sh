#!/bin/bash

# 创建目录结构
mkdir -p 文档/版本更新
mkdir -p 文档/使用指南
mkdir -p 文档/技术报告
mkdir -p 其他文件/测试脚本
mkdir -p 其他文件/临时数据

echo "=== 整理文档文件 ==="

# 移动版本更新相关文档
mv -v CHANGELOG_v3.3.md 文档/版本更新/ 2>/dev/null || true
mv -v CHANGELOG_v3.4.md 文档/版本更新/ 2>/dev/null || true
mv -v CHANGELOG_v3.5.md 文档/版本更新/ 2>/dev/null || true
mv -v BUGFIX_v3.4.md 文档/版本更新/ 2>/dev/null || true
mv -v Bug修复说明.md 文档/版本更新/ 2>/dev/null || true
mv -v 升级完成总结.md 文档/版本更新/ 2>/dev/null || true
mv -v 升级说明.md 文档/版本更新/ 2>/dev/null || true
mv -v 功能升级说明_v2.md 文档/版本更新/ 2>/dev/null || true

# 移动使用指南
mv -v GUIDE_v3.4.md 文档/使用指南/ 2>/dev/null || true
mv -v GUIDE_v3.5.md 文档/使用指南/ 2>/dev/null || true
mv -v GUI_v3_使用说明.md 文档/使用指南/ 2>/dev/null || true
mv -v QUICKSTART_v3.3.md 文档/使用指南/ 2>/dev/null || true
mv -v README_GUI_v3.5.md 文档/使用指南/ 2>/dev/null || true

# 移动技术报告
mv -v GUI_v3.1_修复总结.md 文档/技术报告/ 2>/dev/null || true
mv -v GUI_v3.2_简化查找逻辑.md 文档/技术报告/ 2>/dev/null || true
mv -v GUI_v3_升级总结.md 文档/技术报告/ 2>/dev/null || true
mv -v MIGRATION_REPORT_v3.5.md 文档/技术报告/ 2>/dev/null || true
mv -v PROJECT_OVERVIEW.md 文档/技术报告/ 2>/dev/null || true
mv -v SUMMARY_v3.3.md 文档/技术报告/ 2>/dev/null || true
mv -v SUMMARY_v3.4.md 文档/技术报告/ 2>/dev/null || true
mv -v 目录结构说明.md 文档/技术报告/ 2>/dev/null || true

echo ""
echo "=== 整理测试文件 ==="

# 移动测试脚本
mv -v test_*.py 其他文件/测试脚本/ 2>/dev/null || true

# 移动临时数据
mv -v test_*.txt 其他文件/临时数据/ 2>/dev/null || true

echo ""
echo "=== 整理完成 ==="
ls -lh 文档/版本更新/ | tail -n +2 | wc -l | xargs echo "版本更新文档数量:"
ls -lh 文档/使用指南/ | tail -n +2 | wc -l | xargs echo "使用指南文档数量:"
ls -lh 文档/技术报告/ | tail -n +2 | wc -l | xargs echo "技术报告文档数量:"
ls -lh 其他文件/测试脚本/ | tail -n +2 | wc -l | xargs echo "测试脚本数量:"
ls -lh 其他文件/临时数据/ | tail -n +2 | wc -l | xargs echo "临时数据数量:"

