/****************************************************************************
 *
 *   Copyright (c) 2020 PX4 Development Team. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 * 3. Neither the name PX4 nor the names of its contributors may be
 *    used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
 * OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 ****************************************************************************/

#include "BatterySimulator.hpp"

/*
 * 组件概览（文件内注释）
 * -------------------------------------------------------------------------
 * BatterySimulator 作为 PX4 的一个模块，继承自：
 *  - ModuleParams：用于参数管理（_param_* 参数对象、参数更新通知等）
 *  - ScheduledWorkItem：用于把本模块挂到 PX4 的 WorkQueue 上以固定周期运行
 *
 * 模块职责：
 *  - 以固定周期（BATTERY_SIMLATOR_SAMPLE_INTERVAL_US）执行 Run()，
 *    根据是否上锁（armed）推进一个“电量百分比”的简单放电积分模型；
 *  - 将百分比映射为电压（按单节电池的 empty/full 电压线性插值 × 电芯数），
 *    更新 Battery 对象并发布 battery_status；
 *  - 响应 VEHICLE_CMD_INJECT_FAILURE 指令（battery ok/off），用于测试注入；
 *  - 处理参数更新与 vehicle_status 更新；
 *
 * 运行路径：
 *  1) 外部入口 battery_simulator_main() 调用 BatterySimulator::main()；
 *  2) main() 经 task_spawn() 构造实例，并通过 init() 调用 ScheduleOnInterval()；
 *  3) WorkQueue 定期回调 Run()；Run() 内读取/更新状态并发布电池消息；
 *  4) updateCommands() 处理注入失败命令，必要时“强制空电”以模拟故障；
 */

// 构造函数：
//  - 初始化参数基类 ModuleParams（nullptr = 无父参数句柄）
//  - 将本模块注册到高优先级 WorkQueue（hp_default）
//  - 初始化 Battery 对象：参数分别为 instance、ModuleParams*、采样周期(us)、来源类型
BatterySimulator::BatterySimulator() :
    ModuleParams(nullptr),
    ScheduledWorkItem(MODULE_NAME, px4::wq_configurations::hp_default),
    _battery(1, this, BATTERY_SIMLATOR_SAMPLE_INTERVAL_US, battery_status_s::BATTERY_SOURCE_POWER_MODULE)
{
}

// 析构：释放性能计数器
BatterySimulator::~BatterySimulator()
{
    perf_free(_loop_perf);
}

// 初始化：将本模块按给定周期加入 WorkQueue 调度
bool BatterySimulator::init()
{
    ScheduleOnInterval(BATTERY_SIMLATOR_SAMPLE_INTERVAL_US);
    return true;
}

// WorkQueue 回调主函数（周期性执行）：
//  1) 处理退出请求与性能计数；
//  2) 处理参数更新、命令注入与车辆状态；
//  3) 简单放电模型：armed 时按时间积分降低“电量百分比”，未上锁时回到 100%；
//  4) 将百分比线性映射到单节电压区间（empty/full），再乘以电芯数得到总电压；
//  5) 写入 Battery 对象并发布 battery_status；
void BatterySimulator::Run()
{
    // 退出处理：从调度移除并清理
    if (should_exit()) {
        ScheduleClear();
        exit_and_cleanup();
        return;
    }

    perf_begin(_loop_perf);

    // 处理参数更新：复制通知并调用 updateParams()
    if (_parameter_update_sub.updated()) {
        parameter_update_s param_update;
        _parameter_update_sub.copy(&param_update);
        updateParams();
    }

    // 处理外部注入命令（注入失败/恢复）
    updateCommands();

    // 更新 armed 状态（来自 vehicle_status）
    if (_vehicle_status_sub.updated()) {
        vehicle_status_s vehicle_status;
        if (_vehicle_status_sub.copy(&vehicle_status)) {
            _armed = (vehicle_status.arming_state == vehicle_status_s::ARMING_STATE_ARMED);
        }
    }

    const hrt_abstime now_us = hrt_absolute_time();
    // 放电时间常数（参数 sim_bat_drain：秒）→ 微秒
    const float discharge_interval_us = _param_sim_bat_drain.get() * 1000 * 1000;

    // 简化放电模型：armed 时按时间积分降低百分比；未 armed 时复位为 100%
    if (_armed) {
        if (_last_integration_us != 0) {
            _battery_percentage -= (now_us - _last_integration_us) / discharge_interval_us;
        }
        _last_integration_us = now_us;
    } else {
        _battery_percentage = 1.f;
        _last_integration_us = 0;
    }

    // 模拟环境中没有电流传感器：使用 -1 表示无效/未知电流
    float ibatt = -1.0f;

    // 限制最小电量百分比（由参数 BAT_MIN_PCT 指定）
    _battery_percentage = math::max(_battery_percentage, _param_bat_min_pct.get() / 100.f);

    // 将百分比线性映射为“单节电压”：empty→full 区间
    float vbatt = math::interpolate(_battery_percentage, 0.f, 1.f,
                                    _battery.empty_cell_voltage(),
                                    _battery.full_cell_voltage());

    // 若收到“强制空电”指令，则直接使用 empty 电压
    if (_force_empty_battery) {
        vbatt = _battery.empty_cell_voltage();
    }

    // 乘以电芯数，得到总电压
    vbatt *= _battery.cell_count();

    // 更新 Battery 对象并发布状态
    _battery.setConnected(true);
    _battery.updateVoltage(vbatt);
    _battery.updateCurrent(ibatt);
    _battery.updateAndPublishBatteryStatus(now_us);

    perf_end(_loop_perf);
}

