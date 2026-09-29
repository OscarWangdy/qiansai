# ACG720 赛题三配件与软件采购指南

本包包含一份自包含中文 LaTeX 文档。正文、表格、流程图、供电图和传感器布局图都写在 `main.tex` 中，不依赖外部图片。

## 文件

- `main.tex`：可编辑源码。
- `paper.pdf`：已编译阅读版。
- `sources.md`：资料来源与关键边界。
- `build.sh`：本地编译脚本。
- `.latexmkrc`：XeLaTeX 的 latexmk 配置。

## 编译

推荐使用 XeLaTeX 连续编译两次：

```sh
xelatex -interaction=nonstopmode -halt-on-error main.tex
xelatex -interaction=nonstopmode -halt-on-error main.tex
```

也可以执行 `bash build.sh`。若系统中只有 Tectonic，脚本会使用 Tectonic 编译。

## 内容边界

本文是采购规划，不是产品认证或已完成的系统测试。树莓派是否属于赛题允许的“其他边缘 AI 平台”需要官方指导群确认；动力和电源必须在底盘重量、电机电流及续航目标确定后定型。价格容易变化，因此没有写入静态报价。
