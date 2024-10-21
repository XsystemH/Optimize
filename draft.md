use def
```java
if (irInstr instanceof binInstr bin) {
                    for (Instr alloca : func.alloc) {
                        boolean flag = false;
                        if (bin.result.equals(((allocaInstr)alloca).result)) {
                            ((allocaInstr) alloca).defs.add(bin);
                            flag = true;
                        }
                        if (bin.operand1.equals(((allocaInstr)alloca).result)) {
                            ((allocaInstr) alloca).uses.add(bin);
                            flag = true;
                        }
                        if (bin.operand2.equals(((allocaInstr)alloca).result)) {
                            ((allocaInstr) alloca).uses.add(bin);
                            flag = true;
                        }

                        if (flag) {
                            if (((allocaInstr) alloca).blockName != null && !Objects.equals(((allocaInstr) alloca).blockName, currentBlock.Label.getLabel()))
                                ((allocaInstr) alloca).oneBlock = false;
                            else ((allocaInstr) alloca).blockName = currentBlock.Label.getLabel();
                            ((allocaInstr) alloca).lsOnly = false;
                        }
                    }
                }
                if (irInstr instanceof callInstr call) {
                    for (Instr alloca : func.alloc) {
                        boolean flag = false;
                        if (call.result.equals(((allocaInstr)alloca).result)) {
                            ((allocaInstr) alloca).defs.add(call);
                            flag = true;
                        }
                        for (Expr exp : call.paramExpr) {
                            if (exp.equals(((allocaInstr)alloca).result)) {
                                ((allocaInstr) alloca).uses.add(call);
                                flag = true;
                            }
                        }
                        if (flag) {
                            if (((allocaInstr) alloca).blockName != null && !Objects.equals(((allocaInstr) alloca).blockName, currentBlock.Label.getLabel()))
                                ((allocaInstr) alloca).oneBlock = false;
                            else ((allocaInstr) alloca).blockName = currentBlock.Label.getLabel();
                            ((allocaInstr) alloca).lsOnly = false;
                        }
                    }
                }
                if (irInstr instanceof getInstr get) {
                    for (Instr alloca : func.alloc) {
                        boolean flag = false;
                        if (get.result.equals(((allocaInstr)alloca).result)) {
                            ((allocaInstr) alloca).defs.add(get);
                            flag = true;
                        }
                        if (get.ptr.equals(((allocaInstr) alloca).result)) {
                            ((allocaInstr) alloca).uses.add(get);
                            flag = true;
                        }
                        for (Expr expr : get.idx) {
                            if (expr.equals(((allocaInstr)alloca).result)) {
                                ((allocaInstr) alloca).uses.add(get);
                                flag = true;
                            }
                        }
                        if (flag) {
                            if (((allocaInstr) alloca).blockName != null && !Objects.equals(((allocaInstr) alloca).blockName, currentBlock.Label.getLabel()))
                                ((allocaInstr) alloca).oneBlock = false;
                            else ((allocaInstr) alloca).blockName = currentBlock.Label.getLabel();
                            ((allocaInstr) alloca).lsOnly = false;
                        }
                    }
                }
                if (irInstr instanceof icmpInstr icmp) {
                    for (Instr alloca : func.alloc) {
                        boolean flag = false;
                        if (icmp.result.equals(((allocaInstr)alloca).result)) {
                            ((allocaInstr) alloca).defs.add(icmp);
                            flag = true;
                        }
                        if (icmp.op1.equals(((allocaInstr)alloca).result)) {
                            ((allocaInstr) alloca).uses.add(icmp);
                            flag = true;
                        }
                        if (icmp.op2.equals(((allocaInstr)alloca).result)) {
                            ((allocaInstr) alloca).uses.add(icmp);
                            flag = true;
                        }
                        if (flag) {
                            if (((allocaInstr) alloca).blockName != null && !Objects.equals(((allocaInstr) alloca).blockName, currentBlock.Label.getLabel()))
                                ((allocaInstr) alloca).oneBlock = false;
                            else ((allocaInstr) alloca).blockName = currentBlock.Label.getLabel();
                            ((allocaInstr) alloca).lsOnly = false;
                        }
                    }
                }
                if (irInstr instanceof selectInstr select) {
                    for (Instr alloca : func.alloc) {
                        boolean flag = false;
                        if (select.result.equals(((allocaInstr)alloca).result)) {
                            ((allocaInstr) alloca).defs.add(select);
                            flag = true;
                        }
                        if (select.val1.equals(((allocaInstr)alloca).result)) {
                            ((allocaInstr) alloca).uses.add(select);
                            flag = true;
                        }
                        if (select.val2.equals(((allocaInstr)alloca).result)) {
                            ((allocaInstr) alloca).uses.add(select);
                            flag = true;
                        }
                        if (flag) {
                            if (((allocaInstr) alloca).blockName != null && !Objects.equals(((allocaInstr) alloca).blockName, currentBlock.Label.getLabel()))
                                ((allocaInstr) alloca).oneBlock = false;
                            else ((allocaInstr) alloca).blockName = currentBlock.Label.getLabel();
                            ((allocaInstr) alloca).lsOnly = false;
                        }
                    }
                }
```

ret
```java
for (Instr alloca : func.alloc) {
                    boolean flag = false;
                    if (ret.value.equals(((allocaInstr)alloca).result)) {
                        ((allocaInstr) alloca).uses.add(ret);
                        flag = true;
                    }
                    if (flag) {
                        if (((allocaInstr) alloca).blockName != null && !Objects.equals(((allocaInstr) alloca).blockName, currentBlock.Label.getLabel()))
                            ((allocaInstr) alloca).oneBlock = false;
                        else ((allocaInstr) alloca).blockName = currentBlock.Label.getLabel();
                        ((allocaInstr) alloca).lsOnly = false;
                    }
                }
```

br
```java
for (Instr alloca : func.alloc) {
                    boolean flag = false;
                    if (br.cond.equals(((allocaInstr)alloca).result)) {
                        ((allocaInstr) alloca).uses.add(br);
                        flag = true;
                    }
                    if (flag) {
                        if (((allocaInstr) alloca).blockName != null && !Objects.equals(((allocaInstr) alloca).blockName, currentBlock.Label.getLabel()))
                            ((allocaInstr) alloca).oneBlock = false;
                        else ((allocaInstr) alloca).blockName = currentBlock.Label.getLabel();
                        ((allocaInstr) alloca).lsOnly = false;
                    }
                }
```