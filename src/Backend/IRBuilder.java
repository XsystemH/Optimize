package Backend;

import AST.*;
import AST.Cons.arrConsNode;
import AST.Cons.boolConsNode;
import AST.Cons.intConsNode;
import AST.Cons.strConsNode;
import AST.Expr.*;
import AST.Stmt.*;
import MIR.*;
import MIR.Expression.Constant.boolCons;
import MIR.Expression.Constant.intCons;
import MIR.Expression.Constant.ptrCons;
import MIR.Expression.Expr;
import MIR.Expression.Register.Reg;
import MIR.Expression.Register.resReg;
import MIR.Expression.Register.varReg;
import MIR.IRType.IRType;
import MIR.IRType.IntType;
import MIR.IRType.classType;
import MIR.Instruction.*;
import util.Scope.Scope;
import util.Scope.funcScope;
import util.Scope.globalScope;
import util.Scope.loopScope;
import util.Type.Type;

public class IRBuilder implements ASTVisitor{
    public block program;
    private block currentBlock;
    private Scope currentScope;
    private globalScope gScope;
    private int store;
    private int load;
    private int labelNum;
    private Expr lastExpr = null;

    public IRBuilder(globalScope gScope) {
        program = new block();
        currentBlock = program;
        currentScope = gScope;
        this.gScope = gScope;
        load = store = 0;
        labelNum = 0;
    }

    private IRType type2IR(Type t) {
        IRType ir;
        if (t.isInt) {
            ir = new IntType(32);
        }
        else if (t.isBool) {
            ir = new IntType(1);
        }
        else {
            ir = new classType(t.typeName);
        }
        // todo array & string
        return ir;
    }

    @Override
    public void visit(ProgramNode it) {
        for(ASTNode element : it.members) {
            element.accept(this);
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
            it.constructor.accept(this);
        }
        for (FuncNode f : it.functions) {
            f.accept(this);
        }
    }

    @Override
    public void visit(FuncNode it) {
        currentScope = new funcScope(currentScope);
        func temp = (func) currentBlock;
        temp.returnType = type2IR(it.returnType);
        temp.name = it.name;
        temp.params.addAll(it.paramName);
        for (int i = 0; i < it.paramType.size(); i++) {
            temp.paramTypes.add(type2IR(it.paramType.get(i)));
        }
        for (StmtNode s : it.body) {
            s.accept(this);
        }
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
        if (currentScope instanceof globalScope) {
            // todo init & @
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
                    instr2.value = new resReg(load++);
                    currentBlock.instrs.add(instr2);
                }
            }
        }
    }

    @Override
    public void visit(ifStmtNode it) {
        it.condition.accept(this);
        branch b = new branch();
        b.cond = new resReg(load++);
        block temp = currentBlock;
        currentBlock = new block();
        it.thenBlock.accept(this);
        temp.instrs.add(currentBlock);
        currentBlock = new block();
        it.elseBlock.accept(this);
        temp.instrs.add(currentBlock);
        currentBlock = temp;
        // todo scope
    }

    @Override
    public void visit(forStmtNode it) {
        currentScope = new loopScope(currentScope);
        it.initialStmt.accept(this);
        // todo label ret
        it.conditionExpr.accept(this);
        // todo br
        it.incrementExpr.accept(this);
        it.bodyStmt.accept(this);
        // todo label skip
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
        r.value = new resReg(load++);
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
        lastExpr = new varReg(it.name, currentScope.getVarDepth(it.name));
    }

    @Override
    public void visit(thisExprNode it) {

    }

    @Override
    public void visit(funcCallExprNode it) {

    }

    @Override
    public void visit(classMemExprNode it) {
        // todo
    }

    @Override
    public void visit(classFuncExprNode it) {
        // todo
    }

    @Override
    public void visit(arrayVisitExprNode it) {
        getInstr g = new getInstr();
        it.arrayName.accept(this);
        g.ptr = (Reg) lastExpr;
        it.index.accept(this);
        g.idx = lastExpr;
        g.result = new resReg(store++);
        currentBlock.instrs.add(g);
    }

    @Override
    public void visit(newArrExprNode it) {
        // todo
    }

    @Override
    public void visit(newVarExprNode it) {
        allocaInstr a = new allocaInstr();
        a.result = new resReg(store++);
        a.type = type2IR(it.type);
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
        currentBlock.instrs.add(b);
    }

    @Override
    public void visit(ternaryExprNode it) {
        it.condition.accept(this);
        brInstr b = new brInstr();
        b.cond = (Reg) lastExpr;
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
        it.lhs.accept(this);
        storeInstr instr = new storeInstr();
        instr.type = type2IR(it.lhs.type);
        instr.ptr = (Reg) lastExpr;
        it.rhs.accept(this);
        instr.value = new resReg(load++);
        currentBlock.instrs.add(instr);
    }

    @Override
    public void visit(formatStringNode it) {
        // todo
    }

    @Override
    public void visit(arrConsNode it) {
        // todo
    }

    @Override
    public void visit(boolConsNode it) {
        block b = new block();
        allocaInstr a = new allocaInstr();
        a.result = new resReg(store++);
        a.type = new IntType(1);
        b.instrs.add(a);
        storeInstr s = new storeInstr();
        s.type = new IntType(1);
        s.value = new boolCons(it.value);
        s.ptr = a.result;
        b.instrs.add(s);
    }

    @Override
    public void visit(intConsNode it) {
        block i = new block();
        allocaInstr a = new allocaInstr();
        a.result = new resReg(store++);
        a.type = new IntType(32);
        i.instrs.add(a);
        storeInstr s = new storeInstr();
        s.type = new IntType(32);
        s.value = new intCons(it.value);
        s.ptr = a.result;
        i.instrs.add(s);
    }

    @Override
    public void visit(strConsNode it) {
        // todo
    }
}
