package Frontend;

import AST.*;
import AST.Cons.*;
import AST.Expr.*;
import AST.Stmt.*;
import util.Decl.ClassDecl;
import util.Scope.*;
import util.Type.ReturnType;
import util.Type.Type;
import util.error.semanticError;

import java.util.ArrayList;

public class SemanticChecker implements ASTVisitor {
    private globalScope gScope;
    private Scope curScope;

    public SemanticChecker(globalScope gScope) {
        curScope = this.gScope = gScope;
    }

    @Override
    public void visit(ProgramNode it) {
        ArrayList<varDefStmtNode> noPre = new ArrayList<>();
        for (varDefStmtNode v : it.globalVars) {
            if (gScope.containsType(v.type))
                v.accept(this);
            else noPre.add(v);
        }
        for (ClassNode c : it.Classes) {
            c.accept(this);
        }
        for (FuncNode f : it.functions) {
            if (gScope.classes.containsKey(f.name))
                throw new semanticError("Duplicate name for function name and class name", f.pos);
            f.accept(this);
        }
        for (varDefStmtNode v : noPre) {
            v.accept(this);
        }
        it.mainFn.accept(this);
    }

    @Override
    public void visit(ClassNode it) {
        curScope = new classScope(curScope);
        curScope.className = it.name;
        for (varDefStmtNode v : it.vars) {
            v.accept(this);
        }
        for (FuncNode f : it.functions) {
            f.accept(this);
        }
        if (it.constructor != null)
            it.constructor.accept(this);
        curScope = curScope.parent;
    }

    @Override
    public void visit(FuncNode it) {
        curScope = new funcScope(curScope);
        curScope.returnType = it.returnType;
        for (int i = 0; i < it.paramName.size(); i++) {
            curScope.defineVariable(it.paramName.get(i), it.paramType.get(i), it.pos, false);
        }
        for (StmtNode s : it.body) {
            s.accept(this);
        }
        if (!curScope.hasReturn && !it.returnType.isVoid) {
            throw new semanticError("Need return.", it.pos);
        }
        curScope = curScope.parent;
    }

    @Override
    public void visit(MainNode it) {
        curScope = new funcScope(curScope);
        curScope.returnType = new ReturnType("int");
        for (StmtNode s : it.statements) {
            s.accept(this);
        }
        curScope = curScope.parent;
    }

    @Override
    public void visit(blockStmtNode it) {
        curScope = new Scope(curScope);
        for (StmtNode s : it.statements) {
            s.accept(this);
        }
        curScope = curScope.parent;
    }

    @Override
    public void visit(varDefStmtNode it) {
        if (!gScope.containsType(it.type)) {
            throw new semanticError("No such Type", it.pos);
        }

        if (curScope.scopeType == Scope.ScopeType.Class) {
            if (!it.expr.isEmpty()) {
                throw new semanticError("Initial in class", it.pos);
            }
        }

        for (ExprNode expr : it.expr) {
            expr.accept(this);
            if (!expr.type.isEqual(it.type)) {
                if (expr.type.isNull) {
                    if (it.type.dim == 0 && (it.type.isInt || it.type.isBool || it.type.isString))
                        throw new semanticError("Semantic Error: type not match.", it.pos);
                }
                else throw new semanticError("Semantic Error: type not match.", it.pos);
            }
        }
        for (String name : it.name) {
//            boolean flag = (curScope.isInFunction() || curScope.isInClass()!=null);
            curScope.defineVariable(name, it.type, it.pos, false);
        }
    }

