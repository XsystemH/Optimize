package Frontend;

import AST.*;
import AST.Cons.*;
import AST.Expr.*;
import AST.Stmt.*;
import util.Scope.*;
import util.Type.Type;
import util.error.semanticError;

public class SemanticChecker implements ASTVisitor {
    private globalScope gScope;
    private Scope curScope;
    private Type curClass;

    public SemanticChecker(globalScope gScope) {
        curScope = this.gScope = gScope;
    }

    @Override
    public void visit(ProgramNode it) {
        for (ClassNode c : it.Classes) {
            c.accept(this);
        }
        for (FuncNode f : it.functions) {
            f.accept(this);
        }
        it.mainFn.accept(this);
    }

    @Override
    public void visit(ClassNode it) {
        curClass = gScope.getClassType(it.name);
        curScope = new classScope(curScope);
        for (varDefStmtNode v : it.vars) {
            v.accept(this);
        }
        for (FuncNode f : it.functions) {
            f.accept(this);
        }
        it.constructor.accept(this);
        curClass = null;
        curScope = curScope.parent;
    }

    @Override
    public void visit(FuncNode it) {
        curScope = new funcScope(curScope);
        for (StmtNode s : it.body) {
            s.accept(this);
        }
        curScope = curScope.parent;
    }

    @Override
    public void visit(MainNode it) {
        curScope = new Scope(curScope);
        for (StmtNode s : it.statements) {
            s.accept(this);
        }
        curScope = curScope.parent;
    }

    @Override
    public void visit(blockStmtNode it) {
        switch (curScope.scopeType) {
            case Basic, Global -> curScope = new Scope(curScope);
            case Class -> curScope = new classScope(curScope);
            case Func -> curScope = new funcScope(curScope);
            case Loop -> curScope = new loopScope(curScope);
        }
        for (StmtNode s : it.statements) {
            s.accept(this);
        }
        curScope = curScope.parent;
    }

    @Override
    public void visit(varDefStmtNode it) {
        if (curClass != null) {
            assert (curClass.members != null); // didn't initialized
            for (int i = 0; i < it.name.size(); i++) {
                if (curClass.members.containsKey(it.name.get(i))) {
                    throw new semanticError("redefinition of member " + it.name, it.pos);
                }
                curClass.members.put(it.name.get(i), gScope.getClassType(it.type.typeName));
                if (!it.expr.isEmpty()) {
                    throw new semanticError("can't initialize variable in class", it.pos);
                }
            }
        }

        for (int i = 0; i < it.name.size(); i++) {
            if (it.expr.get(i) != null) {
                it.expr.get(i).accept(this);
                if (!it.expr.get(i).type.equals(it.type)) {
                    throw new semanticError("Semantic Error: type not match.", it.pos);
                }
            }
            curScope.defineVariable(it.name.get(i), gScope.getType(it.type.typeName, true), it.pos, true);
        }
    }

    @Override
    public void visit(ifStmtNode it) {
        it.condition.accept(this);
        if (!it.condition.type.equals(new Type("bool"))) {
            throw new semanticError("Semantic Error: type not match.", it.pos);
        }
        it.thenBlock.accept(this);
        if (it.elseBlock != null) {
            it.elseBlock.accept(this);
        }
    }

    @Override
    public void visit(forStmtNode it) {
        if (it.initialStmt != null) {
            it.initialStmt.accept(this);
        }
        if (it.conditionExpr != null) {
            it.conditionExpr.accept(this);
            if (!it.conditionExpr.type.equals(new Type("bool"))) {
                throw new semanticError("Semantic Error: type not match.", it.pos);
            }
        }
        if (it.incrementExpr != null) {
            it.incrementExpr.accept(this);
        }
        curScope = new loopScope(curScope);
        it.bodyStmt.accept(this);
        curScope = curScope.parent;
    }

    @Override
    public void visit(whileStmtNode it) {
        it.condition.accept(this);
        if (!it.condition.type.equals(new Type("bool"))) {
            throw new semanticError("Semantic Error: type not match.", it.pos);
        }
        curScope = new loopScope(curScope);
        it.body.accept(this);
        curScope = curScope.parent;
    }

    @Override
    public void visit(returnStmtNode it) {
        if (curScope.scopeType != Scope.ScopeType.Func) {
            throw new semanticError("Return outside Function.", it.pos);
        }
        if (it.expr != null) {
            it.expr.accept(this);
            if (!it.expr.type.equals(curScope.returnType)) {
                throw new semanticError("Semantic Error: type not match.", it.pos);
            }
        }
    }

    @Override
    public void visit(breakStmtNode it) {
        if (curScope.scopeType != Scope.ScopeType.Loop) {
            throw new semanticError("Break outside Loop.", it.pos);
        }
    }

