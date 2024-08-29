package Backend;

import AST.*;
import AST.Cons.*;
import AST.Expr.*;
import AST.Stmt.*;
import IR.*;
import IR.Expression.Constant.boolCons;
import IR.Expression.Constant.intCons;
import IR.Expression.Constant.ptrCons;
import IR.Expression.Expr;
import IR.Expression.Register.*;
import IR.IRType.IRType;
import IR.IRType.IntType;
import IR.IRType.classType;
import IR.IRType.ptrType;
import IR.Instruction.*;
import util.Decl.ClassDecl;
import util.Scope.*;
import util.Type.ReturnType;
import util.Type.Type;

import java.util.ArrayList;

public class IRBuilder implements ASTVisitor{
    public Program program;
    public block strPreDef;
    public funcDef init;
    private block currentBlock;
    private Scope currentScope;
    private funcDef currentFunc;
    private globalScope gScope;
    private int store;
    private int labelNum;
    private Expr lastExpr = null;
    private boolean isLeft = false;

    public IRBuilder(globalScope gScope) {
        program = new Program();
        strPreDef = new block();
        init = new funcDef();
        init.name = ".init";
        currentBlock = program;
        currentScope = gScope;
        this.gScope = gScope;
        store = 0;
        labelNum = 0;
    }

    private IRType type2IR(Type t) {
        IRType ir;
        if (t.dim > 0) {
            ir = new ptrType();
        }
        else if (t.isInt) {
            ir = new IntType(32);
        }
        else if (t.isBool) {
            ir = new IntType(1);
        }
        else if (t.isString) {
            ir = new ptrType();
        }
        else {
            ir = new ptrType();
        }
        return ir;
    }

    public String replaceStr(String input) {
        if (input == null) {
            return null;
        }
        String result = input.replace("\\n", "\\0A");
        result = result.replace("\\\\", "\\5C");
        result = result.replace("\\\"", "\\22");
        return result;
    }

    public int countStr(String input) {
        if (input == null) {
            return 0;
        }
        int ans = input.length() + 1;
        while (input.contains("\\0A")) {
            input = input.replaceFirst("\\\\0A", "?");
            ans -= 2;
        }
        while (input.contains("\\5c")) {
            input = input.replaceFirst("\\\\5c", "?");
            ans -= 2;
        }
        while (input.contains("\\22")) {
            input = input.replaceFirst("\\\\22", "?");
            ans -= 2;
        }
        return ans;
    }

    private int getSize(IRType type) {
        if (type instanceof IntType) return 4;
        if (type instanceof ptrType) return 4;
        ClassDecl c = gScope.getClass(((classType)type).name);
        if (c != null) return c.getSize();
        else throw new RuntimeException("IRBuilder: Wrong Type");
    }

    @Override
    public void visit(ProgramNode it) {
        for(ASTNode element : it.members) {
            if (element instanceof MainNode) {
                currentScope = new globalScope(gScope);
            }
            currentFunc = init;
            element.accept(this);
            if (element instanceof MainNode) {
                currentScope = currentScope.parent;
            }
        }
    }

    @Override
    public void visit(ClassNode it) {
        classDef c = new classDef();
        c.name = it.name;
        for (varDefStmtNode var : it.vars) {
            c.members.add(type2IR(var.type));
        }
        currentBlock.instrs.add(c);
        if (it.constructor != null) {
            currentScope = new classScope(gScope);
            currentScope.className = it.name;
            it.constructor.accept(this);
            currentScope = currentScope.parent;
        }
        for (FuncNode f : it.functions) {
            currentScope = new classScope(gScope);
            currentScope.className = it.name;
            f.accept(this);
            currentScope = currentScope.parent;
        }
    }

