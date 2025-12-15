# thread_bind 测试

用于验证：从 GCC RTL `.expand` 文件中识别 `pthread_join` 的线程句柄实参，并输出
`pthread_join<序号>: <变量名>` 的映射（序号为“第几个识别到的 join”）。

## 运行

- 运行单测：`python3 -m unittest discover -s test/thread_bind -p 'test_*.py'`
- 生成映射文件（默认输出到 `<expand>.join_bind.txt`）：`python3 test/thread_bind/extract_join_binding.py mycallyplus/配置文件/main1/main1.c.233r.expand`
- 指定输出文件：`python3 test/thread_bind/extract_join_binding.py mycallyplus/配置文件/main1/main1.c.233r.expand --out test/thread_bind/main1.join_bind.txt`
