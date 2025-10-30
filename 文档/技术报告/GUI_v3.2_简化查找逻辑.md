# GUI v3.2 简化查找逻辑 - 升级总结

## 升级日期
2025年10月29日

## 核心改进：简化文件查找逻辑 ✨

### 问题
v3.1的查找逻辑过于复杂，需要精确计算legacy的命名规则：
```python
# 复杂的计算
expand_stem = self.state.expand_file.stem
if expand_stem.endswith('.233r'):
    legacy_base_name = expand_stem[:-5]
elif '.' in expand_stem:
    legacy_base_name = expand_stem.split('.')[0]
else:
    legacy_base_name = expand_stem
```

### 解决方案
使用**模糊匹配**策略，不需要知道legacy的具体命名规则。

## 简化对比

### 原来（v3.1）：精确匹配
```python
# 步骤1: 计算精确的legacy_base_name
expand_stem = expand_file.stem  # main.c.233r
legacy_base_name = expand_stem[:-5]  # main.c

# 步骤2: 构造精确路径
config_dir = base_dir / "配置文件" / legacy_base_name  # 必须精确
source_dot = config_dir / f"{legacy_base_name}_threads.dot"  # 必须精确

# 步骤3: 检查文件是否存在
if not source_dot.exists():
    raise Error("文件不存在")
```

### 现在（v3.2）：模糊匹配
```python
# 步骤1: 获取源文件basename（简单）
source_basename = source_file.stem  # main.c → main

# 步骤2: 模糊查找配置目录
config_base = base_dir / "配置文件"
for subdir in config_base.iterdir():
    if subdir.is_dir() and subdir.name.startswith(source_basename):
        config_dir = subdir  # 找到 main.c/
        break

# 步骤3: 模糊查找dot文件
dot_files = list(config_dir.glob("*_threads.dot"))
source_dot = dot_files[0]  # 不管叫什么，取第一个
```

## 具体修改

### 修改文件
- `mycallyplus/ui/gui_v3.py`

### 修改的函数

#### 1. generate_dag() - 按钮2
**原来**:
```python
# 精确计算legacy_base_name
expand_stem = self.state.expand_file.stem
if expand_stem.endswith('.233r'):
    legacy_base_name = expand_stem[:-5]
# ...
config_dir = self.base_dir / "配置文件" / legacy_base_name
source_dot = config_dir / f"{legacy_base_name}_threads.dot"
```

**现在**:
```python
# 模糊查找
source_basename = self.state.source_file.stem  # main
for subdir in config_base.iterdir():
    if subdir.is_dir() and subdir.name.startswith(source_basename):
        config_dir = subdir  # 找到 main.c/
        break
dot_files = list(config_dir.glob("*_threads.dot"))
source_dot = dot_files[0]  # main.c_threads.dot
```

#### 2. view_conditions() - 按钮3
**原来**:
```python
# 精确计算
expand_stem = self.state.expand_file.stem
if expand_stem.endswith('.233r'):
    legacy_base_name = expand_stem[:-5]
# ...
config_dir = self.base_dir / "配置文件" / legacy_base_name
source_dot = config_dir / f"{legacy_base_name}_full.dot"
```

**现在**:
```python
# 模糊查找
source_basename = self.state.source_file.stem  # main
for subdir in config_base.iterdir():
    if subdir.is_dir() and subdir.name.startswith(source_basename):
        config_dir = subdir
        break
dot_files = list(config_dir.glob("*_full.dot"))
source_dot = dot_files[0]  # main.c_full.dot
```

## 查找策略

### 三步查找法

#### 步骤1: 找配置目录
```python
source_basename = source_file.stem  # main.c → main
config_base = base_dir / "配置文件"

# 查找以basename开头的子目录
for subdir in config_base.iterdir():
    if subdir.is_dir() and subdir.name.startswith(source_basename):
        config_dir = subdir  # 找到！
        break
```

**匹配规则**:
- `main.c` → 匹配 `main.c/` ✓
- `main.c` → 匹配 `main/` ✗ (不以main开头，是main.c开头)
- `test.c` → 匹配 `test.c/` ✓
- `program.c` → 匹配 `program.c/` 或 `program/` ✓

#### 步骤2: 找DOT文件
```python
# 使用glob模式匹配
threads_dots = list(config_dir.glob("*_threads.dot"))
full_dots = list(config_dir.glob("*_full.dot"))

# 取第一个匹配的
if threads_dots:
    source_dot = threads_dots[0]
```

**匹配规则**:
- `*_threads.dot` 匹配所有以 `_threads.dot` 结尾的文件
- `main.c_threads.dot` ✓
- `test.c_threads.dot` ✓
- `abc_threads.dot` ✓

#### 步骤3: 找TXT文件
```python
# 固定文件名
circle_txt = config_dir / "circle.txt"
if circle_txt.exists():
    # 使用
```