    @Override
    public void visit(FuncNode it) {
        currentScope = new funcScope(currentScope);
        funcDef temp = new funcDef();
        currentFunc = temp;
        if (!it.returnType.isVoid)
            temp.returnType = type2IR(it.returnType);
        temp.className = currentScope.isInClass();
        temp.name = it.name;
        block tempBlock = currentBlock;
        currentBlock = temp;
        if (temp.className != null) {
            temp.params.add("this");
            temp.paramTypes.add(new ptrType());
//            allocaInstr a = new allocaInstr();
//            a.type = new ptrType();
//            a.result = new varReg("this.ptr", -1);
//            currentBlock.instrs.add(a);
//            storeInstr st = new storeInstr();
//            st.type = new ptrType();
//            st.value = new varReg("this.this", -1);
//            st.ptr = a.result;
//            currentBlock.instrs.add(st);
//            loadInstr load = new loadInstr();
//            load.type = new ptrType();
//            load.pointer = new varReg("this.this", -1);
//            load.result = new varReg("this", -1);
//            currentBlock.instrs.add(load);
        }
        for (int i = 0; i < it.paramType.size(); i++) {
            temp.params.add(it.paramName.get(i));
            temp.paramTypes.add(type2IR(it.paramType.get(i)));
            currentScope.defineVariable(it.paramName.get(i), it.paramType.get(i));
            allocaInstr a = new allocaInstr();
            a.type = type2IR(it.paramType.get(i));
            a.result = new varReg(it.paramName.get(i), currentScope.depth);
            currentBlock.instrs.add(a);
            storeInstr st = new storeInstr();
            st.type = type2IR(it.paramType.get(i));
            st.value = new varReg(it.paramName.get(i), -1);
            st.ptr = a.result;
            currentBlock.instrs.add(st);
        }
        for (StmtNode s : it.body) {
            s.accept(this);
        }
        currentBlock = tempBlock;
        currentBlock.instrs.add(temp);
        currentScope = currentScope.parent;
    }

    @Override
    public void visit(MainNode it) {
        block temp = currentBlock;
        currentBlock = new mainFn();
        currentFunc = (mainFn)currentBlock;
        init.instrs.add(new retInstr());
        ((mainFn)currentBlock).init = init;
        for (StmtNode s : it.statements) {
            s.accept(this);
        }
        temp.instrs.add(currentBlock);
        currentBlock = temp;
    }

    @Override
    public void visit(blockStmtNode it) {
        currentScope = new Scope(currentScope);
        for (StmtNode s : it.statements) {
            s.accept(this);
        }
        currentScope = currentScope.parent;
    }

    @Override
    public void visit(varDefStmtNode it) {
        if (currentScope.parent == null) { // global
            for (int i = 0; i < it.name.size(); i++) {
                globalInstr instr = new globalInstr();
                instr.type = type2IR(it.type);
                instr.result = new gloReg(it.name.get(i));
                currentBlock.instrs.add(instr);
//                currentScope.defineVariable(it.name.get(i), it.type); gScope already has
                if (it.expr.get(i) != null) {
                    currentBlock = init;
                    it.expr.get(i).accept(this);
                    storeInstr st = new storeInstr();
                    st.type = type2IR(it.type);
                    st.value = lastExpr;
                    st.ptr = instr.result;
                    currentBlock.instrs.add(st);
                    currentBlock = program;
                }
            }
        }
        else {
            for (int i = 0; i < it.name.size(); i++) {
                allocaInstr instr = new allocaInstr();
                instr.type = type2IR(it.type);
                instr.result = new varReg(it.name.get(i), currentScope.depth);
                currentFunc.alloc.add(instr);

                currentScope.defineVariable(it.name.get(i), it.type);

                if (it.expr.get(i) != null) {
                    it.expr.get(i).accept(this);
                    storeInstr instr2 = new storeInstr();
                    instr2.type = type2IR(it.expr.get(i).type);
                    instr2.ptr = instr.result;
                    instr2.value = lastExpr;
                    currentBlock.instrs.add(instr2);
                }
            }
        }
    }

    @Override
    public void visit(ifStmtNode it) {
        brInstr b = new brInstr();
        it.condition.accept(this);
        b.cond = lastExpr;
        b.trueLabel = new label("true", labelNum++);
        b.falseLabel = new label("false", labelNum++);
        label skip = new label("skip", labelNum++);
        currentBlock.instrs.add(b);

        currentBlock.instrs.add(b.trueLabel);
        currentScope = new Scope(currentScope);
        it.thenBlock.accept(this);
        currentScope = currentScope.parent;
        brInstr b2 = new brInstr();
        b2.destLabel = skip;
        currentBlock.instrs.add(b2);

        currentBlock.instrs.add(b.falseLabel);
        currentScope = new Scope(currentScope);
        if (it.elseBlock != null) {
            it.elseBlock.accept(this);
        }
        currentScope = currentScope.parent;
        currentBlock.instrs.add(b2);
        currentBlock.instrs.add(skip);
    }