    @Override
    public void visit(continueStmtNode it) {
        if (curScope.scopeType != Scope.ScopeType.Loop) {
            throw new semanticError("Continue outside Loop.", it.pos);
        }
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
        if (!curScope.containsVariable(it.name, true)) {
            throw new semanticError("Variable " + it.name + " not found.", it.pos);
        }
    }

    @Override
    public void visit(thisExprNode it) {
        // todo 递归确定是否处于某Scope
//        if (curScope.scopeType != Scope.ScopeType.Class) {}
    }

    @Override
    public void visit(funcCallExprNode it) {
        // todo get function list
//        if (curScope.getFunction())
    }

    @Override
    public void visit(classMemExprNode it) {
        // todo get class
    }

    @Override
    public void visit(classFuncExprNode it) {

    }

    @Override
    public void visit(arrayVisitExprNode it) {
        for (ExprNode expr : it.indexes) {
            expr.accept(this);
        }
    }

    @Override
    public void visit(newExprNode it) {
//        todo containsType
//        if (curScope.containsType())
    }

    @Override
    public void visit(nullExprNode it) {}

    @Override
    public void visit(leftExprNode it) {
        it.expr.accept(this);
        if (it.opCode == leftExprNode.leftOpType.not) {
            if (!it.expr.type.isBool) throw new semanticError("Semantic Error: type not match.", it.pos);
        }
        else if (it.expr.type.isBool) {
            throw new semanticError("Semantic Error: type not match.", it.pos);
        }
    }

    @Override
    public void visit(rightExprNode it) {
        it.expr.accept(this);
        if (!it.type.isInt) throw new semanticError("Semantic Error: type not match.", it.pos);
    }

    @Override
    public void visit(binaryExprNode it) {
        it.lhs.accept(this);
        it.rhs.accept(this);
        if (!it.lhs.type.equals(it.rhs.type)) {
            throw new semanticError("Semantic Error: type not match.", it.pos);
        }
        if (it.opCode == binaryExprNode.binaryOpType.add) {
            if (!it.lhs.type.isInt && !it.lhs.type.isString) {
                throw new semanticError("Semantic Error: type not match.", it.pos);
            }
        }
        else if (!it.type.isInt) {
            throw new semanticError("Semantic Error: type not match.", it.pos);
        }
    }

    @Override
    public void visit(boolExprNode it) {
        it.lhs.accept(this);
        it.rhs.accept(this);
        if (!it.lhs.type.equals(it.rhs.type)) {
            throw new semanticError("Semantic Error: type not match.", it.pos);
        }
        if (it.opCode != boolExprNode.boolOpType.equal && it.opCode != boolExprNode.boolOpType.notEqual) {
            if (!it.lhs.type.isInt) throw new semanticError("Semantic Error: type not match.", it.pos);
        }
    }

    @Override
    public void visit(logicExprNode it) {
        it.lhs.accept(this);
        it.rhs.accept(this);
        if (!it.lhs.type.equals(it.rhs.type) || !it.type.isBool) {
            throw new semanticError("Semantic Error: type not match.", it.pos);
        }
    }

    @Override
    public void visit(notExprNode it) {
        it.expr.accept(this);
        if (!it.expr.type.isBool) {
            throw new semanticError("Semantic Error: type not match.", it.pos);
        }
    }

    @Override
    public void visit(ternaryExprNode it) {
        it.condition.accept(this);
        it.case0.accept(this);
        it.case1.accept(this);
        if (!it.condition.type.isBool) {
            throw new semanticError("Semantic Error: type not match.", it.pos);
        }
        if (!it.case0.type.equals(it.case1.type)) {
            throw new semanticError("Semantic Error: type not match.", it.pos);
        }
    }

    @Override
    public void visit(assignExprNode it) {
        it.lhs.accept(this);
        it.rhs.accept(this);
        if (!it.lhs.type.equals(it.rhs.type)) {
            throw new semanticError("Semantic Error: type not match.", it.pos);
        }
    }

    @Override
    public void visit(formatStringNode it) {
        for (ExprNode expr : it.exprList) {
            expr.accept(this);
            if (!expr.type.isBool && !expr.type.isInt && !expr.type.isString) {
                throw new semanticError("Semantic Error: type not match.", it.pos);
            }
        }
    }

    @Override
    public void visit(arrConsNode it) {
        Type contentType = null;
        for (ConsNode cons : it.content) {
            cons.accept(this);
            if (contentType == null) {
                contentType = cons.type;
            }
            if (!cons.type.equals(contentType)) {
                throw new semanticError("Semantic Error: type not match.", it.pos);
            }
        }
    }

    @Override
    public void visit(boolConsNode it) {}

    @Override
    public void visit(intConsNode it) {}

    @Override
    public void visit(strConsNode it) {}
}
