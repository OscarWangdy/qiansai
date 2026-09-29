# Contribution & Novelty Reviewer

## Reviewer Persona

**Venue context:** Target context: ACG720赛题三实施指南

**Standards:** Assess whether the report synthesizes sources effectively, presents a coherent argument, and delivers practical insights.

**Review style:** Scene-aware structured review.

Do not fabricate specific submission rules for the target venue. Only use what is known from the research stage or user-provided materials.

## Role

Assess novelty, significance, differentiation from prior work, and evidence-to-claim strength.

**IMPORTANT:** You are an independent reviewer. Do NOT read or reference the other reviewers' work. Your assessment must stand entirely on its own. Do not mention what other reviewers might say.

## Rubric (score 1-5 for each)

- Contribution clarity (1=vague, 5=crystal clear)
- Novelty (1=incremental, 5=genuine contribution)
- Evidence-to-claim strength (1=unsupported, 5=conclusive)
- Venue appropriateness (1=mismatched, 5=perfect fit)

## Manuscript Sections

### 赛题与目标
赛题三要求 FPGA 构建机器人实时控制系统，并探索与边缘 AI 的协同。基础部分表述为“仅使用 FPGA + 软核 CPU 即可完成”；拓展允许使用 RK3588 等平台。表 [REF] 按原文归纳完整任务。 [REF]

### 硬件与系统架构


### 按实时性划分三个执行层


### ACG720 资源与外设配置
指南的平台简介覆盖 60K/138K 配置，申请表列出 ACG720 的 GW5AT-LV138PG484AC1。你们已申请 ACG720，实际器件后缀与板卡版本仍须核对。官网另有标题为 ACX720 的相关页面，不能据名称相近混用原理图。 [REF]

### 供电、电平与机械集成
输入电压。 指南标示 ACG720 支持 6--12 V，接电前仍需核对所收板卡。普通每节满充 4.2 V 的三串锂电池满电为 12.6 V，不能直接当成符合 12 V 上限的电源。若采用 9 V 稳压输出，也需核对稳压器输入范围、功率和瞬态响应。

### 软件与工程配置


### 开发环境与首次跑通顺序
使用与准确 FPGA 料号和板级例程相兼容的稳定工具链。官方页面当前列出 Gowin EDA V1.9.12.04 和 GMD V2025.01；这些是核查时的版本快照，项目建立后应固定 EDA、IP、编译器与例程版本。 [REF]
Gowin EDA 有 Windows、Linux、macOS 下载项；GMD 当前官方页面列出 Windows/Linux。Mac 可用于源码与文档工作，软核构建和调试可安排在已验证的 Windows/Linux 主机；虚拟机的 USB 下载器兼容性需实际测试。 [REF]
软核选择 优先复用与实际板卡匹配、可验证的 Cortex-M1 或 RISC-V 工程；GoRV32 是可研究的官方选项。基础版建议裸机或轻量调度，不以在软核上运行 Linux/ROS 作为前置条件。 [REF]

### 模块接口、时钟与软件组织


### 基础任务实现


### 任务 1：摄像头采集、显示与姿态信息
建议先以 640\,$ $\,480、RGB565、30 帧/秒采集 建立最小视频链路；显示端可采用显示器支持的独立刷新时序。OV5640/OV5647 是传感器型号，兼容性取决于具体模组、供电和接口。优先复用 ACG720 资料包已经验证的相机模组。
缓存与带宽算例。 RGB565 每像素 2 字节，单帧容量为 \[ M=640 480 2=614\,400\ B 0.586\ MiB . \] 双缓冲约 1.17 MiB，三缓冲约 1.76 MiB。若 30 fps 写入、60 Hz 显示每次读一帧，有效像素负载约为 \[ B=M\,(30+60)=55.296\ MB/s . \] 该数值 不含 刷新、突发效率、仲裁及其他主设备负载；内存容量足够不代表控制器带宽、时序和延迟已验证。

### 任务 2：编码器反馈与双轮闭环
两轮差速底盘可以自然完成前进、后退、转弯和原地旋转。定义轮距为 $b$，左右轮半径为 $r_L,r_R$，车体线速度为 $v$、角速度为 $ $，左右轮角速度指令为 \[ _L^*= v- b/2 r_L , _R^*= v+ b/2 r_R . \] 距离与半径使用米，车体/轮子角速度使用 rad/s；$v=0$ 且两轮反向即为原地旋转。
编码器。 A/B 相先同步和去毛刺，再做正交解码与方向判断。若采用四倍频，必须明确 $N$ 表示 车轮转一圈的有效计数 ，包括减速比与解码倍数。采样窗口 $T_s$ 内计数变化为 $ n$ 时， \[ = 2 n N T_s , u[k]= sat \! (K_p e[k]+I[k] ), I[k+1]=I[k]+K_i T_s e[k]. \] 低速时每个窗口可能只有零到几个计数，可延长测速窗口或结合脉冲周期法。PI 可先用定点实现，明确位宽、符号扩展、舍入、饱和和积分限幅。

### 任务 3：实时避障与安全停车
静态障碍的简化停车阈值可按下式估算： \[ d_ stop vT_ total + v^2 2a_ +m. \] $T_ total $ 为制动生效前的保守总延迟，$a_ $ 为不利工况下实测的保守减速度，$m$ 覆盖测距误差、车体前缘偏置和余量。以 $v=0.30$ m/s、$T=0.10$ s、$a=0.60$ m/s$^2$、$m=0.10$ m 为 假设算例 ，阈值至少为 $0.205$ m；这些并非本车实测参数。