    @Override
    public void visit(forStmtNode it) {
        currentScope = new loopScope(currentScope);
        if (it.initialStmt != null)
            it.initialStmt.accept(this);
        ((loopScope)currentScope).loopLabel = new label("loop", labelNum++);
        ((loopScope)currentScope).skipLabel = new label("skip", labelNum++);
        brInstr b2 = new brInstr();
        b2.destLabel = ((loopScope)currentScope).loopLabel;
        currentBlock.instrs.add(b2);
        currentBlock.instrs.add(((loopScope)currentScope).loopLabel);
        if (it.conditionExpr != null)
            it.conditionExpr.accept(this);
        else lastExpr = new boolCons(true);
        brInstr br = new brInstr();
        br.cond = lastExpr;
        br.trueLabel = new label("body", labelNum++);
        br.falseLabel = ((loopScope)currentScope).skipLabel;
        currentBlock.instrs.add(br);
        currentBlock.instrs.add(br.trueLabel);
        if (it.bodyStmt != null)
            it.bodyStmt.accept(this);
        if (it.incrementExpr != null)
            it.incrementExpr.accept(this);
        brInstr b3 = new brInstr();
        b3.destLabel = ((loopScope)currentScope).loopLabel;
        currentBlock.instrs.add(b3);
        currentBlock.instrs.add(((loopScope)currentScope).skipLabel);
        currentScope = currentScope.parent;
    }

    @Override
    public void visit(whileStmtNode it) {
        currentScope = new loopScope(currentScope);
        ((loopScope)currentScope).loopLabel = new label("loop", labelNum++);
        ((loopScope)currentScope).skipLabel = new label("skip", labelNum++);
        brInstr b2 = new brInstr();
        b2.destLabel = ((loopScope)currentScope).loopLabel;
        currentBlock.instrs.add(b2);
        currentBlock.instrs.add(((loopScope)currentScope).loopLabel);
        it.condition.accept(this);
        brInstr b = new brInstr();
        b.cond = lastExpr;
        b.trueLabel = new label("body", labelNum++);
        b.falseLabel = ((loopScope)currentScope).skipLabel;
        currentBlock.instrs.add(b);
        currentBlock.instrs.add(b.trueLabel);
        it.body.accept(this);
        brInstr b3 = new brInstr();
        b3.destLabel = ((loopScope)currentScope).loopLabel;
        currentBlock.instrs.add(b3);
        currentBlock.instrs.add(b.falseLabel);
        currentScope = currentScope.parent;
    }

    @Override
    public void visit(returnStmtNode it) {
        retInstr r = new retInstr();
        if (it.expr == null) {
            r.type = null;
            r.value = null;
            currentBlock.instrs.add(r);
            return;
        }
        r.type = type2IR(it.expr.type);
        it.expr.accept(this);
        r.value = lastExpr;
        currentBlock.instrs.add(r);
    }

    @Override
    public void visit(breakStmtNode it) {
        brInstr b = new brInstr();
        b.destLabel = currentScope.getLoopSkip();
        currentBlock.instrs.add(b);
    }

    @Override
    public void visit(continueStmtNode it) {
        brInstr b = new brInstr();
        b.destLabel = currentScope.getLoopStart();
        currentBlock.instrs.add(b);
    }

    @Override
    public void visit(expressionStmtNode it) {
        it.expression.accept(this);
    }

    @Override
    public void visit(priorityExprNode it) {
        it.expr.accept(this);
    }

    @Override
    public void visit(constantExprNode it) {
        it.constant.accept(this);
    }

    @Override
    public void visit(variableExprNode it) {
        int d = currentScope.getVarDepth(it.name);
        if (d == 0) { // global
            if (isLeft) {
                lastExpr = new gloReg(it.name);
            }
            else {
                loadInstr load = new loadInstr();
                load.type = type2IR(gScope.getType(it.name, false));
                load.pointer = new gloReg(it.name);
                load.result = new resReg(store++);
                lastExpr = load.result;
                currentBlock.instrs.add(load);
            }
        }
        else if (d != -1) {
            if (isLeft) {
                lastExpr = new varReg(it.name, d);
            }
            else {
                loadInstr load = new loadInstr();
                load.type = type2IR(it.type);
                load.pointer = new varReg(it.name, d);
                load.result = new resReg(store++);
                lastExpr = load.result;
                currentBlock.instrs.add(load);
            }
        }
        else { // in class
            getInstr g = new getInstr();
            g.ptr = new thisReg();
            g.type = type2IR(it.type);
            g.idx.add(new intCons(gScope.getClass(currentScope.isInClass()).idx.get(it.name)));
            g.result = new resReg(store++);
            lastExpr = g.result;
            currentBlock.instrs.add(g);
            if (!isLeft) {
                loadInstr load = new loadInstr();
                load.type = type2IR(it.type);
                load.pointer = new thisReg();
                load.result = new resReg(store++);
                lastExpr = load.result;
                currentBlock.instrs.add(load);
            }
        }
    }

    @Override
    public void visit(thisExprNode it) {
        lastExpr = new thisReg();
    }

