<!--
本文件顶部为“逐块注释解读”，下方保留原始 RTL 片段，便于对照阅读。
-->

# simulate_work(char const*, int) — RTL 逐块注释

函数头：`;; Function simulate_work (simulate_work(char const*, int), ...)`

- 作用概述：打印一行提示（包含 name 与 value），随后执行 `i=0..9999` 的循环，将 `(value+i)/7` 的整数商不断累加到 `acc`，最后读出 `acc` 以保留计算副作用。

## A. 序言与参数保存（insn 2–4）
- 将 `name`、`value` 写入栈帧槽位，为后续多次读取做准备。
- NOTE_INSN_FUNCTION_BEG 标记函数体开始。

## B. 构造输出流链（insn 7–28, 多个 call_insn）
- 加载 `std::cout` 与两个字符串常量 `*.LC0`、`*.LC1`。
- 依次调用 `operator<<(ostream&, char const*)` 输出前缀、name、分隔串。
- 调用 `operator<<(ostream&, int)` 输出 value。
- 调用 `operator<<(ostream&, endl_t)` 输出换行（std::endl）。

对应源码：`std::cout << LC0 << name << LC1 << value << std::endl;`

## C. 局部初始化（insn 29–30）
- `acc = 0; i = 0;`

## D. 循环条件与骨架（label 56, note 31, insn 34–36, jump_insn 35, 57）
- 比较 `i` 与 `9999`，若 `i > 9999` 则跳转到退出标签（59）。
- 使用 `code_label 56` 作为循环头，`jump_insn 57` 回跳形成闭环。

对应源码：`for (i = 0; i <= 9999; ++i) {...}`

## E. 循环体核心（insn 37–55）
- 读取 `value`、`i` 并计算 `_5 = value + i`。
- 使用魔数 `0x92492493` 与移位序列实现 `_6 = (_5 / 7)` 的整数商（强度削减，没有直接除法指令）。
- `acc += _6`，随后 `++i`。

## F. 循环退出与尾声（label 59, note 60, insn 61）
- 读取最终 `acc` 到命名寄存槽（例如 `vol.1_27`），确保结果对外可观察，避免优化器删除计算。

## G. 基本块（BB）职责速览
- BB2：保存参数、完成整句输出，初始化局部变量。
- BB4：循环头与条件判断。
- BB5：循环体（加法、魔数除法、累加与自增）。
- BB6：退出块，读出 `acc`。

## H. 伪 C 参考
```c
void simulate_work(const char* name, int value) {
  std::cout << LC0 << name << LC1 << value << std::endl;
  int acc = 0, i = 0;
  while (i <= 9999) {
    int _5 = value + i;
    int _6 = _5 / 7;   // 由魔数与移位序列实现的整数商
    acc += _6;
    ++i;
  }
  (void)acc; // 读出以保留副作用
}
```

---


;; Function simulate_work (simulate_work(char const*, int), funcdef_no=1823, decl_uid=43380, cgraph_uid=613, symbol_order=1083)

Partition 0: size 4 align 4
	i_9
Partition 1: size 4 align 4
	acc

;; Generating RTL for gimple basic block 2

;; Generating RTL for gimple basic block 3

;; Generating RTL for gimple basic block 4

;; Generating RTL for gimple basic block 5


try_optimize_cfg iteration 1

Merging block 3 into block 2...
Merged blocks 2 and 3.
Merged 2 and 3 without moving.
Merging block 7 into block 6...
Merged blocks 6 and 7.
Merged 6 and 7 without moving.


try_optimize_cfg iteration 2



;;
;; Full RTL generated for this function:
;;
(note 1 0 5 NOTE_INSN_DELETED)
(note 5 1 2 2 [bb 2] NOTE_INSN_BASIC_BLOCK)
(insn 2 5 3 2 (set (mem/f/c:DI (plus:DI (reg/f:DI 77 virtual-stack-vars)
                (const_int -24 [0xffffffffffffffe8])) [3 name+0 S8 A64])
        (reg:DI 5 di [ name ])) "produce5.cpp":12:1 -1
     (nil))
