# Confirmed Contribution

## Core Contribution

| Field | Content |
|---|---|
| Main contribution statement | 将2026高云赛题三全部任务映射到以ACG720为起点的软硬件职责、分阶段实现路线和逐项验收证据，形成可编辑、可编译的中文工程实施指南。 |
| Contribution type | new analysis-or-benchmark：本项目特定的工程分析与实施规划，不声称新算法或实测系统成果。 |
| One-sentence reviewer payoff | 队伍能依据任务编号决定先做什么、模块怎样连接、哪些资料尚缺、怎样证明完成，而不是从零散技术名词自行拼接方案。 |

## Why This Contribution Is Needed

| Field | Content |
|---|---|
| Field problem | 机器人视频、传感器、控制和导航各有不同实时性需求，团队需要把赛事任务转换成具体板级工程。 |
| Specific gap | 用户已申请ACG720但没有提交原理图、BOM、工程或测试；赛题指南只列功能，不规定实现细节和量化测试方法。 |
| Concrete challenge | 摄像头与DDR3跨域、轮速闭环、感知覆盖、里程计漂移及AI接口共同影响整机稳定性；只列零件无法解决集成依赖。 |
| Why prior work leaves it unresolved | 厂商例程说明板级功能，Nav2和ros2_control说明成熟机器人架构，但都不替代这支队伍针对赛题三的任务分解、ACG720版本核对和验收记录。 |

## How This Paper Responds

| Field | Content |
|---|---|
| Design response | 以六任务需求矩阵、FPGA/软核/AI分层图、视频与控制链、导航状态机、阶段计划和验证表组织全文；所有数字附上来源属性。 |
| Evidence required | 完整赛题条目、评分数值、板卡官方信息、工具链来源、可复算的存储/运动/停车公式，以及能逐项追踪的验证步骤。 |
| Evidence available | 用户PDF全文提取和相关页面目视核对；高云官网、机器人与RKNN官方资料；前一轮完成的技术审查及本轮用户确认。 |
| Evidence missing | 实物板卡完整料号、原理图、外设参数、综合资源报告、时序分析、模型性能和实际机器人运行记录均未提供。 |

## Claim Boundary

| Field | Content |
|---|---|
| Strong claims allowed | 可准确复述指南要求与权重；可以提供有工程依据的建议架构、公式、软件配置方法和验收计划；可以报告本LaTeX文档编译与排版检查结果。 |
| Claims to soften or avoid | 不承诺板卡直接兼容所有外设，不断言资源一定足够，不写已完成任务、成功率、实测延迟或竞赛得分；不把指南之外指标冒充官方要求。 |
| Novelty risk | 所用差速控制、PI、路径点导航、AI检测均为成熟方法；文档价值是项目适配和可追踪实施，不能包装为首次提出。 |
| Significance risk | 方案限于该赛事和小范围移动底盘；通过完整任务映射和可修改源文件提供实际用途，不扩张为通用高可靠机器人证明。 |