    @Override
    public void visit(ifStmtNode it) {
        it.condition.accept(this);
        if (!it.condition.type.isEqual(new Type("bool"))) {
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
            if (!it.conditionExpr.type.isEqual(new Type("bool"))) {
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
        if (!it.condition.type.isEqual(new Type("bool"))) {
            throw new semanticError("Semantic Error: type not match.", it.pos);
        }
        curScope = new loopScope(curScope);
        it.body.accept(this);
        curScope = curScope.parent;
    }

    @Override
    public void visit(returnStmtNode it) {
        if (!curScope.isInFunction()) {
            throw new semanticError("Return outside Function.", it.pos);
        }
        if (it.expr != null) {
            it.expr.accept(this);
            if (!it.expr.type.isEqual(curScope.returnType)) {
                throw new semanticError("Semantic Error: type not match.", it.pos);
            }
        }
        curScope.getReturn();
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
        it.type = it.expr.type;
        it.isLeft = it.expr.isLeft;
    }

    @Override
    public void visit(constantExprNode it) {
        it.constant.accept(this);
        it.type = it.constant.type;
        it.isLeft = false;
    }

    @Override
    public void visit(variableExprNode it) {
        if (!curScope.containsVariable(it.name, true)) {
            throw new semanticError("Variable " + it.name + " not found.", it.pos);
        }
        it.type = curScope.getType(it.name, true);
        it.isLeft = true;
    }

    @Override
    public void visit(thisExprNode it) {
        if (curScope.isInClass() == null) {
            throw new semanticError("Semantic Error: not in a class.", it.pos);
        }
        it.type = gScope.getClassType(curScope.isInClass());
        it.isLeft = false;
    }

    @Override
    public void visit(funcCallExprNode it) {
        if (gScope.getFunction(it.funcName) == null) {
            throw new semanticError("Function " + it.funcName + " not found.", it.pos);
        }
        for (ExprNode expr : it.parameters) {
            expr.accept(this);
        }
        it.type = gScope.getFunction(it.funcName).retType;
        it.isLeft = false;
    }

    @Override
    public void visit(classMemExprNode it) {
        it.className.accept(this);
        String className = it.className.type.typeName;
        ClassDecl cla = gScope.getClass(className);
        if (cla == null) {
            if (it.className.type.isString)
                cla = gScope.getClass("string");
            else if (it.className.type.dim > 0)
                cla = gScope.getClass("array");
            else throw new semanticError("Class " + it.className + " not found.", it.pos);
        }
        if (cla.vars.get(it.memName) == null) {
            throw new semanticError("Class member" + it.className + " not found.", it.pos);
        }
        it.type = cla.vars.get(it.memName);
        it.isLeft = true;
    }

    @Override
    public void visit(classFuncExprNode it) {
        it.className.accept(this);
        for (ExprNode expr : it.parameters) {
            expr.accept(this);
        }
        ClassDecl cla = gScope.getClass(it.className.type.typeName);
        if (cla == null) {
            if (it.className.type.isString)
                cla = gScope.getClass("string");
            else if (it.className.type.dim > 0)
                cla = gScope.getClass("array");
            else throw new semanticError("Class " + it.className + " not found.", it.pos);
        }
        if (cla.functions.get(it.funcName) == null) {
            throw new semanticError("Function " + it.funcName + " not found.", it.pos);
        }
        it.type = cla.functions.get(it.funcName).retType;
        it.isLeft = false;
    }

    @Override
    public void visit(arrayVisitExprNode it) {
        it.index.accept(this);
        if (!it.index.type.isEqual(new Type("int"))) {
            throw new semanticError("Semantic Error: type not match.", it.pos);
        }
        it.arrayName.accept(this);
        it.type = new Type(it.arrayName.type);
        it.type.dim -= 1;
        if (it.type.dim < 0) {
            throw new semanticError("Semantic Error: dim out of range", it.pos);
        }
        it.isLeft = true;
    }

    @Override
    public void visit(newArrExprNode it) {
        for (ExprNode expr : it.expr) {
            expr.accept(this);
            if (!expr.type.isInt) {
                throw new semanticError("Semantic Error: type not match.", it.pos);
            }
        }
        if (it.arr != null) {
            it.arr.accept(this);
            if (!it.arr.type.isEqual(it.type)) {
                throw new semanticError("Semantic Error: type not match.", it.pos);
            }
        }
        it.isLeft = false;
    }

    @Override
    public void visit(newVarExprNode it) {
        it.isLeft = false;
    }

    @Override
    public void visit(nullExprNode it) {
        it.type = new Type("null");
        it.isLeft = false;
    }

    @Override
    public void visit(leftExprNode it) {
        it.expr.accept(this);
        if (!it.expr.type.isInt) {
            throw new semanticError("Semantic Error: type not match.", it.pos);
        }
        if ((it.opCode==leftExprNode.leftOpType.add||it.opCode==leftExprNode.leftOpType.sub)&&!it.expr.isLeft) {
            throw new semanticError("left value operation is invalid here", it.pos);
        }
        it.type = it.expr.type;
        it.isLeft = it.opCode==leftExprNode.leftOpType.add||it.opCode==leftExprNode.leftOpType.sub;
    }

    @Override
    public void visit(rightExprNode it) {
        it.expr.accept(this);
        if (!it.expr.type.isInt) throw new semanticError("Semantic Error: type not match.", it.pos);
        if (!it.expr.isLeft) {
            throw new semanticError("left value operation is invalid here", it.pos);
        }
        it.type = it.expr.type;
        it.isLeft = false;
    }

    @Override
    public void visit(binaryExprNode it) {
        it.lhs.accept(this);
        it.rhs.accept(this);
        if (it.lhs.type == null) {
            throw new semanticError("Semantic Error: type not match.", it.pos);
        }
        if (!it.lhs.type.isEqual(it.rhs.type)) {
            throw new semanticError("Semantic Error: type not match.", it.pos);
        }
        if (it.opCode == binaryExprNode.binaryOpType.add) {
            if (!it.lhs.type.isInt && !it.lhs.type.isString) {
                throw new semanticError("Semantic Error: type not match.", it.pos);
            }
        }
        else if (!it.lhs.type.isInt) {
            throw new semanticError("Semantic Error: type not match.", it.pos);
        }
        it.type = it.lhs.type;
        it.isLeft = false;
    }

    @Override
    public void visit(boolExprNode it) {
        it.lhs.accept(this);
        it.rhs.accept(this);
        if (!it.lhs.type.isEqual(it.rhs.type)) {
            if (it.lhs.type.dim == 0 || !it.rhs.type.isNull)
                throw new semanticError("Semantic Error: type not match.", it.pos);
        }
        if (it.opCode != boolExprNode.boolOpType.equal && it.opCode != boolExprNode.boolOpType.notEqual) {
            if (it.lhs.type.dim > 0 || it.lhs.type.isBool) {
                throw new semanticError("Semantic Error: type not match.", it.pos);
            }
        }
        it.type = new Type("bool");
        it.isLeft = false;
    }

    @Override
    public void visit(logicExprNode it) {
        it.lhs.accept(this);
        it.rhs.accept(this);
        if (!it.lhs.type.isEqual(it.rhs.type) || !it.lhs.type.isBool) {
            throw new semanticError("Semantic Error: type not match.", it.pos);
        }
        it.type = new Type("bool");
        it.isLeft = false;
    }

    @Override
    public void visit(notExprNode it) {
        it.expr.accept(this);
        if (!it.expr.type.isBool) {
            throw new semanticError("Semantic Error: type not match.", it.pos);
        }
        it.type = new Type("bool");
        it.isLeft = false;
    }

    @Override
    public void visit(ternaryExprNode it) {
        it.condition.accept(this);
        it.case0.accept(this);
        it.case1.accept(this);
        if (!it.condition.type.isBool) {
            throw new semanticError("Semantic Error: type not match.", it.pos);
        }
        if (!it.case0.type.isEqual(it.case1.type)) {
            throw new semanticError("Semantic Error: type not match.", it.pos);
        }
        it.type = it.case0.type;
        it.isLeft = false;
    }

    @Override
    public void visit(assignExprNode it) {
        it.lhs.accept(this);
        it.rhs.accept(this);
        if (it.lhs.type == null) {
            throw new semanticError("Semantic Error: type not match(null).", it.pos);
        }
        if (!it.lhs.type.isEqual(it.rhs.type)) {
            if (it.rhs.type.isNull) {
                if (it.lhs.type.dim == 0 && (it.lhs.type.isInt || it.lhs.type.isBool || it.lhs.type.isString))
                    throw new semanticError("Semantic Error: type not match.", it.pos);
            }
            else throw new semanticError("Semantic Error: type not match.", it.pos);
        }
        if (!it.lhs.isLeft) {
            throw new semanticError("Is not assignable.", it.pos);
        }
        it.type = new Type("null");
        it.isLeft = false;
    }

    @Override
    public void visit(formatStringNode it) {
        for (ExprNode expr : it.exprList) {
            expr.accept(this);
            if (!expr.type.isBool && !expr.type.isInt && !expr.type.isString) {
                throw new semanticError("Semantic Error: type not match.", it.pos);
            }
        }
        it.type = new Type("string");
    }

    @Override
    public void visit(arrConsNode it) {
        Type contentType = null;
        for (ConsNode cons : it.content) {
            cons.accept(this);
            if (contentType == null) {
                contentType = cons.type;
            }
            if (!cons.type.isEqual(contentType)) {
                throw new semanticError("Semantic Error: type not match.", it.pos);
            }
        }
        it.type = contentType;
        it.type.dim += 1;
    }

    @Override
    public void visit(boolConsNode it) {
        it.type = new Type("bool");
    }

    @Override
    public void visit(intConsNode it) {
        it.type = new Type("int");
    }

    @Override
    public void visit(strConsNode it) {
        it.type = new Type("string");
    }
}
