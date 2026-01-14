# PX4 线程创建调研：`px4_task_spawn_cmd()`

## Modules 目录调用表（`PX4-Autopilot/src/modules`）

| 文件（点击跳转到首次调用） | 调用次数 |
|---|---:|
| `PX4-Autopilot/src/modules/commander/Commander.cpp:2667` | 1 |
| `PX4-Autopilot/src/modules/dataman/dataman.cpp:855` | 1 |
| `PX4-Autopilot/src/modules/gimbal/gimbal.cpp:326` | 1 |
| `PX4-Autopilot/src/modules/landing_target_estimator/landing_target_estimator_main.cpp:98` | 1 |
| `PX4-Autopilot/src/modules/logger/logger.cpp:176` | 1 |
| `PX4-Autopilot/src/modules/mavlink/mavlink_main.cpp:2942` | 1 |
| `PX4-Autopilot/src/modules/mavlink/mavlink_shell.cpp:144` | 1 |
| `PX4-Autopilot/src/modules/muorb/slpi/uORBProtobufChannel.cpp:335` | 1 |
| `PX4-Autopilot/src/modules/navigator/navigator_main.cpp:1083` | 1 |
| `PX4-Autopilot/src/modules/replay/Replay.cpp:1164` | 1 |
| `PX4-Autopilot/src/modules/simulation/simulator_mavlink/SimulatorMavlink.cpp:1662` | 1 |
| `PX4-Autopilot/src/modules/simulation/simulator_sih/sih.cpp:852` | 1 |
| `PX4-Autopilot/src/modules/temperature_compensation/temperature_calibration/task.cpp:325` | 1 |
| `PX4-Autopilot/src/modules/uxrce_dds_client/uxrce_dds_client.cpp:911` | 1 |
| `PX4-Autopilot/src/modules/zenoh/zenoh.cpp:527` | 1 | 




## 全仓库调用表（排除 build，排除函数定义）