    @Override
    public void visit(funcCallExprNode it) {
        callInstr c = new callInstr();
        c.methodName = it.funcName;
        String cla = currentScope.isInClass();
        if (cla != null) {
            if (gScope.getClass(cla).functions.containsKey(it.funcName)) {
                c.className = cla;
                c.paramTypes.add(new ptrType());
                c.paramExpr.add(new varReg("this", -1));
            }
        }
        for (int i = 0 ; i < it.parameters.size(); i++) {
            c.paramTypes.add(type2IR(it.parameters.get(i).type));
            boolean flag = isLeft;
            isLeft = false;
            it.parameters.get(i).accept(this);
            isLeft = flag;
            c.paramExpr.add(lastExpr);
        }
        if (!((ReturnType)it.type).isVoid) {
            c.returnType = type2IR(it.type);
            c.result = new resReg(store++);
            lastExpr = c.result;
        }
        currentBlock.instrs.add(c);
    }

    @Override
    public void visit(classMemExprNode it) {
        getInstr g0 = new getInstr();
        getInstr g1 = new getInstr();
        boolean flag = isLeft;
        isLeft = false;
        it.className.accept(this);
        isLeft = flag;
        g0.ptr = lastExpr;
        g0.idx.add(new intCons(0));
        g0.type = new classType(it.className.type.typeName);
        g0.result = new resReg(store++);
        g1.ptr = g0.result;
        g1.idx.add(new intCons(gScope.classes.get(it.className.type.typeName).idx.get(it.memName)));
        g1.type = g0.type;
        g1.result = new resReg(store++);
        lastExpr = g1.result;
        currentBlock.instrs.add(g0);
        currentBlock.instrs.add(g1);
        if (!isLeft) {
            loadInstr load = new loadInstr();
            load.type = type2IR(it.type);
            load.pointer = g1.result;
            load.result = new resReg(store++);
            lastExpr = load.result;
            currentBlock.instrs.add(load);
        }
    }

    @Override
    public void visit(classFuncExprNode it) {
        callInstr c = new callInstr();
        c.className = it.className.type.typeName;
        c.methodName = it.funcName;
        if (it.className.type.dim > 0) {
            if (c.methodName.equals("size"))
                c.methodName = ".arr.size";
            else throw (new RuntimeException("Array Method not supported"));
            c.className = null; // in case class[]
        }
        else if (it.className.type.isString) {
            switch (c.methodName) {
                case "length" -> c.methodName = ".str.length";
                case "substring" -> c.methodName = ".str.substr";
                case "parseInt" -> c.methodName = ".str.parseInt";
                case "ord" -> c.methodName = ".str.ord";
                default -> throw(new RuntimeException("Invalid String method name: " + c.methodName));
            }
        }
        boolean flag = isLeft;
        isLeft = false;
        it.className.accept(this);
        isLeft = flag;
        c.paramTypes.add(new ptrType());
        c.paramExpr.add(lastExpr); // this
        for (int i = 0 ; i < it.parameters.size(); i++) {
            c.paramTypes.add(type2IR(it.parameters.get(i).type));
            boolean flag2 = isLeft;
            isLeft = false;
            it.parameters.get(i).accept(this);
            isLeft = flag2;
            c.paramExpr.add(lastExpr);
        }
        if (!((ReturnType)it.type).isVoid) {
            c.returnType = type2IR(it.type);
            c.result = new resReg(store++);
            lastExpr = c.result;
        }
        currentBlock.instrs.add(c);
    }

    @Override
    public void visit(arrayVisitExprNode it) {
        getInstr g = new getInstr();
        boolean flag = isLeft;
        isLeft = false;
        it.arrayName.accept(this);
        isLeft = flag;
        g.type = type2IR(it.type);
        g.ptr = lastExpr;
        boolean temp = isLeft;
        isLeft = false;
        it.index.accept(this);
        isLeft = temp;
        g.idx.add(lastExpr);
        g.result = new resReg(store++);
        lastExpr = g.result;
        currentBlock.instrs.add(g);
        if (!isLeft) {
            loadInstr load = new loadInstr();
            load.type = type2IR(it.type);
            load.pointer = g.result;
            load.result = new resReg(store++);
            lastExpr = load.result;
            currentBlock.instrs.add(load);
        }
    }

