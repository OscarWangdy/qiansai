# Reviewer Audit

## Reviewer Value Map

| Reviewer criterion | What reviewers/editors want | Our manuscript evidence | Current weakness | Revision action |
|---|---|---|---|---|
| Novelty | 明确报告新增价值，不伪称算法创新 | 需求—模块—证据映射，第1至6章 | 无新算法和实测 | 已限定为实施指南，不宣称研究创新 |
| Significance | 帮助已申请ACG720的团队开工 | 硬件选型表、上板次序、验收清单 | 实物型号尚未核实 | 第2章及6.3列出资料核对事项 |
| Technical soundness | 可照着实施的公式和边界 | 视频带宽、差速、PI、停车、里程计 | 无真实参数标定 | 已补航向更新、区分Tm/Tc、保护逻辑 |
| Evidence sufficiency | 规则和计算有依据 | 用户PDF、11项引用、可复算算例 | 无硬件实验记录 | 明示建议与假设；第6章设计采证而不虚构结果 |
| Clarity | 一次阅读理解依赖与次序 | 11图13表、封面导航、统一编号 | 早稿图框间距不足 | 已修正视频与轮速图间距，补术语框 |
| Venue fit | 满足中文竞赛实施报告用途 | A4自包含LaTeX、清楚分章 | 不是正式赛事技术报告模板 | 封面明确工程方案，用户未要求提交版 |

## Reviewer Objection Register

| Likely objection | Where triggered | Severity | What the reviewer may say | Preemptive fix | Status |
|---|---|---|---|---|---|
| 方法M1/贡献C-M1：航向递推缺失 | 4.4公式 | MAJOR | 下一周期航向怎么得到 | 增加wrap航向更新与融合边界；直行/原地转向极限一致 | CLOSED |
| 方法M2：测量窗和控制周期混同 | 4.2 | MAJOR | 低速延长窗口会错误改变积分增益 | 测速Tm、控制Tc分别定义 | CLOSED |
| 方法m1/清晰C-m02：PI保护表达不全 | 4.2 | MINOR | 基本式不等于抗饱和控制器 | 定义e/I/sat，补积分限幅与同向饱和暂停 | CLOSED |
| 方法m2：停车符号 | 4.3 | MINOR | 倒车距离可能算成负值 | 采用非负速度大小，限定直线静态障碍并讨论扫掠空间 | CLOSED |
| 方法m3：姿态与画面同步 | 4.1 | MINOR | 同屏不等于时间同步 | 最新有效姿态与真正对齐分别表述 | CLOSED |
| 方法m4：编码器滤波 | 4.2 | MINOR | 去毛刺会丢合法边沿 | 明示最高转速合法边沿约束和异常计数 | CLOSED |
| 清晰C-M01：总图遗漏数据依赖 | 图3 | MAJOR | 软核位姿和AI图像从何而来 | 图注明确编码器快照与图像来源 | CLOSED |
| 清晰C-M02：避障故障覆盖 | 图7 | MAJOR | 绕行中再遇障如何停车 | 图内标任意运行状态危险/过期直接停车及恢复条件 | CLOSED |
| 清晰C-m01：缩写缺释义 | 3.2 | MINOR | 视频和控制术语不熟悉 | 补中文术语框 | CLOSED |
| 清晰C-m03：初验次序 | 3.1、4.1 | MINOR | DDR和彩条为何顺序不一致 | 统一为两项独立通过后联调 | CLOSED |
| 贡献C-M2：语义到导航 | 5.2 | MINOR | 检测框不等于导航目标 | 增加类别颜色与方位距离的局部目标映射 | CLOSED |
| 贡献C-M3：来源支持库缺项 | 文献7—11 | MINOR | 来源到主张链不完整 | 补C16—20真实来源范围，不把访问年当出版年 | CLOSED |

## Editorial Fit Map

- Venue fit：面向参赛团队的工程实施指南；不是论文投稿或已完成成果报告。
- Editor-facing value：将赛题全部任务映射到ACG720软硬件职责、阶段路线和验证证据；可编辑图表降低理解成本。
- Desk-reject risks：没有声称满足未知官方模板；没有无依据成绩；板卡引脚、确切版本和实际性能仍需团队确认，已明确而非隐藏。

本表由主代理根据三份独立审查原文及最终修改复核汇总，不冒称三位评审进行了第二轮签字。审查认可方案质量，不替代上板验证。
