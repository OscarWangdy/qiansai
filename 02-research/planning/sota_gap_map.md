# 技术成熟度与工程缺口图谱

本文件服务于“ACG720 赛题三实施指南”。此处 SOTA 指已公开的成熟技术能力与参考实现，不作最先进性能排行榜。用户证据仅包括赛题指南和“已申请 ACG720”；没有板卡实物型号、原理图、工程、性能日志或测试数据。以下贡献均为拟实施的工程组织方式，不能写成新算法、已验证性能或比赛达标结果。

| Candidate Contribution | What SOTA Already Does | User Evidence | Real Gap | Claim Strength | Risk |
|---|---|---|---|---|---|
| 以 FPGA 为主体的视频、运动与导航分层方案 | 图像接口、编码器解码、PWM、软件规划均为成熟模块；成熟机器人栈已有独立碰撞监控层 | 已申请 ACG720，赛题要求基础机器人能力 | 板级接口、电压、IP、约束和软核模板尚未逐项核实；需要先建立可复用的联调顺序 | 可提出结构清晰、可实施的设计方案；不宣称架构新颖性或资源一定充足 | “FPGA 芯片支持”不等于该封装、该板卡把接口完整引出；实际资源须综合布局布线后报告 |
| 统一时间戳与独立安全仲裁 | Nav2 碰撞监控支持停止、减速、速度相关区域、输入超时与机器人轮廓 | 没有硬件时序测量 | 把传感器数据年龄、采样周期、通信、FPGA 处理、驱动动作与机械停车分开预算并测量 | 可定义可验证的延迟指标；尚不能宣称端到端低于 20 ms | 以 VL53L1X 为例，短距离模式最小 timing budget 为 20 ms，全距离模式至少 33 ms；不能把 HDL 几个时钟周期当成发现障碍到停车总延迟 |
| 小范围路径点导航与渐进升级定位 | 轮式里程计与 IMU 是成熟短期运动估计；REP 105 明确里程计长期会漂移 | 尚无轮径、轮距、编码器分辨率和实测漂移 | 先标定轮径/轮距、限制路线与速度；若需要长期地图导航，增加可校正漂移的外部观测和定位算法 | 可做短路线原型与误差预算；不能保证 10–15 cm 到点误差 | 六轴 IMU 无绝对航向观测；轮滑与陀螺零偏仍导致漂移。加一台激光雷达或 A* 不会自动解决定位与建图 |
| 覆盖前进、倒车、旋转的近场避障 | 成熟碰撞监控以整车轮廓和速度方向判断风险，而非仅检查前方点距离 | 未给车身尺寸、传感器安装图与场地障碍 | 根据整车扫掠区域配置前后侧方传感器，或明确不允许自动倒车；为侧向/低矮障碍增加覆盖或碰撞触边 | 可给出覆盖设计原则和验收用例；不声称三路 ToF 等价全向感知 | 前左中右测距仍可能漏掉后方、车角、玻璃及低矮物体；原地转动的车身角点会扫过障碍；二维雷达只看到扫描平面 |
| 相机到显示的可验证视频链路 | OV5640 芯片支持 DVP/MIPI，已有 DVP 模组说明；常见 OV5647 树莓派模组使用 CSI 连接 | 仅有 ACG720 名称，未确认相机插座和配套例程 | 首选与板卡资料包验证过的具体模组；逐项核对排针、供电、I/O、时钟、初始化和像素格式 | 可以推荐优先复用已验证接口；不能只凭 OV5640/OV5647 型号确定兼容 | OV5647 芯片也存在 DVP 管脚定义，不能绝对写“OV5647 只有 MIPI”；模组引出方式才决定可接接口。CSI-2 接收还需 D-PHY/包解析，RAW Bayer 到彩色视频还需图像处理 |
| 可插拔 RK3588 视觉扩展 | Rockchip 已提供 RKNN-Toolkit2 转换、Lite2 Python 推理、Runtime C/C++ 推理及 Model Zoo 检测示例 | 没有 RK3588 实物、镜像或模型 | 固定开发板镜像、NPU 驱动、Runtime 和转换工具的兼容版本；先用官方检测示例验证，再接带时间戳的结果协议 | 可给出成熟部署路线；不可引用厂商模型 FPS 当整机端到端表现 | 一般检测器只识别 bottle，未必识别“红色水瓶”；须增加颜色判断/特定训练集。INT8 量化与预处理不匹配会降低正确率 |
| 可复现验收与故障注入 | 电机驱动设计已强调峰值/持续电流、散热与回流路径，机器人系统已有超时停车设计 | 未有电机数据表、供电与故障记录 | 用满电/欠压、连续行驶、堵转限流、CPU/AI 超时、测距无效与恢复启动用例形成证据 | 可提交测试计划与记录模板；“10 次成功”等只作拟定验收目标 | 驱动选型不能仅用“持续电流大于堵转电流 1.3 倍”；须核对限流、启动时间、峰值持续时间、PCB 散热及电机温升 |

## Gap Summary

实际缺口是将已有模块在确定的 ACG720 板型上组成完整、可测量的机器人系统。报告应围绕“要求—模块—接口—验收”组织，清楚区分官方规定、方案建议、待实物确认项。值得呈现的工程亮点是硬件安全仲裁、可观测的端到端时序以及基础系统和 AI 扩展之间明确的故障隔离；目前没有足够证据提出学术创新或性能优越性主张。

前文建议应在成稿中作以下校正：