(insn 3 2 4 2 (set (mem/c:SI (plus:DI (reg/f:DI 77 virtual-stack-vars)
                (const_int -28 [0xffffffffffffffe4])) [5 value+0 S4 A32])
        (reg:SI 4 si [ value ])) "produce5.cpp":12:1 -1
     (nil))
(note 4 3 7 2 NOTE_INSN_FUNCTION_BEG)
(insn 7 4 8 2 (set (reg:DI 4 si)
        (symbol_ref/f:DI ("*.LC0") [flags 0x2]  <var_decl 0x7fa5a6fc72d0 *.LC0>)) "produce5.cpp":13:39 -1
     (nil))
(insn 8 7 9 2 (set (reg:DI 5 di)
        (symbol_ref:DI ("std::cout") [flags 0x40]  <var_decl 0x7fa5a737b900 cout>)) "produce5.cpp":13:39 -1
     (nil))
(call_insn 9 8 10 2 (set (reg:DI 0 ax)
        (call (mem:QI (symbol_ref:DI ("std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)") [flags 0x41]  <function_decl 0x7fa5a765cc00 operator<<>) [0 operator<< S1 A8])
            (const_int 0 [0]))) "produce5.cpp":13:39 -1
     (nil)
    (expr_list:DI (use (reg:DI 5 di))
        (expr_list:DI (use (reg:DI 4 si))
            (nil))))
(insn 10 9 11 2 (set (reg/f:DI 82 [ _1 ])
        (reg:DI 0 ax)) "produce5.cpp":13:39 -1
     (nil))
(insn 11 10 12 2 (set (reg:DI 91)
        (mem/f/c:DI (plus:DI (reg/f:DI 77 virtual-stack-vars)
                (const_int -24 [0xffffffffffffffe8])) [3 name+0 S8 A64])) "produce5.cpp":13:39 -1
     (nil))
(insn 12 11 13 2 (set (reg:DI 4 si)
        (reg:DI 91)) "produce5.cpp":13:39 -1
     (nil))
(insn 13 12 14 2 (set (reg:DI 5 di)
        (reg/f:DI 82 [ _1 ])) "produce5.cpp":13:39 -1
     (nil))
(call_insn 14 13 15 2 (set (reg:DI 0 ax)
        (call (mem:QI (symbol_ref:DI ("std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)") [flags 0x41]  <function_decl 0x7fa5a765cc00 operator<<>) [0 operator<< S1 A8])
            (const_int 0 [0]))) "produce5.cpp":13:39 -1
     (nil)
    (expr_list:DI (use (reg:DI 5 di))
        (expr_list:DI (use (reg:DI 4 si))
            (nil))))
(insn 15 14 16 2 (set (reg/f:DI 83 [ _2 ])
        (reg:DI 0 ax)) "produce5.cpp":13:39 -1
     (nil))
(insn 16 15 17 2 (set (reg:DI 4 si)
        (symbol_ref/f:DI ("*.LC1") [flags 0x2]  <var_decl 0x7fa5a6fc73f0 *.LC1>)) "produce5.cpp":13:39 -1
     (nil))
(insn 17 16 18 2 (set (reg:DI 5 di)
        (reg/f:DI 83 [ _2 ])) "produce5.cpp":13:39 -1
     (nil))
(call_insn 18 17 19 2 (set (reg:DI 0 ax)
        (call (mem:QI (symbol_ref:DI ("std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)") [flags 0x41]  <function_decl 0x7fa5a765cc00 operator<<>) [0 operator<< S1 A8])
            (const_int 0 [0]))) "produce5.cpp":13:39 -1
     (nil)
    (expr_list:DI (use (reg:DI 5 di))
        (expr_list:DI (use (reg:DI 4 si))
            (nil))))