    @Override
    public void visit(newArrExprNode it) {
        if (it.arr != null) {
            boolean flag = isLeft;
            isLeft = false;
            it.arr.accept(this);
            isLeft = flag;
            return;
        }
        ArrayList<Expr> size_list = new ArrayList<>();
        for (ExprNode expr : it.expr) {
            boolean flag = isLeft;
            isLeft = false;
            expr.accept(this);
            isLeft = flag;
            size_list.add(lastExpr);
        }
        if (size_list.isEmpty()) {
            throw new RuntimeException("Useless NewArr");
//            allocaInstr a = new allocaInstr();
//            a.result = new resReg(store++);
//            a.type = new ptrType();
//            lastExpr = a.result;
//            currentBlock.instrs.add(a);
//            return;
        }
        Type t = new Type(it.type);
        Reg ptr = new resReg(store);
        Reg ret = new resReg(store++);
        for (int i = 0; i < size_list.size(); i++) {
            callInstr call = new callInstr();
            call.returnType = new ptrType();
            call.methodName = ".malloc_array";
            call.paramTypes.add(new IntType(32));
            t.dim--;
            call.paramExpr.add(new intCons(t.getSize()));
            call.paramTypes.add(new IntType(32));
            call.paramExpr.add(size_list.get(i));
            call.result = ptr;
            if (i > 0) {
                call.result = new resReg(store++);
                currentBlock.instrs.add(call);
                storeInstr st2 = new storeInstr();
                st2.type = new ptrType();
                st2.value = call.result;
                st2.ptr = ptr;
                currentBlock.instrs.add(st2);
            }
            else currentBlock.instrs.add(call);
            storeInstr st0 = new storeInstr();
            st0.type = new ptrType();
            st0.value = call.result;
            st0.ptr = ptr;
            if (i == size_list.size() - 1) {
                break;
            }
            currentScope = new loopScope(currentScope);
            allocaInstr a = new allocaInstr();
            a.type = new IntType(32);
            a.result = new resReg(store++);
            currentFunc.alloc.add(a); // int i
            storeInstr st = new storeInstr();
            st.type = new IntType(32);
            st.value = new intCons(0);
            st.ptr = a.result;
            currentBlock.instrs.add(st); // i = 0
            ((loopScope)currentScope).loopLabel = new label("loop", labelNum++);
            ((loopScope)currentScope).skipLabel = new label("skip", labelNum++);
            brInstr br1 = new brInstr();
            br1.destLabel = ((loopScope)currentScope).loopLabel;
            currentBlock.instrs.add(br1);
            currentBlock.instrs.add(((loopScope)currentScope).loopLabel);
            loadInstr load = new loadInstr();
            load.type = new IntType(32);
            load.pointer = a.result;
            load.result = new resReg(store++);
            currentBlock.instrs.add(load);
            icmpInstr icmp = new icmpInstr();
            icmp.type = new IntType(32);
            icmp.cond = icmpInstr.condType.slt;
            icmp.op1 = load.result;
            icmp.op2 = size_list.get(i);
            icmp.result = new resReg(store++);
            currentBlock.instrs.add(icmp); // i < size()
            brInstr br = new brInstr();
            br.cond = icmp.result;
            br.trueLabel = new label("body", labelNum++);
            br.falseLabel = ((loopScope)currentScope).skipLabel;
            currentBlock.instrs.add(br);
            currentBlock.instrs.add(br.trueLabel);
            getInstr get = new getInstr();
            get.type = new ptrType();
            get.ptr = ptr;
            get.idx.add(load.result);
            get.result = new resReg(store++);
            currentBlock.instrs.add(get);
            ptr = get.result; // ptr = array[i]
            binInstr bin = new binInstr();
            bin.type = new IntType(32);
            bin.op = binInstr.binaryOP.add;
            bin.operand1 = load.result;
            bin.operand2 = new intCons(1);
            bin.result = new resReg(store++);
            currentBlock.instrs.add(bin);
            storeInstr st1 = new storeInstr();
            st1.type = new IntType(32);
            st1.value = bin.result;
            st1.ptr = a.result;
            currentBlock.instrs.add(st1); // i++
        }
        for (int i = 0; i < size_list.size() - 1; i++) {
            brInstr br = new brInstr();
            br.destLabel = ((loopScope)currentScope).loopLabel;
            currentBlock.instrs.add(br);
            currentBlock.instrs.add(((loopScope)currentScope).skipLabel);
            currentScope = currentScope.parent;
        }
        lastExpr = ret;
    }

