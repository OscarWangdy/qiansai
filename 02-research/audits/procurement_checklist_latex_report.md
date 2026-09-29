# 采购清单 LaTeX/PDF 检查报告

- 状态：通过
- 源码：`ACG720_赛题三_采购清单_LaTeX/main.tex`
- PDF：`ACG720_赛题三_采购清单_LaTeX/paper.pdf`
- 页数：8 页，A4
- 编译：Tectonic 成功，连续运行并解析交叉引用
- 中文字体：工程内置 `fonts/MiSans-Normal.ttf`，避免不同机器字体缺失导致中文不显示
- 引用：全部使用 `\cite{key}` 连接 `thebibliography` 中的 `\bibitem{key}`；LaTeX guard 为 0 错误
- 视觉检查：逐页渲染检查；未发现乱码、表格溢出、文字截断、图形重叠或异常空白页
- PDF 一致性：`main.pdf` 与 `paper.pdf` 的 SHA-256 相同
- 内容边界：ACG720 孔位、屏幕型号、Hailo 载板和 Pupper 电池参数仍标为待实物确认，没有写成已验证数据

桌面 LaTeX 编辑器不支持随单文件传入工程内字体，因此编辑器内的最终字体复现检查受限；同一 Tectonic 引擎在完整工程目录中已成功编译，最终 PDF 已逐页核验。