### 任务 4：起终点与路径点自主导航
左右轮增量位移为 $ s_L, s_R$ 时，可用中点近似更新里程计： \[ s= s_R+ s_L 2 , = s_R- s_L b , cases x_ k+1 =x_k+ s ( _k+ /2),\\ y_ k+1 =y_k+ s ( _k+ /2). cases \] 融合陀螺可改善短时转角估计，但轮滑、轮径误差和陀螺零偏仍会积累。需要长期可靠定位时，必须增加地图匹配、允许的视觉标志物或其他外部观测进行修正。 [REF]
enumerate 保存路径点 $(x_i,y_i)$，计算距离与航向误差；角度误差统一到 $(- , ]$。 第一版采用“停车对准—低速接近—到点切换”；熟练后使用 Pure Pursuit 等连续跟踪。 到点阈值、减速半径和航向容差由场地与实测误差决定，防止路径点附近来回抖动。 绕障后仍根据当前估计位姿重新计算目标；限定绕行时间，失败时停车并记录原因。 enumerate

### 进阶路线与边缘 AI


### 从稳定基础到更强的自主能力
通信预算 640\,$ $\,480 RGB565、30 fps 的纯像素负载约 18.43 MB/s，即 147.46 Mb/s；普通 UART 不适合传输这种原始视频。千兆网、USB 或压缩/降采样方案均须核对板卡实际接口、协议实现与有效吞吐。低速链路适合传输结构化检测结果。

### 任务 5 与任务 6：识别、搜索与接近目标
RK3588 可承担模型推理。推荐先跑通对应系统镜像的官方检测示例，再加入自身模型。PC 侧用 RKNN-Toolkit2 完成转换与量化，板端使用兼容的 RKNN Runtime 或 Lite2；转换工具、Runtime、NPU 驱动与镜像需要匹配。模型示例的 FPS 不能当作整机端到端帧率。 [REF]

### 验证与项目推进


### 按依赖顺序开发


### 建议验收表与现场演示


### 开工前待确认事项与资料入口
指南列出的赛题三适配板卡为 ACG720 / ACG750 / BX72 / ACG138-RK3588-CORE；相机可选适配的 OV5640、OV5647、双目或其他兼容设备，电机驱动与姿态检测等由队伍自主选型。平台章节另出现 ACX750 名称，进一步说明应以对应实物资料核验。 [REF]

### 第一天可以完成的工作


### 文档使用方式
contest 高云半导体. 全国大学生嵌入式芯片与系统设计竞赛'2026：FPGA创新设计赛道选题指南[Z]. 用户提供文件，2026. 赛题三见印刷15--17页；平台见8页；申请说明见19--20页. board 高云半导体. 大学计划开发板：小梅哥ACX720[EB/OL]. https://www.gowinsemi.com.cn/university/board/1 . 网页标题与用户ACG720名称不同，仅作交叉参照. eda 高云半导体. 云源软件商业版：下载、许可与技术文档[EB/OL]. https://www.gowinsemi.com.cn/software/1 . education 高云半导体. 教育版软件及器件支持列表[EB/OL]. https://www.gowinsemi.com.cn/university/software . gmd 高云半导体. GOWIN MCU Designer[EB/OL]. https://www.gowinsemi.com.cn/software/14 . gorv 高云半导体. Gowin GoRV32[EB/OL]. https://www.gowinsemi.com.cn/software/15 . ti Texas Instruments. Best Practices for Board Layout of Motor Drivers, SLVA959B[EB/OL]. https://www.ti.com/lit/an/slva959b/slva959b.pdf . diffdrive ros2\_control. diff\_drive\_controller, Jazzy documentation[EB/OL]. https://control.ros.org/jazzy/doc/ros2_controllers/diff_drive_controller/doc/userdoc.html . tof STMicroelectronics. VL53L1X datasheet[EB/OL]. https://www.st.com/resource/en/datasheet/vl53l1x.pdf . 参见测量timing budget说明；具体性能依配置与条件. rep105 ROS. REP 105: Coordinate Frames for Mobile Platforms[EB/OL]. https://github.com/ros-infrastructure/rep/blob/master/rep-0105.rst . rknn Rockchip. RKNN-Toolkit2 and RKNN Model Zoo[EB/OL]. https://github.com/airockchip/rknn-toolkit2 ; https://github.com/airockchip/rknn_model_zoo . thebibliography 网页与工具版本核验日期：2026-09-26。动态网页可能更新，实际工程应记录所用稳定版本。
6mm 编译与编辑 本文件为自包含 LaTeX 源码；图表由 TikZ 绘制，可修改文字、颜色和节点。使用 XeLaTeX 连续编译两次以解析目录页码与引用，或使用兼容的 Tectonic。详见压缩包中的 README。 document

## Instructions

1. Score each rubric dimension (1-5) with a brief justification.
2. List at least 3 specific findings. Reference section names.
3. Recommend: Accept / Minor Revision / Major Revision / Reject.
4. Write your review in clear, structured Markdown.

Write only your review. Do NOT produce other files.
