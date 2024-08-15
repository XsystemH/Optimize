package Frontend;

import AST.*;
import AST.Cons.arrConsNode;
import AST.Cons.boolConsNode;
import AST.Cons.intConsNode;
import AST.Cons.strConsNode;
import AST.Expr.*;
import AST.Stmt.*;
import util.Scope.Scope;
import util.Scope.globalScope;
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
        for (varDefStmtNode v : it.vars) {
            v.accept(this);
        }
        for (FuncNode f : it.functions) {
            f.accept(this);
        }
        it.constructor.accept(this);
        curClass = null;
    }

    @Override
    public void visit(FuncNode it) {
        curScope = new Scope(curScope);
        for (StmtNode s : it.body) {
            s.accept(this);
        }
    }

    @Override
    public void visit(MainNode it) {
        curScope = new Scope(curScope);
        for (StmtNode s : it.statements) {
            s.accept(this);
        }
    }

    @Override
    public void visit(blockStmtNode it) {
        curScope = new Scope(curScope);
        for (StmtNode s : it.statements) {
            s.accept(this);
        }
    }

    @Override
    public void visit(varDefStmtNode it) {
        if (curClass != null) {
            assert (curClass.members != null); // didn't initialized
            if (curClass.members.containsKey(it.name)) {
                throw new semanticError("redefinition of member " + it.name, it.pos);
            }
            curClass.members.put(it.name, gScope.getClassType(it.type.typeName)); // todo ?

        }
    }

    @Override
    public void visit(ifStmtNode it) {

    }

    @Override
    public void visit(forStmtNode it) {

    }

    @Override
    public void visit(whileStmtNode it) {

    }

    @Override
    public void visit(returnStmtNode it) {

    }

    @Override
    public void visit(breakStmtNode it) {

    }

    @Override
    public void visit(continueStmtNode it) {

    }

    @Override
    public void visit(expressionStmtNode it) {

    }

    @Override
    public void visit(priorityExprNode it) {

    }

    @Override
    public void visit(constantExprNode it) {

    }

    @Override
    public void visit(variableExprNode it) {

    }

    @Override
    public void visit(thisExprNode it) {

    }

    @Override
    public void visit(funcCallExprNode it) {

    }

    @Override
    public void visit(classMemExprNode it) {

    }

    @Override
    public void visit(classFuncExprNode it) {

    }

    @Override
    public void visit(arrayVisitExprNode it) {

    }

    @Override
    public void visit(newExprNode it) {

    }

    @Override
    public void visit(nullExprNode it) {

    }

    @Override
    public void visit(leftExprNode it) {

    }

    @Override
    public void visit(rightExprNode it) {

    }

    @Override
    public void visit(binaryExprNode it) {

    }

    @Override
    public void visit(boolExprNode it) {

    }

    @Override
    public void visit(logicExprNode it) {

    }

    @Override
    public void visit(notExprNode it) {

    }

    @Override
    public void visit(ternaryExprNode it) {

    }

    @Override
    public void visit(assignExprNode it) {

    }

    @Override
    public void visit(formatStringNode it) {

    }

    @Override
    public void visit(arrConsNode it) {

    }

    @Override
    public void visit(boolConsNode it) {

    }

    @Override
    public void visit(intConsNode it) {

    }

    @Override
    public void visit(strConsNode it) {

    }
}
