# Mx编译器优化实现

本项目是一个完整的Mx语言编译器，包含前端语法分析、语义分析、中间代码生成和后端代码生成。本文档重点介绍编译器中实现的四个关键优化技术。

## 优化概览

编译器实现了以下四个主要优化：

1. **DCE (Dead Code Elimination)** - 死代码消除
2. **ADCE (Aggressive Dead Code Elimination)** - 激进死代码消除  
3. **AST层面的常量折叠** - 编译期常量表达式求值
4. **IR层面的乘法优化** - 乘法指令的强度折减

其中DCE和ADCE参考了[lxy的博客](https://www.cnblogs.com/lixingyang/p/17728846.html)

## 1. DCE (Dead Code Elimination) - 死代码消除

### 实现位置
`src/Opt/CFG.java` 第490-540行

### 算法原理
DCE使用基于使用-定义链的算法来识别和消除无用的指令：

```java
public void DCE() {
    HashSet<String> Regs = new HashSet<>();
    HashMap<String, HashSet<Instr>> useMap = new HashMap<>();
    HashMap<String, Instr> defMap = new HashMap<>();
    HashSet<String> args = new HashSet<>(IRFunc.params);
    
    // 构建使用-定义关系
    for (Instr instr : instrs) {
        // 收集所有寄存器的使用和定义信息
    }
    
    // 迭代消除死代码
    while (!Regs.isEmpty()) {
        String reg = Regs.iterator().next();
        Regs.remove(reg);
        if (useMap.containsKey(reg) && useMap.get(reg).isEmpty()) {
            Instr S = defMap.get(reg);
            if (S.def.size() == 1) {
                S.isRemoved = true; // 标记为删除
                // 递归处理该指令使用的寄存器
            }
        }
    }
}
```

### 优化效果
- 消除定义后未被使用的变量和计算
- 减少无效的内存操作和算术运算
- 简化控制流图结构

## 2. ADCE (Aggressive Dead Code Elimination) - 激进死代码消除

### 实现位置  
`src/Opt/CFG.java` 第540-612行

### 算法原理
ADCE采用更激进的策略，基于活跃性分析进行死代码消除：

```java
public void ADCE() {
    HashSet<Instr> workList = new HashSet<>();
    HashSet<Instr> liveInstrs = new HashSet<>();
    
    // 初始化关键指令（存储、函数调用、返回）
    for (BasicBlock curBlock : rpo) {
        for (Instr instr : curBlock.Instrs) {
            if (instr instanceof storeInstr) workList.add(instr);
            if (instr instanceof callInstr) workList.add(instr);
        }
        if (curBlock.Ctrl instanceof retInstr ret) workList.add(ret);
    }
    
    // 标记传播算法
    while (!workList.isEmpty()) {
        Instr instr = workList.iterator().next();
        workList.remove(instr);
        liveInstrs.add(instr);
        
        // 向后传播活跃性
        for (String use : instr.use) {
            Instr def = defMap.get(use);
            if (def != null && !liveInstrs.contains(def)) {
                workList.add(def);
            }
        }
    }
    
    // 删除非活跃指令
    for (BasicBlock curBlock : rpo) {
        for (Instr instr : curBlock.Instrs) {
            if (!liveInstrs.contains(instr)) instr.isRemoved = true;
        }
    }
}
```

### ADCE与DCE的区别
- **DCE**：基于局部的使用-定义关系，较为保守
- **ADCE**：基于全局活跃性分析，能够发现更多死代码
- **ADCE**：考虑控制流依赖，处理更复杂的情况

## 3. AST层面的常量折叠

### 实现位置
`src/Frontend/ASTBuilder.java` 第22-148行和各个visit方法中

### 算法原理
在AST构建过程中识别常量表达式并直接计算结果：

```java
// 整数二元运算常量折叠
private ExprNode foldIntBinaryOp(binaryExprNode.binaryOpType op, int left, int right, position pos) {
    int result;
    switch (op) {
        case add -> result = left + right;
        case sub -> result = left - right;
        case mul -> result = left * right;
        case div -> {
            if (right == 0) return null; // 避免除零
            result = left / right;
        }
        case mod -> {
            if (right == 0) return null;
            result = left % right;
        }
        // ... 其他运算
    }
    return createIntConstant(result, pos);
}

// 在二元表达式访问中应用常量折叠
@Override
public ASTNode visitBinaryExpr1(MxParser.BinaryExpr1Context ctx) {
    ExprNode lhs = (ExprNode) visit(ctx.expression(0));
    ExprNode rhs = (ExprNode) visit(ctx.expression(1));
    
    // 尝试常量折叠
    if (isIntConstant(lhs) && isIntConstant(rhs)) {
        int leftVal = getIntValue(lhs);
        int rightVal = getIntValue(rhs);
        ExprNode folded = foldIntBinaryOp(opType, leftVal, rightVal, new position(ctx));
        if (folded != null) {
            return folded; // 返回折叠后的常量
        }
    }
    
    // 无法折叠，返回普通二元表达式节点
    return new binaryExprNode(/* ... */);
}
```

### 支持的折叠类型
- **整数运算**：加减乘除、位运算、移位运算
- **布尔运算**：逻辑与或、比较运算  
- **一元运算**：负号、按位取反、逻辑非
- **比较运算**：整数和布尔值的相等性比较

### 优化效果
- 编译期完成常量计算，减少运行时开销
- 简化表达式树结构
- 为后续优化提供更好的输入

## 4. IR层面的乘法优化

### 实现位置
`src/Opt/Multiply.java` 全文

### 算法原理
将乘法运算转换为更高效的指令序列：

### 优化规则
1. **乘以0**：`x * 0` → `0 + 0` (常量0)
2. **乘以1**：`x * 1` → `x + 0` (恒等元)  
3. **乘以-1**：`x * (-1)` → `0 - x` (取负)
4. **乘以2的幂**：`x * 2^k` → `x << k` (左移位)
   - `x * 2` → `x << 1`
   - `x * 4` → `x << 2`  
   - `x * 8` → `x << 3`
5. 乘以小常数：`x * 3` → `x + (x << 1)`



## 测试用例

项目包含专门的常量折叠和乘法优化测试用例 `test_multiply.mx`：

```mx
int main() {
    int a = 10;
    int b = a * 0;      // 优化为 0
    int c = a * 1;      // 优化为 a
    int d = a * 2;      // 优化为 a << 1
    int e = a * 4;      // 优化为 a << 2
    int f = a * 8;      // 优化为 a << 3
    int g = a * 16;     // 优化为 a << 4
    int h = a * (-1);   // 优化为 0 - a
    int i = 5 * 3;      // 常量折叠为 15
    return 0;
}
```
