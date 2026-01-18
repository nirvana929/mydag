//生成代码要求
//1、数据计算中标注了相应的时间，替换成等价的耗时代码（缩小10倍耗时，1s就缩小为0.1s）
//2、请按照我现在的格式生成代码，每个thread转换成一个thread函数，不要用数组的形式定义
//总共只要11个函数，10个thread加一个main
//你要做的是严格翻译，而不是调整代码块结构，进行简化，我要的就是我现在写的描叙结构
//注意创建和销毁线程函数的位置保持与描叙一致
thread0{
  数据计算();执行0.5s
  create_thread(thread2);
  create_thread(thread3);
  create_thread(thread4);
}
thread1{
  数据计算();执行0.5s
  create_thread(thread5);
  create_thread(thread6);
  create_thread(thread7);
}
thread2{
  数据计算();执行4s
  join(thread2);
}
thread3{
  数据计算();执行3.5s
  join(thread3);
}
thread4{
  数据计算();执行3s
  join(thread4);
}
thread5{
  数据计算();执行0.8s
  join(thread5);
}
thread6{
  数据计算();执行0.8s
  join(thread6);
}
thread7{
  数据计算();执行0.8s
  join(thread7);
}
thread8{
  数据计算();执行3s
    join(thread8);
}
thread9{
  数据计算();执行6s
  join(thread9);
}
int main(int argc, char const *argv[])
{
  create_thread(thread0);
  create_thread(thread1);
  create_thread(thread9);
  join(thread0);
  join(thread1);
  create_thread(thread8);

  return 0;
}







