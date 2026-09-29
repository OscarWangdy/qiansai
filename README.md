# ACG720 赛题三资料与交付仓库

本仓库集中保存 2026 全国大学生嵌入式芯片与系统设计竞赛 FPGA 创新设计赛道中，高云半导体赛题三的输入索引、研究过程、可编辑 LaTeX 文档、最终 PDF、发布压缩包和版面验证材料。

项目面向小梅哥 ACG720（GW5AT-138K 系列）平台，主题为“基于 FPGA 的具身智能机器人实时感知与自主控制系统”。当前成果属于工程方案、采购规划和验证计划；仓库尚不包含 RTL、软核固件或机器人实测结果。

## 从哪里开始

- 最新采购结果：[`04-releases/pdfs/ACG720_赛题三_采购清单.pdf`](04-releases/pdfs/ACG720_赛题三_采购清单.pdf)
- 最新采购清单源码：[`03-deliverables/procurement-checklist/`](03-deliverables/procurement-checklist/)
- 完整实施指南：[`03-deliverables/implementation-guide/`](03-deliverables/implementation-guide/)
- 配件与软件指南：[`03-deliverables/accessories-guide/`](03-deliverables/accessories-guide/)
- 项目交接摘要：[`PROJECT_CONTEXT.md`](PROJECT_CONTEXT.md)
- 输入和来源边界：[`01-inputs/README.md`](01-inputs/README.md)
- 同步规则：[`SYNC.md`](SYNC.md)

发生内容冲突时，采购决策以核验日期为 2026-09-29 的 `procurement-checklist` 为准。较早的配件指南和工作副本仅供追溯。

## 目录结构

| 目录 | 内容 |
|---|---|
| `01-inputs/` | 工作流配置、原始资料清单和来源映射；不直接收录工作区之外的原始 PDF |
| `02-research/` | 规划、证据、引用、审稿和完整性审计记录 |
| `03-deliverables/` | 三套可编辑 LaTeX 主交付及其 PDF |
| `04-releases/` | 面向使用者的 PDF 和源码 ZIP |
| `05-history/` | 早期工作构建与替代命名版本 |
| `06-validation/` | PDF 页面渲染、联系表、规则截图和机械图转换文件 |
| `scripts/` | 从原工作区增量同步及内容覆盖检查脚本 |

## 重要边界

- ACG720 的实际 PCB 尺寸、安装孔位、板卡版本和完整 FPGA 料号仍须以实物确认。
- `ACX720-V3` 机械图不能作为 ACG720 加工孔图。
- Pupper 电池、Waveshare 屏幕和 Hailo-8 载板的完整规格尚未确认。
- 文档中的周期、控制频率、误差和性能数值是设计建议，不是实测结论。
- 基础控制应由 FPGA 与软核完成；边缘 AI 不能绕过安全仲裁。

## 构建 LaTeX

进入对应的 `03-deliverables/*/` 目录执行：

```sh
bash build.sh
```

项目推荐使用 XeLaTeX。修改后应检查分页、表格溢出、TikZ 遮挡、字体和引用，并同步更新阅读版 PDF。

