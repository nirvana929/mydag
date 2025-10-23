# cally解读

## 代码实现功能

### 1、将函数调用图转换为线程调用图

```pthread_create
(insn 15 14 16 2 (set (reg:DI 2 cx)
        (const_int 0 [0])) "./produce_consume.c":97:5 -1
     (nil))
(insn 16 15 17 2 (set (reg:DI 1 dx)
        (symbol_ref:DI ("consumer") [flags 0x3]  <function_decl 0x7f691bfae800 consumer>)) "./produce_consume.c":97:5 -1
     (nil))
(insn 17 16 18 2 (set (reg:DI 4 si)
        (const_int 0 [0])) "./produce_consume.c":97:5 -1
     (nil))
(insn 18 17 19 2 (set (reg:DI 5 di)
       (symbol_ref:DI ("thread1") [flags 0x2]  <var_decl 0x7f234cd172d0 thread1>)) "./main.c":69:9 -1
     (nil))
(call_insn 19 18 20 2 (set (reg:SI 0 ax)
        (call (mem:QI (symbol_ref:DI ("pthread_create") [flags 0x41]  <function_decl 0x7f691c39a300 pthread_create>) [0 pthread_create S1 A8])
            (const_int 0 [0]))) "./produce_consume.c":97:5 -1
     (expr_list:REG_EH_REGION (const_int 0 [0])
        (nil))
    (expr_list:DI (use (reg:DI 5 di))
        (expr_list:DI (use (reg:DI 4 si))
            (expr_list:DI (use (reg:DI 1 dx))
                (expr_list:DI (use (reg:DI 2 cx))
                    (nil))))))
```

扫描rtl文件，找到pthread_create对应的代码块，如上图，注意到它一共有四个参数，我们需要关注第一个（线程ID）和第三个参数（函数入口，理解为线程名），分别存储在reg:DI 5 di和reg:DI 1 dx里面

```pthread_join
(insn 73 72 74 9 (set (reg:DI 4 si)
        (const_int 0 [0])) "./produce_consume.c":107:5 -1
     (nil))
(insn 74 73 75 9 (set (reg:DI 5 di)
        (symbol_ref:DI ("thread1") [flags 0x2]  <var_decl 0x7f234cd172d0 thread1>)) "./main.c":69:9 -1
     (nil))
(call_insn 75 74 76 9 (set (reg:SI 0 ax)
        (call (mem:QI (symbol_ref:DI ("pthread_join") [flags 0x41]  <function_decl 0x7f691c39a500 pthread_join>) [0 pthread_join S1 A8])
            (const_int 0 [0]))) "./produce_consume.c":107:5 -1
     (nil)
    (expr_list:DI (use (reg:DI 5 di))
        (expr_list:DI (use (reg:DI 4 si))
            (nil))))
```

同理，pthread_join有两个参数，主要关注第一个参数（线程ID），存储在reg:DI 5 di，我们可以通过第一个参数找到配对的pthread_create和pthread_join

建图：

对于pthread_create节点，它将生成一个节点，节点以线程名命名，这个节点将连接该线程执行的函数，当执行到最后一个函数时，将连接到配对的pthreadjoin节点

### 2、处理条件、循环节点

if节点：当遇到if节点时，有两种可能，结果为true，则生成一个true节点，并且后面连接if里面的节点，结果为false，生成一个false节点，连接if外面的第一个节点，同时，if里面的最后一个节点需要连接if外面的第一个节点

while、for,借助rtl里面的跳转关系

### 3、节点编号
C语言程序中有多个函数被反复调用，为了区分，我们将对每一个节点进行编号，这样就可以将函数调用图转化为具有时间顺序的线程调用图
具体规则：cally会解析每一个函数块，每一个函数块则对应一个线程，里面的节点按数字开始，顺序编号



## 正则表达式转化表

| function = re.compile(r"^;; Function (?P<mangle>.*)\s+\((?P<function>\S+)(,.*)?\).*$" | 自定义函数名                             |
| ------------------------------------------------------------ | :--------------------------------------- |
| call = re.compile(r"^.*\(call.*\"(?P<target>.*)\".*$")       | 函数调用（配合symbol）                   |
| symbol_ref = re.compile(r"^.*\(symbol_ref.*\"(?P<target>.*)\".*$") | 函数调用（匹配调用的函数名）             |
| mytaskset = re.compile(r".*\(set\s+\(reg:DI\s+1\s+dx\)")     |                                          |
| mytask = re.compile(r".*\(symbol_ref:DI \(\"(?P<target>.*?)\"[^\"]*\)") |                                          |
| mythreadset = re.compile(r".*\(set\s+\(reg:DI\s+5\s+di\)")   |                                          |
| mythread = re.compile(r".*\(symbol_ref:DI \(\"(?P<target>.*?)\"\)") |                                          |
| myjointhread = re.compile(r".*\(reg:DI \d+ \[ (thread\d*).*\]") |                                          |
| condition_jump = re.compile(r"\(jump_insn\s+(\d+)")          |                                          |
| condition_if = re.compile(r".*\(if_then_else")               |                                          |
| condition_label = re.compile(r".*\(label_ref\s+(\d+)")       |                                          |
| condition_barrier = re.compile(r"\(barrier")                 |                                          |
| condition_codelabel = re.compile(r"\(code_label\s+\d+")      |                                          |
| source_row_str=re.compile(r"^[^:]+:(?P<target>\d+):\d+")     | 当读到create，往下读一行，读取对应的行数 |



## 变量含义表

| mytarget  | pthreadcreate或者pthreadjoin绑定的thread                |
| --------- | ------------------------------------------------------- |
| threadnum | threadtask3对应的RTL名字threadA                         |
| mytarget  | threadtask3                                             |
| calls     | cally的函数调用                                         |
| mycalls   | 'main/while/pthread_join7'     对节点处理过后的函数调用 |
| myinfo    | 存储pthread_create和pthread_join的绑定信息              |

![image-20251013162109516](C:\Users\chove\AppData\Roaming\Typora\typora-user-images\image-20251013162109516.png)

myinfo的查找逻辑，join6到thread3，thread3到producer



## 程序架构设计

预读模块（用于处理条件节点）

读取项目中的jump、code标志

对标志进行处理，删除一些code

得到信息数组function_pre

### 源文件预读模块

对源文件的预读

设计字典存储信息

source_code[];

格式：行数  线程名字

![image-20250801210247364](C:\Users\chove\AppData\Roaming\Typora\typora-user-images\image-20250801210247364.png)

cally代码改动，考虑到出现pthread_create和pthread_join就需要往下读取一行，可以设置标志，来控制下一行读取

create_flag

join_flag

### 遇到的问题

 python3 ./mycally.py ./cfile/simpletest.c.233r.expand |\dot -Grankdir=LR -Tpng -o ./cfile/c_img/produce_5.png

 python3 ./mycally.py ./cfile/simpletest.c.233r.expand > ./cfile/c_img/simpletest_4.dot

![image-20251013163756972](C:\Users\chove\AppData\Roaming\Typora\typora-user-images\image-20251013163756972.png)

![image-20251013163815912](C:\Users\chove\AppData\Roaming\Typora\typora-user-images\image-20251013163815912.png)



报错时，检查是否匹配







