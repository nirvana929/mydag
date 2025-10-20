# cally解读

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