    @Override
    public void visit(newVarExprNode it) {
        ClassDecl c = gScope.getClass(it.type.typeName);
        if (c != null) {
            callInstr call = new callInstr();
            call.returnType = new ptrType();
            call.methodName = ".malloc";
            call.paramTypes.add(new IntType(32));
            call.paramExpr.add(new intCons(c.getSize() + 4));
            call.result = new resReg(store++);
            lastExpr = call.result;
            currentBlock.instrs.add(call);
            return;
        }
        callInstr call = new callInstr();
        call.returnType = new ptrType();
        call.methodName = ".malloc";
        call.paramTypes.add(new IntType(32));
        call.paramExpr.add(new intCons(it.type.getSize()));
        call.result = new resReg(store++);
        lastExpr = call.result;
        currentBlock.instrs.add(call);
    }

    @Override
    public void visit(nullExprNode it) {
        lastExpr = new ptrCons();
    }

    @Override
    public void visit(leftExprNode it) {
        binInstr b = new binInstr();
        b.type = type2IR(it.type);
        switch (it.opCode) {
            case add,sub -> {
                boolean flag = isLeft;
                isLeft = true;
                it.expr.accept(this);
                isLeft = flag; // pointer
                loadInstr load = new loadInstr();
                load.type = type2IR(it.expr.type);
                load.pointer = (Reg) lastExpr;
                load.result = new resReg(store++);
                currentBlock.instrs.add(load);
                if (it.opCode == leftExprNode.leftOpType.add)
                    b.op = binInstr.binaryOP.add;
                else b.op = binInstr.binaryOP.sub;
                b.operand1 = load.result;
                b.operand2 = new intCons(1);
                b.result = new resReg(store++);
                lastExpr = b.result;
                currentBlock.instrs.add(b);
                storeInstr st = new storeInstr();
                st.type = type2IR(it.type);
                st.value = b.result;
                st.ptr = load.pointer;
                currentBlock.instrs.add(st);
            }
            case negation -> {
                b.op = binInstr.binaryOP.xor;
                b.operand1 = new intCons(-1);
                boolean flag = isLeft;
                isLeft = false;
                it.expr.accept(this);
                isLeft = flag;
                b.operand2 = lastExpr;
                b.result = new resReg(store++);
                lastExpr = b.result;
                currentBlock.instrs.add(b);
            }
            case negative -> {
                b.op = binInstr.binaryOP.sub ;
                b.operand1 = new intCons(0);
                boolean flag = isLeft;
                isLeft = false;
                it.expr.accept(this);
                isLeft = flag;
                b.operand2 = lastExpr;
                b.result = new resReg(store++);
                lastExpr = b.result;
                currentBlock.instrs.add(b);
            }
        }
    }

    @Override
    public void visit(rightExprNode it) {
        loadInstr l = new loadInstr();
        boolean flag = isLeft;
        isLeft = true;
        it.expr.accept(this);
        isLeft = flag;
        l.type = type2IR(it.type);
        l.pointer = (Reg) lastExpr;
        l.result = new resReg(store++);
        lastExpr = l.result;
        currentBlock.instrs.add(l);
        binInstr b = new binInstr();
        b.type = type2IR(it.type);
        switch (it.opCode) {
            case add -> b.op = binInstr.binaryOP.add;
            case sub -> b.op = binInstr.binaryOP.sub;
        }
        b.operand1 = l.result;
        b.operand2 = new intCons(1);
        b.result = new resReg(store++);
        currentBlock.instrs.add(b);
        storeInstr st = new storeInstr();
        st.type = type2IR(it.type);
        st.value = b.result;
        st.ptr = l.pointer;
        currentBlock.instrs.add(st);
    }

    @Override
    public void visit(binaryExprNode it) {
        if (it.lhs.type.dim == 0 && it.lhs.type.isString) {
            if (it.opCode != binaryExprNode.binaryOpType.add)
                throw new RuntimeException("Wrong String op");
            callInstr call = new callInstr();
            call.returnType = new ptrType();
            call.methodName = ".str.add";
            call.paramTypes.add(new ptrType());
            call.paramTypes.add(new ptrType());
            boolean flag = isLeft;
            isLeft = false;
            it.lhs.accept(this);
            call.paramExpr.add(lastExpr);
            it.rhs.accept(this);
            call.paramExpr.add(lastExpr);
            isLeft = flag;
            call.result = new resReg(store++);
            lastExpr = call.result;
            currentBlock.instrs.add(call);
            return;
        }
        binInstr b = new binInstr();
        b.type = type2IR(it.type);
        switch (it.opCode) {
            case add -> b.op = binInstr.binaryOP.add;
            case sub -> b.op = binInstr.binaryOP.sub;
            case mul -> b.op = binInstr.binaryOP.mul;
            case div -> b.op = binInstr.binaryOP.sdiv;
            case mod -> b.op = binInstr.binaryOP.srem;
            case and -> b.op = binInstr.binaryOP.and;
            case or_ -> b.op = binInstr.binaryOP.or;
            case xor -> b.op = binInstr.binaryOP.xor;
            case leftShift -> b.op = binInstr.binaryOP.shl;
            case rightShift -> b.op = binInstr.binaryOP.ashr;
        }
        boolean flag = isLeft;
        isLeft = false;
        it.lhs.accept(this);
        b.operand1 = lastExpr;
        it.rhs.accept(this);
        b.operand2 = lastExpr;
        isLeft = flag;
        b.result = new resReg(store++);
        lastExpr = b.result;
        currentBlock.instrs.add(b);
    }

