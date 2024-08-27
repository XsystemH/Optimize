package Backend;

import AST.*;
import AST.Cons.*;
import AST.Expr.*;
import AST.Stmt.*;
import MIR.*;
import MIR.Expression.Constant.boolCons;
import MIR.Expression.Constant.intCons;
import MIR.Expression.Constant.ptrCons;
import MIR.Expression.Expr;
import MIR.Expression.Register.*;
import MIR.IRType.IRType;
import MIR.IRType.IntType;
import MIR.IRType.classType;
import MIR.IRType.ptrType;
import MIR.Instruction.*;
import util.Decl.ClassDecl;
import util.Scope.*;
import util.Type.ReturnType;
import util.Type.Type;

import java.util.ArrayList;

import static java.lang.Math.ceil;

public class IRBuilder implements ASTVisitor{
    public block program;
    public block strPreDef;
    private block currentBlock;
    private Scope currentScope;
    private globalScope gScope;
    private int store;
    private int labelNum;
    private Expr lastExpr = null;

    public IRBuilder(globalScope gScope) {
        program = new block();
        strPreDef = new block();
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
            ir = new classType(t.typeName);
        }
        return ir;
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
        temp.returnType = type2IR(it.returnType);
        temp.className = currentScope.isInClass();
        temp.name = it.name;
        if (temp.className != null) {
            temp.params.add("this");
            temp.paramTypes.add(new ptrType());
        }
        temp.params.addAll(it.paramName);
        for (int i = 0; i < it.paramType.size(); i++) {
            temp.paramTypes.add(type2IR(it.paramType.get(i)));
            currentScope.defineVariable(temp.params.get(i), it.paramType.get(i));
        }
        block tempBlock = currentBlock;
        currentBlock = temp;
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
                allocaInstr instr = new allocaInstr();
                instr.type = type2IR(it.type);
                instr.result = new gloReg(it.name.get(i));
                currentBlock.instrs.add(instr);

                currentScope.defineVariable(it.name.get(i), it.type);

