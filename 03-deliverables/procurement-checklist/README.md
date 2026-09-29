# ACG720 赛题三采购清单

这是一个自包含的中文 LaTeX 工程，面向已经拥有 ACG720 基础套装、Raspberry Pi 5、Hailo-8、microSD、散热器、桌面电源、摄像头和 Waveshare 屏幕的队伍。

## 文件

- `main.tex`：可编辑源码，表格与示意图均为 LaTeX/TikZ。
- `paper.pdf`：编译后的阅读版。
- `fonts/MiSans-Normal.ttf`：用于稳定复现中文排版的嵌入字体文件。
- `sources.md`：来源、实物待确认项和证据边界。
- `build.sh`：XeLaTeX 编译脚本。
- `.latexmkrc`：latexmk 的 XeLaTeX 配置。

## 编译

在本目录运行：

```sh
bash build.sh
```

也可以手动执行两次：

```sh
xelatex -interaction=nonstopmode -halt-on-error main.tex
xelatex -interaction=nonstopmode -halt-on-error main.tex
```

## 使用方法

先打印正文最后一页的采购执行表。精确型号项目可直接询价；标为“待确认”的电池、充电器、保险、屏幕支架和 ACG720 孔位，必须取得实物参数后再冻结。
