# ACG720 赛题三实施指南

本压缩包将2026高云赛题三整理为中文工程实施指南，覆盖要求、硬件配置、软件环境、四项基础任务、AI扩展和验收方法。版面为A4单栏，图形为可编辑TikZ矢量图。

## 文件

- `main.tex`：完整自包含源码，正文、图表、公式、引用都在同一个文件中。
- `paper.pdf`：由本包源码编译的阅读版。
- `build.sh`：优先使用XeLaTeX；没有XeLaTeX时尝试已有Tectonic。
- `.latexmkrc`：供latexmk使用的XeLaTeX配置。
- `sources.md`：资料来源与参数边界说明。

## 编译

推荐使用支持中文的TeX Live、MacTeX或Overleaf，选择 **XeLaTeX**。项目使用TeX发行版中的Fandol字体，不依赖本机宋体，不需要上传字体文件。

```sh
xelatex -interaction=nonstopmode -halt-on-error main.tex
xelatex -interaction=nonstopmode -halt-on-error main.tex
```

连续编译两次用于解析交叉引用。生成的`main.pdf`就是最新输出；为了与包中阅读版名称保持一致，复制为`paper.pdf`。无需BibTeX、外部图片或shell-escape，文献采用内置`thebibliography`。

也可在包目录运行：

```sh
bash build.sh
```

或使用已有的Tectonic：

```sh
tectonic main.tex
```

Tectonic首次运行可能需要联网取得宏包；其排版引擎与XeTeX兼容。实际已验证的编译器和版面检查结果以交付说明为准。

## 修改图表与文字

所有图位于`figure`中的`tikzpicture`，直接修改节点文字、坐标、颜色或箭头。配色在导言区`Ink/Teal/Pale/Amber`中集中定义。表格使用`tabularx`自动换行列；新增大量文字时可调整分页命令`\nextpage`，然后重新编译检查溢出。

本文使用6个顶层章节和主题分页。页码导航由`\pageref`自动更新，引用由`\cite`与`\bibitem`关联，不应手填文献序号。

## 内容状态

这是一份设计方案与验证计划，不是已完成机器人实验报告。指南给出的评分和功能要求与建议参数分别标注。摄像头接口、FPGA完整料号、原理图、电平、工具许可、电机参数和实测性能仍需队伍确认。文中的12周计划、控制频率、帧率和误差等数值是建议起点或条件算例。

本包不含外部板卡例程、芯片IP、采购商品或用户原始竞赛PDF。查阅资料请使用`sources.md`和正文参考资料。
