# 数据与输入输出同步规则

## 权威层级

1. `03-deliverables/procurement-checklist/`：当前采购决策的权威源码。
2. `04-releases/pdfs/ACG720_赛题三_采购清单.pdf`：面向使用者的最新采购 PDF。
3. `03-deliverables/implementation-guide/`：系统方案和实施路线。
4. `03-deliverables/accessories-guide/`：较早的综合配件与软件说明。
5. `05-history/`：历史副本，只用于追溯，不作为最新结论。

## 更新顺序

1. 修改 `03-deliverables/` 中对应的 `main.tex` 或来源说明。
2. 使用 XeLaTeX 构建两次，检查日志和版面。
3. 同步对应目录中的 `main.pdf`、`paper.pdf`。
4. 若修改最新版采购清单，同步 `04-releases/pdfs/ACG720_赛题三_采购清单.pdf`。
5. 更新相关研究、审计或来源记录。
6. 仅在需要正式发布时重新生成 `04-releases/source-archives/` 中的 ZIP。
7. 提交前运行 `git status`，确认没有误收本机缓存、临时编译文件或外部原始资料。

## 从旧工作区增量同步

在本仓库根目录执行：

```sh
bash scripts/sync_from_workspace.sh /Users/oscar/Documents/ChatGPT/fpga
```

脚本只复制和覆盖映射中的文件，不删除仓库文件。同步后运行：

```sh
bash scripts/verify_content_coverage.sh /Users/oscar/Documents/ChatGPT/fpga
```

覆盖检查以内容哈希为准，用于确认旧工作区中的每一种文件内容都能在本仓库找到。它不要求路径或重复副本数量完全相同。