| 文件（点击跳转到首次调用） | 调用次数 |
|---|---:|
| `PX4-Autopilot/boards/bitcraze/crazyflie/syslink/syslink_main.cpp:111` | 1 |
| `PX4-Autopilot/boards/modalai/voxl2-slpi/src/drivers/dsp_hitl/dsp_hitl.cpp:994` | 1 |
| `PX4-Autopilot/boards/modalai/voxl2-slpi/src/drivers/dsp_sbus/dsp_sbus.cpp:339` | 1 |
| `PX4-Autopilot/boards/modalai/voxl2-slpi/src/drivers/elrs_led/elrs_led.cpp:225` | 1 |
| `PX4-Autopilot/boards/modalai/voxl2-slpi/src/drivers/mavlink_rc_in/mavlink_rc_in.cpp:260` | 2 |
| `PX4-Autopilot/boards/modalai/voxl2-slpi/src/drivers/rc_controller/rc_controller.cpp:111` | 1 |
| `PX4-Autopilot/boards/modalai/voxl2-slpi/src/drivers/spektrum_rc/spektrum_rc.cpp:282` | 1 |
| `PX4-Autopilot/boards/modalai/voxl2/src/drivers/apps_sbus/apps_sbus.cpp:409` | 1 |
| `PX4-Autopilot/platforms/common/px4_work_queue/WorkQueueManager.cpp:348` | 2 |
| `PX4-Autopilot/platforms/common/px4_work_queue/test/wqueue_start.cpp:62` | 1 |
| `PX4-Autopilot/platforms/common/uORB/uORB_tests/uORBTest_UnitTest.cpp:468` | 3 |
| `PX4-Autopilot/platforms/common/work_queue/hrt_thread.c:292` | 1 |
| `PX4-Autopilot/platforms/common/work_queue/work_thread.c:209` | 2 |
| `PX4-Autopilot/platforms/common/work_queue/wqueue_test/wqueue_start_posix.cpp:70` | 1 |
| `PX4-Autopilot/platforms/nuttx/src/px4/common/usr_hrt.cpp:125` | 1 |
| `PX4-Autopilot/platforms/qurt/src/px4/main.cpp:196` | 1 |
| `PX4-Autopilot/src/drivers/distance_sensor/pga460/pga460.cpp:759` | 1 |
| `PX4-Autopilot/src/drivers/gnss/septentrio/septentrio.cpp:367` | 1 |
| `PX4-Autopilot/src/drivers/gps/gps.cpp:1407` | 1 |
| `PX4-Autopilot/src/drivers/ins/eulernav_bahrs/eulernav_driver.cpp:57` | 1 |
| `PX4-Autopilot/src/drivers/qshell/qurt/qshell_start_qurt.cpp:78` | 1 |
| `PX4-Autopilot/src/drivers/telemetry/frsky_telemetry/frsky_telemetry.cpp:739` | 1 |
| `PX4-Autopilot/src/drivers/telemetry/hott/hott_sensors/hott_sensors.cpp:214` | 1 |
| `PX4-Autopilot/src/drivers/telemetry/hott/hott_telemetry/hott_telemetry.cpp:331` | 1 |
| `PX4-Autopilot/src/drivers/telemetry/iridiumsbd/IridiumSBD.cpp:68` | 1 |
| `PX4-Autopilot/src/examples/hello/hello_start.cpp:70` | 1 |
| `PX4-Autopilot/src/examples/matlab_csv_serial/matlab_csv_serial.c:90` | 2 |
| `PX4-Autopilot/src/lib/cdev/test/cdevtest_example.cpp:271` | 1 |
| `PX4-Autopilot/src/lib/cdev/test/cdevtest_start.cpp:68` | 1 |
| `PX4-Autopilot/src/lib/parameters/parameters_primary.cpp:161` | 1 |
| `PX4-Autopilot/src/lib/parameters/parameters_remote.cpp:175` | 1 |
| `PX4-Autopilot/src/modules/commander/Commander.cpp:2667` | 1 |
| `PX4-Autopilot/src/modules/dataman/dataman.cpp:855` | 1 |
| `PX4-Autopilot/src/modules/gimbal/gimbal.cpp:326` | 1 |
| `PX4-Autopilot/src/modules/landing_target_estimator/landing_target_estimator_main.cpp:98` | 1 |
| `PX4-Autopilot/src/modules/logger/logger.cpp:176` | 1 |
| `PX4-Autopilot/src/modules/mavlink/mavlink_main.cpp:2942` | 1 |
| `PX4-Autopilot/src/modules/mavlink/mavlink_shell.cpp:144` | 1 |
| `PX4-Autopilot/src/modules/muorb/slpi/uORBProtobufChannel.cpp:335` | 1 |
| `PX4-Autopilot/src/modules/navigator/navigator_main.cpp:1083` | 1 |
| `PX4-Autopilot/src/modules/replay/Replay.cpp:1164` | 1 |
| `PX4-Autopilot/src/modules/simulation/simulator_mavlink/SimulatorMavlink.cpp:1662` | 1 |
| `PX4-Autopilot/src/modules/simulation/simulator_sih/sih.cpp:852` | 1 |
| `PX4-Autopilot/src/modules/temperature_compensation/temperature_calibration/task.cpp:325` | 1 |
| `PX4-Autopilot/src/modules/uxrce_dds_client/uxrce_dds_client.cpp:911` | 1 |
| `PX4-Autopilot/src/modules/zenoh/zenoh.cpp:527` | 1 |
| `PX4-Autopilot/src/systemcmds/serial_passthru/serial_passthru.cpp:407` | 1 |
| `PX4-Autopilot/src/systemcmds/tests/hrt_test/hrt_test_start.cpp:67` | 1 |
| `PX4-Autopilot/src/templates/template_module/template_module.cpp:73` | 1 |