1. 将“ACG720 足够完成全部要求”改为“具备实施基础，最终取决于具体板型、IP 可用性、资源/时序收敛和系统集成”。不要把 138K 型号、存储、接口、M1 模板当成实物已确认事实。
2. 将“发现障碍到 PWM 制动小于 20 ms”拆成三项：有效测距产生至安全仲裁输出；物理障碍出现至控制响应；机械停止距离。停止阈值至少包含数据陈旧时间与执行时延对应距离、制动距离和几何余量。采用简化静态障碍估算 `d_stop >= v * T_total + v^2/(2*a_min) + margin`，其中 `a_min` 必须实测；目标也在运动时还须考虑相对接近速度。
3. 标称输入上限若确认为 12 V，普通每节满充 4.2 V 的三串锂电池满充 12.6 V 不能直接接入。先按实际板卡输入范围与电池化学体系选稳压/升降压模块；9 V 只是候选输出，不能替代板卡资料核实。
4. 三路前向 ToF 适合受限环境原型，完整验收要覆盖倒车、车角扫掠和障碍高度。二维雷达也需评估盲区；安全性来自感知覆盖和受限动作共同约束。
5. 避免“断 EN 必然更快刹停”的暗示：许多驱动禁用后进入滑行。急停硬件失能与正常受控减速的行为需按驱动真值表分别验证，机械停止距离以较差工况验收。
6. A* 搜索、局部避障和定位是三个不同模块；小地图并不证明软核能实时运行完整 SLAM。基础版可做已知起点、小范围路径点任务；更高要求需明确外部定位修正方案和计算预算。
7. 六轴 IMU 的俯仰/横滚可借重力约束，航向仍漂移；九轴磁力计也需硬软铁校准和电机磁干扰评估。不要把显示一个 yaw 值当成高精度绝对航向。
8. 软件版本以项目实际可用稳定版固化；记录 EDA、IP、软核编译器和板卡示例版本。RK3588 采用官方兼容的 RKNN 工具链组合，不仅罗列 Python 包名；模型推理、图像传输、预处理和后处理分别计时。

## 一手来源与引用用途

检索渠道为官方文档/厂商资料和官方代码库，访问日期 2026-09-26。以下内容提供技术约束，不证明用户系统已经达到性能。

| Source ID | 官方来源与 URL | 支持内容与使用边界 |
|---|---|---|
| TECH01 | ST VL53L1X 数据表：https://www.st.com/resource/en/datasheet/vl53l1x.pdf | 3.5.2 节 timing budget：20 ms 仅短距、33 ms 全模式；距离能力随条件变化。用于区分传感器测量时间和逻辑响应时间。 |
| TECH02 | ST VL53L1X 产品页：https://www.st.com/en/imaging-and-photonics-solutions/vl53l1x | 典型视场角 27°、最高 50 Hz；非全向避障保证。 |
| TECH03 | ROS REP 105 官方源码：https://github.com/ros-infrastructure/rep/blob/master/rep-0105.rst | odom 连续但长期可无界漂移，map 需定位修正。官网受访问保护，核实了官方仓库原文。 |
| TECH04 | Nav2 Collision Monitor：https://docs.nav2.org/rolling/configuration_and_development/configuration_guide/core_servers/collision_monitor/configuring_collision_monitor_node/ | 独立停止/减速区、速度相关区域、数据源超时和轮廓。只借鉴设计思路，不建议直接在软核运行 ROS/Nav2。 |
| TECH05 | Nav2 Footprint：https://docs.nav2.org/rolling/configuration_and_development/first_time_robot_setup_guide/footprint/setup_footprint/ | 车体形状参与碰撞判断。 |
| TECH06 | Arducam OV5640 模组说明：https://blog.arducam.com/downloads/modules/OV5640/5Megapixel_OV5640D_AF_CMOS_Camera_Module_DS.pdf | 同一传感器支持 DVP/MIPI，具体模组接口及引脚须核实；该说明只证明对应模组。 |
| TECH07 | Arducam OV5647 芯片资料：https://www.arducam.com/downloads/modules/RaspberryPi_camera/OV5647DS.pdf | 芯片 DVP/MIPI 复用引脚；不等于常见模组同时引出两类接口。 |
| TECH08 | Raspberry Pi Camera Software：https://www.raspberrypi.com/documentation/computers/camera_software.html | OV5647 原版相机及 CSI-2 软件背景；不证明 ACG720 接口兼容。 |
| TECH09 | Rockchip RKNN-Toolkit2：https://github.com/airockchip/rknn-toolkit2 | RK3588 支持，Toolkit2 转换、Lite2 Python 与 Runtime C/C++ 部署角色。 |
| TECH10 | Rockchip RKNN Model Zoo：https://github.com/airockchip/rknn_model_zoo | 已有模型转换和推理示例；示例测试条件与整机不同，不能移用 FPS。 |
| TECH11 | TI Motor Driver PCB Layout：https://www.ti.com/lit/an/slva959b/slva959b.pdf | 电机驱动布线、热路径等工程约束。 |
| TECH12 | TI Precision Labs Motor Drivers：https://www.ti.com/video/series/precision-labs/ti-precision-labs-designing-with-motor-drivers.html | 选型需考虑峰值/RMS 电流、PCB 散热、电压余量和大电容。 |

## 建议图表

成稿可用一张分层架构图表示 FPGA、软核和可选 RK3588 的边界；用一张时延链图连接“障碍出现—采样—有效测距—仲裁—驱动—机械停止”；用一张俯视覆盖图画出前/后/侧方与旋转扫掠区；用“基础、增强、AI”三列对照表替代大段器件堆叠。各图标明“方案示意”，不要模拟成实测曲线。