    @Override
    public void visit(boolExprNode it) {
        icmpInstr i = new icmpInstr();
        i.type = type2IR(it.lhs.type);
        switch (it.opCode) {
            case equal -> i.cond = icmpInstr.condType.eq;
            case notEqual -> i.cond = icmpInstr.condType.ne;
            case less -> i.cond = icmpInstr.condType.slt;
            case greater -> i.cond = icmpInstr.condType.sgt;
            case lessOrEqual -> i.cond = icmpInstr.condType.sle;
            case greaterOrEqual -> i.cond = icmpInstr.condType.sge;
        }
        boolean flag = isLeft;
        isLeft = false;
        it.lhs.accept(this);
        i.op1 = lastExpr;
        it.rhs.accept(this);
        i.op2 = lastExpr;
        isLeft = flag;
        i.result = new resReg(store++);
        lastExpr = i.result;
        currentBlock.instrs.add(i);
    }

    @Override
    public void visit(logicExprNode it) {
        boolean flag = isLeft;
        isLeft = false;
        allocaInstr al = new allocaInstr();
        al.type = type2IR(it.type);
        al.result = new resReg(store++);
        currentFunc.alloc.add(al);
        it.lhs.accept(this);
        storeInstr st = new storeInstr();
        st.type = type2IR(it.type);
        st.value = lastExpr;
        st.ptr = al.result;
        currentBlock.instrs.add(st);
        brInstr b1 = new brInstr();
        b1.cond = lastExpr;
        b1.trueLabel = new label("logicT", labelNum++);
        b1.falseLabel = new label("logicF", labelNum++);
        currentBlock.instrs.add(b1);
        brInstr b2 = new brInstr();
        switch (it.opCode) {
            case land -> {
                currentBlock.instrs.add(b1.trueLabel);
                b2.destLabel = b1.falseLabel;
            }
            case lor -> {
                currentBlock.instrs.add(b1.falseLabel);
                b2.destLabel = b1.trueLabel;
            }
        }
        it.rhs.accept(this);
        storeInstr st1 = new storeInstr();
        st1.type = type2IR(it.type);
        st1.value = lastExpr;
        st1.ptr = al.result;
        currentBlock.instrs.add(st1);
        currentBlock.instrs.add(b2);
        currentBlock.instrs.add(b2.destLabel);
        loadInstr load = new loadInstr();
        load.type = type2IR(it.type);
        load.pointer = al.result;
        load.result = new resReg(store++);
        currentBlock.instrs.add(load);
        lastExpr = load.result;
        isLeft = flag;
    }

    @Override
    public void visit(notExprNode it) {
        boolean flag = isLeft;
        isLeft = false;
        it.expr.accept(this);
        isLeft = flag;
        binInstr b = new binInstr();
        b.op = binInstr.binaryOP.xor;
        b.type = type2IR(it.expr.type);
        b.operand1 = lastExpr;
        b.operand2 = new boolCons(true);
        b.result = new resReg(store++);
        lastExpr = b.result;
        currentBlock.instrs.add(b);
    }

    @Override
    public void visit(ternaryExprNode it) {
        boolean flag = isLeft;
        isLeft = false;
        it.condition.accept(this);
        brInstr b = new brInstr();
        b.cond = lastExpr;
        b.trueLabel = new label("expr1", labelNum++);
        b.falseLabel = new label("expr2", labelNum++);

        currentBlock.instrs.add(b.trueLabel);
        it.case0.accept(this);
        brInstr skip = new brInstr();
        label skipLabel = new label("skip", labelNum++);
        skip.destLabel = skipLabel;
        currentBlock.instrs.add(skip);

        currentBlock.instrs.add(b.falseLabel);
        it.case1.accept(this);
        currentBlock.instrs.add(skipLabel);
        isLeft = flag;
    }