(insn 19 18 20 2 (set (reg/f:DI 84 [ _3 ])
        (reg:DI 0 ax)) "produce5.cpp":13:39 -1
     (nil))
(insn 20 19 21 2 (set (reg:SI 92)
        (mem/c:SI (plus:DI (reg/f:DI 77 virtual-stack-vars)
                (const_int -28 [0xffffffffffffffe4])) [5 value+0 S4 A32])) "produce5.cpp":13:50 -1
     (nil))
(insn 21 20 22 2 (set (reg:SI 4 si)
        (reg:SI 92)) "produce5.cpp":13:50 -1
     (nil))
(insn 22 21 23 2 (set (reg:DI 5 di)
        (reg/f:DI 84 [ _3 ])) "produce5.cpp":13:50 -1
     (nil))
(call_insn 23 22 24 2 (set (reg:DI 0 ax)
        (call (mem:QI (symbol_ref:DI ("std::basic_ostream<char, std::char_traits<char> >::operator<<(int)") [flags 0x41]  <function_decl 0x7fa5a763fb00 operator<<>) [0 operator<< S1 A8])
            (const_int 0 [0]))) "produce5.cpp":13:50 -1
     (nil)
    (expr_list:DI (use (reg:DI 5 di))
        (expr_list:SI (use (reg:SI 4 si))
            (nil))))
(insn 24 23 25 2 (set (reg/f:DI 85 [ _4 ])
        (reg:DI 0 ax)) "produce5.cpp":13:50 -1
     (nil))
(insn 25 24 26 2 (set (reg:DI 93)
        (mem/u/c:DI (const:DI (unspec:DI [
                        (symbol_ref:DI ("std::basic_ostream<char, std::char_traits<char> >& std::endl<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&)") [flags 0x41]  <function_decl 0x7fa5a7654c00 endl>)
                    ] UNSPEC_GOTPCREL)) [24  S8 A8])) "produce5.cpp":13:64 -1
     (nil))
(insn 26 25 27 2 (set (reg:DI 4 si)
        (reg:DI 93)) "produce5.cpp":13:64 -1
     (expr_list:REG_EQUAL (symbol_ref:DI ("std::basic_ostream<char, std::char_traits<char> >& std::endl<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&)") [flags 0x41]  <function_decl 0x7fa5a7654c00 endl>)
        (nil)))
(insn 27 26 28 2 (set (reg:DI 5 di)
        (reg/f:DI 85 [ _4 ])) "produce5.cpp":13:64 -1
     (nil))
(call_insn 28 27 29 2 (set (reg:DI 0 ax)
        (call (mem:QI (symbol_ref:DI ("std::basic_ostream<char, std::char_traits<char> >::operator<<(std::basic_ostream<char, std::char_traits<char> >& (*)(std::basic_ostream<char, std::char_traits<char> >&))") [flags 0x41]  <function_decl 0x7fa5a763f300 operator<<>) [0 operator<< S1 A8])
            (const_int 0 [0]))) "produce5.cpp":13:64 -1
     (nil)
    (expr_list:DI (use (reg:DI 5 di))
        (expr_list:DI (use (reg:DI 4 si))
            (nil))))
(insn 29 28 30 2 (set (mem/v/c:SI (plus:DI (reg/f:DI 77 virtual-stack-vars)
                (const_int -8 [0xfffffffffffffff8])) [5 acc+0 S4 A64])
        (const_int 0 [0])) "produce5.cpp":14:18 -1
     (nil))
(insn 30 29 56 2 (set (mem/c:SI (plus:DI (reg/f:DI 77 virtual-stack-vars)
                (const_int -4 [0xfffffffffffffffc])) [5 i+0 S4 A32])
        (const_int 0 [0])) "produce5.cpp":15:14 -1
     (nil))