                if (it.expr != null) {
                    // todo init_
                }
            }
        }
        else {
            for (int i = 0; i < it.name.size(); i++) {
                allocaInstr instr = new allocaInstr();
                instr.type = type2IR(it.type);
                instr.result = new varReg(it.name.get(i), currentScope.depth);
                currentBlock.instrs.add(instr);

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
        branch b = new branch();
        it.condition.accept(this);
        b.cond = lastExpr;
        block temp = currentBlock;
        currentBlock = b.trueBranch;
        currentScope = new Scope(currentScope);
        it.thenBlock.accept(this);
        currentScope = currentScope.parent;
        currentBlock = b.falseBranch;
        currentScope = new Scope(currentScope);
        it.elseBlock.accept(this);
        currentScope = currentScope.parent;
        temp.instrs.add(b);
        currentBlock = temp;
    }

    @Override
    public void visit(forStmtNode it) {
        currentScope = new loopScope(currentScope);
        it.initialStmt.accept(this);
        ((loopScope)currentScope).loopLabel = new label(labelNum++);
        ((loopScope)currentScope).skipLabel = new label(labelNum++);
        currentBlock.instrs.add(((loopScope)currentScope).loopLabel);
        it.conditionExpr.accept(this);
        brInstr br = new brInstr();
        br.cond = lastExpr;
        br.trueLabel = new label(labelNum++);
        br.falseLabel = ((loopScope)currentScope).skipLabel;
        currentBlock.instrs.add(br);
        currentBlock.instrs.add(br.trueLabel);
        it.incrementExpr.accept(this);
        it.bodyStmt.accept(this);
        currentBlock.instrs.add(((loopScope)currentScope).skipLabel);
        currentScope = currentScope.parent;
    }

    @Override
    public void visit(whileStmtNode it) {
        currentScope = new loopScope(currentScope);
        ((loopScope)currentScope).loopLabel = new label(labelNum++);
        ((loopScope)currentScope).skipLabel = new label(labelNum++);
        currentBlock.instrs.add(((loopScope)currentScope).loopLabel);
        it.condition.accept(this);
        brInstr b = new brInstr();
        b.cond = lastExpr;
        b.trueLabel = new label(labelNum++);
        b.falseLabel = ((loopScope)currentScope).skipLabel;
        currentBlock.instrs.add(b);
        currentBlock.instrs.add(b.trueLabel);
        it.body.accept(this);
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
        if (d != -1) {
            lastExpr = new varReg(it.name, d);
        }
        else {
            getInstr g = new getInstr();
            g.ptr = new thisReg();
            g.type = type2IR(it.type);
            g.idx = new intCons(gScope.getClass(currentScope.isInClass()).idx.get(it.name));
            g.result = new resReg(store++);
            lastExpr = g.result;
            currentBlock.instrs.add(g);
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
        for (int i = 0 ; i < it.parameters.size(); i++) {
            c.paramTypes.add(type2IR(it.parameters.get(i).type));
            it.parameters.get(i).accept(this);
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
        getInstr g = new getInstr();
        it.className.accept(this);
        g.ptr = lastExpr;
        g.idx = new intCons(gScope.classes.get(it.className.type.typeName).idx.get(it.memName));
        g.type = type2IR(gScope.classes.get(it.className.type.typeName).vars.get(it.memName));
        g.result = new resReg(store++);
        lastExpr = g.result;
        currentBlock.instrs.add(g);
    }

    @Override
    public void visit(classFuncExprNode it) {
        callInstr c = new callInstr();
        c.className = it.className.type.typeName;
        c.methodName = it.funcName;
        it.className.accept(this);
        c.paramTypes.add(new ptrType());
        c.paramExpr.add(lastExpr); // this
        for (int i = 0 ; i < it.parameters.size(); i++) {
            c.paramTypes.add(type2IR(it.parameters.get(i).type));
            it.parameters.get(i).accept(this);
            c.paramExpr.add(lastExpr);
        }
        if (!((ReturnType)it.type).isVoid) {
            c.returnType = type2IR(it.type);
        }
        currentBlock.instrs.add(c);
    }

    @Override
    public void visit(arrayVisitExprNode it) {
        getInstr g = new getInstr();
        it.arrayName.accept(this);
        g.ptr = (Reg) lastExpr;
        it.index.accept(this);
        g.idx = lastExpr;
        g.result = new resReg(store++);
        lastExpr = g.result;
        currentBlock.instrs.add(g);
    }

    @Override
    public void visit(newArrExprNode it) {
        // todo
    }

    @Override
    public void visit(newVarExprNode it) {
        allocaInstr a = new allocaInstr();
        a.type = type2IR(it.type);
        a.result = new resReg(store++);
        lastExpr = a.result;
        currentBlock.instrs.add(a);
    }

    @Override
    public void visit(nullExprNode it) {
        ptrCons n = new ptrCons();
    }

    @Override
    public void visit(leftExprNode it) {
        binInstr b = new binInstr();
        b.type = type2IR(it.type);
        switch (it.opCode) {
            case add -> {
                b.op = binInstr.binaryOP.add;
                b.operand1 = new intCons(1);
                it.expr.accept(this);
                b.operand2 = lastExpr;
            }
            case sub -> {
                b.op = binInstr.binaryOP.sub;
                it.expr.accept(this);
                b.operand1 = lastExpr;
                b.operand2 = new intCons(1);
            }
            case negation -> {
                b.op = binInstr.binaryOP.xor;
                b.operand1 = new intCons(-1);
                it.expr.accept(this);
                b.operand2 = lastExpr;
            }
            case negative -> {
                b.op = binInstr.binaryOP.sub ;
                b.operand1 = new intCons(0);
                it.expr.accept(this);
                b.operand2 = lastExpr;
            }
        }
        b.result = new resReg(store++);
        lastExpr = b.result;
        currentBlock.instrs.add(b);
    }

    @Override
    public void visit(rightExprNode it) {
        binInstr b = new binInstr();
        b.type = type2IR(it.type);
        switch (it.opCode) {
            case add -> b.op = binInstr.binaryOP.add;
            case sub -> b.op = binInstr.binaryOP.sub;
        }
        it.expr.accept(this);
        b.operand1 = lastExpr;
        b.operand2 = new intCons(1);
        b.result = new resReg(store++);
        lastExpr = b.result;
        currentBlock.instrs.add(b);
    }

    @Override
    public void visit(binaryExprNode it) {
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
        it.lhs.accept(this);
        b.operand1 = lastExpr;
        it.rhs.accept(this);
        b.operand2 = lastExpr;
        b.result = new resReg(store++);
        lastExpr = b.result;
        currentBlock.instrs.add(b);
    }

    @Override
    public void visit(boolExprNode it) {
        icmpInstr i = new icmpInstr();
        i.type = type2IR(it.type);
        switch (it.opCode) {
            case equal -> i.cond = icmpInstr.condType.eq;
            case notEqual -> i.cond = icmpInstr.condType.ne;
            case less -> i.cond = icmpInstr.condType.slt;
            case greater -> i.cond = icmpInstr.condType.sgt;
            case lessOrEqual -> i.cond = icmpInstr.condType.sle;
            case greaterOrEqual -> i.cond = icmpInstr.condType.sge;
        }
        it.lhs.accept(this);
        i.op1 = lastExpr;
        it.rhs.accept(this);
        i.op2 = lastExpr;
        i.result = new resReg(store++);
        lastExpr = i.result;
        currentBlock.instrs.add(i);
    }

    @Override
    public void visit(logicExprNode it) {
        binInstr b = new binInstr();
        if (it.opCode == logicExprNode.logicOpType.land) {
            b.op = binInstr.binaryOP.and;
        }
        else {
            b.op = binInstr.binaryOP.or;
        }
        b.type = type2IR(it.type);
        it.lhs.accept(this);
        b.operand1 = lastExpr;
        it.rhs.accept(this);
        b.operand2 = lastExpr;
        b.result = new resReg(store++);
        lastExpr = b.result;
        currentBlock.instrs.add(b);
    }

    @Override
    public void visit(notExprNode it) {
        it.expr.accept(this);
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
        it.condition.accept(this);
        brInstr b = new brInstr();
        b.cond = lastExpr;
        b.trueLabel = new label(labelNum++);
        b.falseLabel = new label(labelNum++);

        currentBlock.instrs.add(b.trueLabel);
        it.case0.accept(this);
        brInstr skip = new brInstr();
        label skipLabel = new label(labelNum++);
        skip.destLabel = skipLabel;
        currentBlock.instrs.add(skip);

        currentBlock.instrs.add(b.falseLabel);
        it.case1.accept(this);
        currentBlock.instrs.add(skipLabel);
    }

    @Override
    public void visit(assignExprNode it) {
        storeInstr instr = new storeInstr();
        instr.type = type2IR(it.lhs.type);
        it.lhs.accept(this);
        instr.ptr = (Reg) lastExpr;
        it.rhs.accept(this);
        instr.value = lastExpr;
        currentBlock.instrs.add(instr);
    }

    @Override
    public void visit(formatStringNode it) {
        // todo
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
        call.methodName = "_malloc_array";
        call.paramTypes.add(new IntType(32));
        call.paramExpr.add(new intCons(it.type.getSize()));
        call.paramTypes.add(new IntType(32));
        call.paramExpr.add(new intCons(it.content.size()));
        call.result = new resReg(store++);
        currentBlock.instrs.add(call);

        for (int i = 0; i < it.content.size(); ++i) {
            getInstr g = new getInstr();
            g.type = type2IR(it.content.get(i).type);
            g.ptr = call.result;
            g.idx = new intCons(i);
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
        s.str = it.value.substring(1, it.value.length() - 1);
        strPreDef.instrs.add(s);
        storeInstr st = new storeInstr();

        st.type = new ptrType();
        st.value = s.reg;
        st.ptr = new resReg(store++);
        lastExpr = st.ptr;
        currentBlock.instrs.add(st);
    }
}