// 命令处理：响应 VEHICLE_CMD_INJECT_FAILURE（注入/恢复电池故障）
//  - unit = SYSTEM_BATTERY 且 instance=0 时受支持；
//  - type = OK    → 取消“强制空电”；
//  - type = OFF   → 启用“强制空电”（模拟断电/空电场景）；
// 处理完成后发布 command_ack。
void BatterySimulator::updateCommands()
{
    vehicle_command_s vehicle_command;

    while (_vehicle_command_sub.update(&vehicle_command)) {
        if (vehicle_command.command != vehicle_command_s::VEHICLE_CMD_INJECT_FAILURE) {
            continue; // 非本模块关注的命令直接跳过
        }

        bool handled = false;
        bool supported = false;

        const int failure_unit = static_cast<int>(vehicle_command.param1 + 0.5f);
        const int failure_type = static_cast<int>(vehicle_command.param2 + 0.5f);
        const int instance     = static_cast<int>(vehicle_command.param3 + 0.5f);

        if (failure_unit == vehicle_command_s::FAILURE_UNIT_SYSTEM_BATTERY) {
            if (failure_type == vehicle_command_s::FAILURE_TYPE_OK) {
                handled = true;
                PX4_INFO("CMD_INJECT_FAILURE, battery ok");
                if (instance == 0) { // 仅支持 instance 0
                    supported = true;
                    _force_empty_battery = false; // 恢复正常工作
                }
            } else if (failure_type == vehicle_command_s::FAILURE_TYPE_OFF) {
                // OFF：强制使用“空电”电压，达到“电池断电/空电”的效果（模型近似）
                handled = true;
                PX4_WARN("CMD_INJECT_FAILURE, battery empty");
                if (instance == 0) {
                    supported = true;
                    _force_empty_battery = true;
                }
            }
        }

        if (handled) {
            vehicle_command_ack_s ack{};
            ack.command = vehicle_command.command;
            ack.from_external = false;
            ack.result = supported ?
                         vehicle_command_ack_s::VEHICLE_CMD_RESULT_ACCEPTED :
                         vehicle_command_ack_s::VEHICLE_CMD_RESULT_UNSUPPORTED;
            ack.timestamp = hrt_absolute_time();
            _command_ack_pub.publish(ack);
        }
    }
}

// 模块任务入口：构造实例、登记对象、加入 WorkQueue，并调用 init()
int BatterySimulator::task_spawn(int argc, char *argv[])
{
    BatterySimulator *instance = new BatterySimulator();

    if (instance) {
        _object.store(instance);
        _task_id = task_id_is_work_queue;

        if (instance->init()) {
            return PX4_OK;
        }

    } else {
        PX4_ERR("alloc failed");
    }

    delete instance;
    _object.store(nullptr);
    _task_id = -1;

    return PX4_ERROR;
}

// 自定义命令（当前未扩展）：打印帮助
int BatterySimulator::custom_command(int argc, char *argv[])
{
    return print_usage("unknown command");
}

// 打印命令行使用说明（PX4 通用样式）
int BatterySimulator::print_usage(const char *reason)
{
    if (reason) {
        PX4_WARN("%s\n", reason);
    }

    PRINT_MODULE_DESCRIPTION(
        R"DESCR_STR(
### Description


)DESCR_STR");

	PRINT_MODULE_USAGE_NAME("battery_simulator", "system");
	PRINT_MODULE_USAGE_COMMAND("start");
	PRINT_MODULE_USAGE_DEFAULT_COMMANDS();

	return 0;
}

// 外部 C 接口（PX4 模块入口）：映射到 BatterySimulator::main()
extern "C" __EXPORT int battery_simulator_main(int argc, char *argv[])
{
    return BatterySimulator::main(argc, argv);
}
