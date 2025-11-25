# PX4 单模块生成 expand 文件指南（示例：FixedwingRateControl.cpp）

本文记录如何在 PX4 工程中为单个模块生成 GCC 的 RTL expand dump，供调用关系分析使用。示例基于 `FixedwingRateControl.cpp`，构建目录为 `build/px4_sitl_default`。

## 前置条件
- 已完成一次正常的 PX4 配置/编译，确保生成了 `compile_commands.json`（例如在 `build/px4_sitl_default`）。
- 使用 GCC/Clang 的 `c++` 前端（示例中为 `/usr/bin/c++`）。

## 步骤 
1. **定位编译命令**
   - 进入构建目录，搜索目标源文件的编译条目：
   ```
   cd /home/chove/Desktop/mydag/其他文件/PX4-Autopilot/build/px4_sitl_default
   rg "FixedwingRateControl.cpp" compile_commands.json
   ```
   - 记录输出中的完整编译命令（包含宏定义、包含路径、优化和警告设置等）。

2. **追加 dump 选项并执行**
   - 复用原命令，仅在末尾追加 dump 相关参数，不修改其它选项：
   ```
   /usr/bin/c++  -DCONFIG_ARCH_BOARD_PX4_SITL -DENABLE_LOCKSTEP_SCHEDULER -DMODULE_NAME=\"fw_rate_control\" -DPX4_MAIN=fw_rate_control_app_main -D__CUSTOM_FILE_IO__ -D__PX4_LINUX -D__PX4_POSIX -D__STDC_FORMAT_MACROS -Dnoreturn_function="__attribute__((noreturn))" \
     -I../../boards/px4/sitl/src -I../../platforms/posix/src/px4/common/include -I. -Isrc/lib -I../../platforms/posix/src/px4/generic/generic/include -I../../platforms/common -I../../platforms/common/include -I../../src -I../../src/include -I../../src/lib -I../../src/lib/matrix -I../../src/modules -I../../platforms/posix/include -Iexternal/Install/include -I../../src/lib/rate_control -I../../src/lib/slew_rate \
     -O2 -g -DNDEBUG -fPIC -g -fdata-sections -ffunction-sections -fomit-frame-pointer -fmerge-all-constants -fno-signed-zeros -fno-trapping-math -freciprocal-math -fno-math-errno -fno-strict-aliasing -fvisibility=hidden -include visibility.h \
     -Wall -Wextra -Werror -Warray-bounds -Wcast-align -Wdisabled-optimization -Wdouble-promotion -Wfatal-errors -Wfloat-equal -Wformat-security -Winit-self -Wlogical-op -Wpointer-arith -Wshadow -Wuninitialized -Wunknown-pragmas -Wunused-variable -Wno-missing-field-initializers -Wno-missing-include-dirs -Wno-unused-parameter -fdiagnostics-color=always -Wno-stringop-truncation -fno-builtin-printf -fno-strength-reduce -Wformat=1 -Wunused-but-set-variable -Wno-format-truncation -fcheck-new -Wreorder -Wno-overloaded-virtual -std=gnu++14 \
     -fdump-rtl-expand -save-temps=obj \
     -o src/modules/fw_rate_control/CMakeFiles/modules__fw_rate_control.dir/FixedwingRateControl.cpp.o \
     -c /home/chove/Desktop/mydag/其他文件/PX4-Autopilot/src/modules/fw_rate_control/FixedwingRateControl.cpp
   ```

   - 关键新增参数：
     - `-fdump-rtl-expand`：在 RTL 展开阶段输出 `.expand` dump。
     - `-save-temps=obj`：在对象目录保留中间文件（`.ii`、`.s`、`.expand` 等）。

3. **查看生成结果**
   - 命令成功后，检查对象目录：
   ```
   find src/modules/fw_rate_control/CMakeFiles/modules__fw_rate_control.dir -name 'FixedwingRateControl.cpp.*.expand'
   ```
   - 示例输出：
   ```
   src/modules/fw_rate_control/CMakeFiles/modules__fw_rate_control.dir/FixedwingRateControl.cpp.233r.expand
   ```
   - `.expand` 文件位于构建目录下，路径为：
     `build/px4_sitl_default/src/modules/fw_rate_control/CMakeFiles/modules__fw_rate_control.dir/FixedwingRateControl.cpp.233r.expand`

## 生成的文件说明
- `.233r.expand`：RTL expand 阶段的 dump，供调用关系/中间表示分析。
- `.ii`：预处理后的 C++ 源（宏和条件编译已展开）。
- `.s`：汇编输出。

## 复用到其他模块
- 流程相同：从 `compile_commands.json` 获取目标源文件的编译命令，追加 `-fdump-rtl-expand -save-temps=obj` 并执行，即可得到对应的 `.expand` 文件。
