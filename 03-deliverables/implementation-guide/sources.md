# 来源与证据边界

核验日期：2026-09-26。网页会更新，项目应保存所使用资料和工具的版本。

1. 用户提供：《全国大学生嵌入式芯片与系统设计竞赛'2026 FPGA赛道选题指南—高云半导体》。赛题三在印刷15—17页（PDF物理17—19页），平台简介在印刷8页，申请与支持在印刷19—20页。原始PDF未复制进本包。
2. 高云板卡交叉参照：https://www.gowinsemi.com.cn/university/board/1 。页面标题ACX720与指南ACG720存在名称差异，不能据此共用引脚。
3. Gowin EDA：https://www.gowinsemi.com.cn/software/1 。教育版支持：https://www.gowinsemi.com.cn/university/software 。
4. GMD：https://www.gowinsemi.com.cn/software/14 。GoRV32：https://www.gowinsemi.com.cn/software/15 。
5. 电机驱动布局：https://www.ti.com/lit/an/slva959b/slva959b.pdf 。
6. 差速控制：https://control.ros.org/jazzy/doc/ros2_controllers/diff_drive_controller/doc/userdoc.html 。
7. ToF测距时序：https://www.st.com/resource/en/datasheet/vl53l1x.pdf 。
8. 里程计坐标与漂移：https://github.com/ros-infrastructure/rep/blob/master/rep-0105.rst 。
9. RKNN：https://github.com/airockchip/rknn-toolkit2 ；示例：https://github.com/airockchip/rknn_model_zoo 。

图表由本报告原创编排，全部可编辑。评分图表示官方占比；任务、架构、状态机、路线和进度图都是归纳或建议示意。没有使用、模拟或虚构实际机器人性能曲线。

需要后续验证的事项包括：实物完整型号、板卡原理图和电气条件、可用IP与许可、外设接口、软核执行时间、轮速与导航误差、感知覆盖、端到端时延、机械停车距离、AI正确率与图像带宽。