    @Override
    public void visit(assignExprNode it) {
        storeInstr instr = new storeInstr();
        instr.type = type2IR(it.rhs.type);
        boolean flag = isLeft;
        isLeft = true;
        it.lhs.accept(this);
        isLeft = false;
        instr.ptr = (Reg) lastExpr;
        it.rhs.accept(this);
        isLeft = flag;
        instr.value = lastExpr;
        currentBlock.instrs.add(instr);
    }

    @Override
    public void visit(formatStringNode it) {
        ArrayList<Reg> str_list = new ArrayList<>();
        ArrayList<String> raw = new ArrayList<>();
        raw.add(it.begin.substring(1));
        raw.addAll(it.midList);raw.add(it.end);
        for (String str : raw) {
            preStrInstr s = new preStrInstr();
            s.reg = new gloReg(".str.pre_" + strPreDef.instrs.size());
            s.str = replaceStr(str.substring(1, str.length() - 1));
            s.size = countStr(s.str);
            strPreDef.instrs.add(s);
            str_list.add(s.reg);
        }
        ArrayList<Reg> exprStr_list = new ArrayList<>();
        for (ExprNode expr : it.exprList) {
            boolean flag = isLeft;
            isLeft = false;
            expr.accept(this);
            isLeft = flag;
            if (expr.type.isInt) {
                callInstr call = new callInstr();
                call.returnType = new ptrType();
                call.methodName = "toString";
                call.paramTypes.add(new IntType(32));
                call.paramExpr.add(lastExpr);
                call.result = new resReg(store++);
                exprStr_list.add(call.result);
                currentBlock.instrs.add(call);
            }
            else if (expr.type.isBool) {
                selectInstr s = new selectInstr();
                s.cond = lastExpr;
                s.ty1 = new ptrType();
                s.ty2 = new ptrType();
                s.val1 = new gloReg(".strPre_true");
                s.val2 = new gloReg(".strPre_false");
                s.result = new resReg(store++);
                exprStr_list.add(s.result);
                currentBlock.instrs.add(s);
            }
            else if (expr.type.isString) {
                exprStr_list.add((Reg)lastExpr);
            }
        }
        Reg temp = str_list.get(0);
        for (int i = 1; i < str_list.size(); i++) {
            binInstr addStr = new binInstr();
            addStr.type = new ptrType();
            addStr.op = binInstr.binaryOP.add;
            addStr.operand1 = temp;
            addStr.operand2 = str_list.get(i);
            addStr.result = new resReg(store++);
            currentBlock.instrs.add(addStr);
            binInstr addExpr = new binInstr();
            addExpr.type = new ptrType();
            addExpr.op = binInstr.binaryOP.add;
            addExpr.operand1 = addStr.result;
            addExpr.operand2 = exprStr_list.get(i - 1);
            addExpr.result = new resReg(store++);
            temp = addExpr.result;
            currentBlock.instrs.add(addExpr);
        }
        lastExpr = temp;
    }

    @Override
    public void visit(arrConsNode it) {
        ArrayList<Expr> elems = new ArrayList<>();
        for (ConsNode c : it.content) {
            c.accept(this);
            elems.add(lastExpr);
        }

        callInstr call = new callInstr();
        call.returnType = new ptrType();
        call.methodName = ".malloc_array";
        call.paramTypes.add(new IntType(32));
        Type t = new Type(it.type); t.dim--; // content Type
        call.paramExpr.add(new intCons(t.getSize()));
        call.paramTypes.add(new IntType(32));
        call.paramExpr.add(new intCons(it.content.size()));
        call.result = new resReg(store++);
        currentBlock.instrs.add(call);

        for (int i = 0; i < it.content.size(); ++i) {
            getInstr g = new getInstr();
            g.type = type2IR(it.content.get(i).type);
            g.ptr = call.result;
            g.idx.add(new intCons(i));
            g.result = new resReg(store++);
            currentBlock.instrs.add(g); // get ptr
            storeInstr st = new storeInstr();
            st.type = type2IR(it.content.get(i).type);
            st.ptr = g.result;
            st.value = elems.get(i);
            currentBlock.instrs.add(st); // store content
        }
        lastExpr = call.result;
    }

    @Override
    public void visit(boolConsNode it) {
        lastExpr = new boolCons(it.value);
    }

    @Override
    public void visit(intConsNode it) {
        lastExpr = new intCons(it.value);
    }

    @Override
    public void visit(strConsNode it) {
        preStrInstr s = new preStrInstr();
        s.reg = new gloReg(".str.pre_" + strPreDef.instrs.size());
        s.str = replaceStr(it.value.substring(1, it.value.length() - 1));
        s.size = countStr(s.str);
        strPreDef.instrs.add(s);
        lastExpr = s.reg;
    }
}