(code_label 56 30 31 4 3 (nil) [1 uses])
(note 31 56 34 4 [bb 4] NOTE_INSN_BASIC_BLOCK)
(insn 34 31 35 4 (set (reg:CCGC 17 flags)
        (compare:CCGC (mem/c:SI (plus:DI (reg/f:DI 77 virtual-stack-vars)
                    (const_int -4 [0xfffffffffffffffc])) [5 i+0 S4 A32])
            (const_int 9999 [0x270f]))) "produce5.cpp":15:23 -1
     (nil))
(jump_insn 35 34 36 4 (set (pc)
        (if_then_else (gt (reg:CCGC 17 flags)
                (const_int 0 [0]))
            (label_ref 59)
            (pc))) "produce5.cpp":15:23 -1
     (nil)
 -> 59)
(note 36 35 37 5 [bb 5] NOTE_INSN_BASIC_BLOCK)
(insn 37 36 38 5 (set (reg:SI 94)
        (mem/c:SI (plus:DI (reg/f:DI 77 virtual-stack-vars)
                (const_int -28 [0xffffffffffffffe4])) [5 value+0 S4 A32])) "produce5.cpp":16:23 -1
     (nil))
(insn 38 37 39 5 (set (reg:SI 95)
        (mem/c:SI (plus:DI (reg/f:DI 77 virtual-stack-vars)
                (const_int -4 [0xfffffffffffffffc])) [5 i+0 S4 A32])) "produce5.cpp":16:23 -1
     (nil))
(insn 39 38 40 5 (parallel [
            (set (reg:SI 86 [ _5 ])
                (plus:SI (reg:SI 94)
                    (reg:SI 95)))
            (clobber (reg:CC 17 flags))
        ]) "produce5.cpp":16:23 -1
     (expr_list:REG_EQUAL (plus:SI (mem/c:SI (plus:DI (reg/f:DI 77 virtual-stack-vars)
                    (const_int -28 [0xffffffffffffffe4])) [5 value+0 S4 A32])
            (mem/c:SI (plus:DI (reg/f:DI 77 virtual-stack-vars)
                    (const_int -4 [0xfffffffffffffffc])) [5 i+0 S4 A32]))
        (nil)))
(insn 40 39 41 5 (set (reg:DI 96)
        (sign_extend:DI (reg:SI 86 [ _5 ]))) "produce5.cpp":16:28 -1
     (nil))
(insn 41 40 42 5 (parallel [
            (set (reg:DI 97)
                (mult:DI (reg:DI 96)
                    (const_int -1840700269 [0xffffffff92492493])))
            (clobber (reg:CC 17 flags))
        ]) "produce5.cpp":16:28 -1
     (nil))
(insn 42 41 43 5 (parallel [
            (set (reg:DI 98)
                (lshiftrt:DI (reg:DI 97)
                    (const_int 32 [0x20])))
            (clobber (reg:CC 17 flags))
        ]) "produce5.cpp":16:28 -1
     (nil))
(insn 43 42 44 5 (parallel [
            (set (reg:SI 99)
                (plus:SI (reg:SI 86 [ _5 ])
                    (subreg:SI (reg:DI 98) 0)))
            (clobber (reg:CC 17 flags))
        ]) "produce5.cpp":16:28 -1
     (nil))
(insn 44 43 45 5 (parallel [
            (set (reg:SI 100)
                (ashiftrt:SI (reg:SI 99)
                    (const_int 2 [0x2])))
            (clobber (reg:CC 17 flags))
        ]) "produce5.cpp":16:28 -1
     (nil))
(insn 45 44 46 5 (parallel [
            (set (reg:SI 101)
                (ashiftrt:SI (reg:SI 86 [ _5 ])
                    (const_int 31 [0x1f])))
            (clobber (reg:CC 17 flags))
        ]) "produce5.cpp":16:28 -1
     (nil))
