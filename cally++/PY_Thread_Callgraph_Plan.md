# Python 线程调用图生成方案

目标：针对 Python 源文件（单模块），提取函数调用关系并突出线程创建/启动流程，生成简洁的 DOT 调用图。

## 1. 适用场景
- 轻量级脚本/服务，主要通过 `threading.Thread`（或从 `threading import Thread`）启动线程。
- 希望快速了解“哪个函数创建了线程、线程入口是什么，以及线程内部调用链”。
- 不追求完整的运行时动态信息（如装饰器、动态导入、反射），接受静态 AST 分析带来的近似。

## 2. 核心思路
1. 使用 Python `ast` 模块解析源文件，构建抽象语法树。
2. AST 访问器遍历各个函数定义：
   - 记录函数名（含类方法名 `Class.method`）。
   - 在函数体内捕捉 `Call` 节点，推断被调用函数的标识符并建立调用边。
3. 专门捕获线程创建：
   - 识别 `threading.Thread(...)` 或 `Thread(...)` 的调用。
   - 从 `target=<func>`（或位置参数第 1 个）解析线程入口函数名。
   - 把“当前函数 -> 线程入口”作为特殊边（标记 `style=dashed`, `color=blue`）。
4. 将非函数作用域（模块顶层）视为 `__main__`，便于在图上看到脚本主流程。
5. 输出 DOT：
   - 用户函数作为节点；
   - 普通调用边：实线；
   - 线程创建边：虚线、蓝色；
   - 可选标注 `Thread join`（检测 `thread.join()` 调用）。

## 3. 处理细节
- **函数命名**：
  - 顶层函数：`foo`
  - 类方法：`Class.foo`
  - 嵌套函数：`outer.inner`（使用栈记录当前作用域）。

- **调用目标解析**：
  - `ast.Name(id="foo")` -> `foo`
  - `ast.Attribute(value=Name(id="obj"), attr="bar")` -> `obj.bar`
  - `ast.Attribute(value=Name(id="module"), attr="func")` -> `module.func`
  - 其余复杂表达式（如 lambda、下标、call 返回值）忽略。

- **线程 target 解析**：
  - 优先 `keyword target=<expr>`，若无则取第一个位置参数。
  - 若 target 是 `Name/Attribute`, 提取其 `id`/`module.func` 名称。

- **join 识别**：
  - 匹配 `X.join()` 调用，输出虚线红色边 `X.join -> current_function`（仅做标记，可按需扩展）。

- **过滤**：
  - 可提供简单前缀黑名单（如 `logging`, `time`) 的节点/边过滤，初版保持全部，后续迭代。

## 4. 流程示例
```
python py_thread_callgraph.py simple_thread.py --output simple_thread_py.dot --root __main__
```
输出 DOT：
```
"__main__" -> "main";
"main" -> "ThreadManager.start";
"ThreadManager.start" -> "spawn_worker" [style=dashed, color=blue, label="thread"];
...
```
随后可用 `dot -Tpng simple_thread_py.dot -o simple_thread_py.png` 渲染。

## 5. 限制 & 扩展
- 静态分析无法捕获动态生成/反射调用。
- 仅识别标准 `threading.Thread`; 若使用 `multiprocessing`, `concurrent.futures` 需扩展规则。
- 暂不解析 `asyncio`，后续可单独增加协程关系。
- 多文件工程需先合并或逐文件生成图再聚合。
- 可在 GUI 中新增“Python 模式”，调用该脚本并在现有画布中展示结果。

## 6. 下一步
1. 编写 `py_thread_callgraph.py` 脚本：
   - AST 解析 + 调用图构建 + DOT 输出。
   - CLI 参数：`--input`, `--output`, `--root`, `--highlight-thread`。
2. 将脚本集成到 GUI：选择 .py 源文件 → 生成 DOT/PNG。
3. 根据实际项目迭代：增加过滤器、识别更多线程 API、导出 JSON 等。