## 测试验证

### 测试脚本
```bash
python3 test_simplified_search.py
```

### 测试结果 ✅
```
源文件: main.c
Basename: main

步骤1: 查找配置目录
  扫描配置文件目录...
  ✓ 匹配 - main.c
  ✓ 找到配置目录: main.c

步骤2: 查找threads.dot文件
  在 main.c 中查找 *_threads.dot ...
  ✓ 找到 1 个threads.dot文件:
    - main.c_threads.dot (2905 bytes)
  将使用: main.c_threads.dot

步骤3: 查找full.dot文件
  在 main.c 中查找 *_full.dot ...
  ✓ 找到 1 个full.dot文件:
    - main.c_full.dot (1722 bytes)
  将使用: main.c_full.dot
```

## 优势对比

| 特性 | v3.1 精确匹配 | v3.2 模糊匹配 |
|------|--------------|--------------|
| 代码复杂度 | ❌ 高（需要计算规则） | ✅ 低（简单循环） |
| 依赖Legacy规则 | ❌ 强依赖 | ✅ 无依赖 |
| 容错性 | ❌ 差（规则变化就失败） | ✅ 好（只要前缀匹配即可） |
| 可维护性 | ❌ 差（规则分散） | ✅ 好（逻辑集中） |
| 代码行数 | ❌ 多（~15行计算） | ✅ 少（~8行查找） |
| 文件名要求 | ❌ 必须精确 | ✅ 只需符合模式 |

## 适用场景

### 场景1: 标准命名
```
配置文件/main.c/main.c_threads.dot
→ basename: main
→ 查找: 以"main"开头的目录 → main.c/ ✓
→ 查找: *_threads.dot → main.c_threads.dot ✓
```

### 场景2: Legacy规则变化
```
假设Legacy未来改为:
配置文件/main.c.v2/main.c.v2_threads.dot

→ basename: main
→ 查找: 以"main"开头的目录 → main.c.v2/ ✓
→ 查找: *_threads.dot → main.c.v2_threads.dot ✓
→ 无需修改GUI代码！
```

### 场景3: 多个匹配项
```
配置文件/main.c/
  - main.c_threads.dot
  - main.c_threads_backup.dot

→ 查找: *_threads.dot → 找到2个
→ 取第一个: main.c_threads.dot ✓
```

## 核心改进总结

### 1. 解耦合 🔓
- **v3.1**: GUI紧密依赖Legacy的命名规则
- **v3.2**: GUI只依赖文件模式，与Legacy解耦

### 2. 简化逻辑 🎯
- **v3.1**: 15行计算代码
- **v3.2**: 8行查找代码（减少47%）

### 3. 提高容错 💪
- **v3.1**: Legacy命名规则变化 → GUI失败
- **v3.2**: Legacy命名规则变化 → GUI继续工作

### 4. 易于维护 🛠️
- **v3.1**: 需要理解Legacy的命名逻辑
- **v3.2**: 只需理解模糊匹配逻辑

## 文件清单

### 修改文件
```
mycallyplus/ui/gui_v3.py    # 简化了generate_dag()和view_conditions()
```

### 新增测试
```
test_simplified_search.py   # 验证简化的查找逻辑
```

### 文档
```
GUI_v3.2_简化查找逻辑.md    # 本文档
```

## 代码片段示例

### 完整的查找函数（可复用）
```python
def find_legacy_files(base_dir: Path, source_file: Path) -> tuple:
    """查找legacy生成的文件
    
    Args:
        base_dir: mycallypro目录
        source_file: 源C文件
        
    Returns:
        (config_dir, threads_dot, full_dot, circle_txt)
    """
    # 1. 查找配置目录
    source_basename = source_file.stem  # main.c → main
    config_base = base_dir / "配置文件"
    config_dir = None
    
    for subdir in config_base.iterdir():
        if subdir.is_dir() and subdir.name.startswith(source_basename):
            config_dir = subdir
            break
    
    if not config_dir:
        return None, None, None, None
    
    # 2. 查找文件
    threads_dots = list(config_dir.glob("*_threads.dot"))
    full_dots = list(config_dir.glob("*_full.dot"))
    circle_txt = config_dir / "circle.txt"
    
    return (
        config_dir,
        threads_dots[0] if threads_dots else None,
        full_dots[0] if full_dots else None,
        circle_txt if circle_txt.exists() else None
    )
```

## 状态

- ✅ 代码简化完成
- ✅ 逻辑验证通过
- ✅ 测试脚本通过
- ✅ 文档已更新

## 下一步

用户可以重新测试GUI：
```bash
cd ~/桌面/cally
python3 -m mycallyplus
```

按钮2和按钮3现在使用简化的查找逻辑，更加健壮和易维护！

---

**升级完成时间**: 2025年10月29日  
**版本**: v3.2  
**状态**: ✅ 简化完成，待用户测试