(insn 46 45 47 5 (parallel [
            (set (reg:SI 87 [ _6 ])
                (minus:SI (reg:SI 100)
                    (reg:SI 101)))
            (clobber (reg:CC 17 flags))
        ]) "produce5.cpp":16:28 -1
     (expr_list:REG_EQUAL (div:SI (reg:SI 86 [ _5 ])
            (const_int 7 [0x7]))
        (nil)))
(insn 47 46 48 5 (set (reg:SI 102)
        (reg:SI 87 [ _6 ])) "produce5.cpp":16:28 -1
     (nil))
(insn 48 47 49 5 (parallel [
            (set (reg:SI 103)
                (ashift:SI (reg:SI 102)
                    (const_int 3 [0x3])))
            (clobber (reg:CC 17 flags))
        ]) "produce5.cpp":16:28 -1
     (nil))
(insn 49 48 50 5 (set (reg:SI 102)
        (reg:SI 103)) "produce5.cpp":16:28 -1
     (expr_list:REG_EQUAL (mult:SI (reg:SI 87 [ _6 ])
            (const_int 8 [0x8]))
        (nil)))
(insn 50 49 51 5 (parallel [
            (set (reg:SI 102)
                (minus:SI (reg:SI 102)
                    (reg:SI 87 [ _6 ])))
            (clobber (reg:CC 17 flags))
        ]) "produce5.cpp":16:28 -1
     (expr_list:REG_EQUAL (mult:SI (reg:SI 87 [ _6 ])
            (const_int 7 [0x7]))
        (nil)))
(insn 51 50 52 5 (parallel [
            (set (reg:SI 87 [ _6 ])
                (minus:SI (reg:SI 86 [ _5 ])
                    (reg:SI 102)))
            (clobber (reg:CC 17 flags))
        ]) "produce5.cpp":16:28 -1
     (nil))
(insn 52 51 53 5 (set (reg:SI 88 [ acc.0_7 ])
        (mem/v/c:SI (plus:DI (reg/f:DI 77 virtual-stack-vars)
                (const_int -8 [0xfffffffffffffff8])) [5 acc+0 S4 A64])) "produce5.cpp":16:13 -1
     (nil))
(insn 53 52 54 5 (parallel [
            (set (reg:SI 89 [ _8 ])
                (plus:SI (reg:SI 87 [ _6 ])
                    (reg:SI 88 [ acc.0_7 ])))
            (clobber (reg:CC 17 flags))
        ]) "produce5.cpp":16:13 -1
     (nil))
(insn 54 53 55 5 (set (mem/v/c:SI (plus:DI (reg/f:DI 77 virtual-stack-vars)
                (const_int -8 [0xfffffffffffffff8])) [5 acc+0 S4 A64])
        (reg:SI 89 [ _8 ])) "produce5.cpp":16:13 -1
     (nil))
(insn 55 54 57 5 (parallel [
            (set (mem/c:SI (plus:DI (reg/f:DI 77 virtual-stack-vars)
                        (const_int -4 [0xfffffffffffffffc])) [5 i+0 S4 A32])
                (plus:SI (mem/c:SI (plus:DI (reg/f:DI 77 virtual-stack-vars)
                            (const_int -4 [0xfffffffffffffffc])) [5 i+0 S4 A32])
                    (const_int 1 [0x1])))
            (clobber (reg:CC 17 flags))
        ]) "produce5.cpp":15:5 -1
     (nil))
(jump_insn 57 55 58 5 (set (pc)
        (label_ref 56)) "produce5.cpp":15:5 -1
     (nil)
 -> 56)
(barrier 58 57 59)
(code_label 59 58 60 6 2 (nil) [1 uses])
(note 60 59 61 6 [bb 6] NOTE_INSN_BASIC_BLOCK)
(insn 61 60 0 6 (set (reg:SI 90 [ vol.1_27 ])
        (mem/v/c:SI (plus:DI (reg/f:DI 77 virtual-stack-vars)
                (const_int -8 [0xfffffffffffffff8])) [5 acc+0 S4 A64])) "produce5.cpp":18:5 -1
     (nil))
