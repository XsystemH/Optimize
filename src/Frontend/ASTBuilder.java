package Frontend;

import AST.*;
import AST.Expr.ExprNode;
import AST.Stmt.*;
import Parser.MxBaseVisitor;
import Parser.MxParser;
import org.antlr.v4.runtime.tree.ParseTree;
import util.Type.ReturnType;
import util.Type.Type;
import util.globalScope;
import util.position;
import util.error.*;

import java.util.ArrayList;

public class ASTBuilder extends MxBaseVisitor<ASTNode> {
    private globalScope gScope;
    public ASTBuilder(globalScope gScope) {
        this.gScope = gScope;
    }

    @Override
    public ASTNode visitProgram(MxParser.ProgramContext ctx) {
        ProgramNode p = new ProgramNode(new position(ctx));
        for (MxParser.ClassDefContext cla : ctx.classDef()) {
            p.Classes.add((ClassNode) visit(cla));
        }
        for (MxParser.FuncDefContext func : ctx.funcDef()) {
            p.functions.add((FuncNode) visit(func));
        }
        for (MxParser.VarDefContext var : ctx.varDef()) {
            p.globalVars.add((GlobalVarNode) visit(var));
        }
        p.mainFn = (FuncNode) visit(ctx.mainFn());
        return p;
    }

    @Override
    public ASTNode visitMainFn(MxParser.MainFnContext ctx) {
        MainNode main = new MainNode(new position(ctx));
        // ignore suite
        for (MxParser.StatementContext stmt : ctx.suite().statement()) {
            main.statements.add((StmtNode) visit(stmt));
        }
        return main;
    }

    @Override
    public ASTNode visitClassDef(MxParser.ClassDefContext ctx) {
        ClassNode c = new ClassNode(new position(ctx));
        for (MxParser.VarDefContext var : ctx.classsuite().varDef()) {
            c.vars.add((varDefStmtNode) visit(var));
        }
        for (MxParser.FuncDefContext func : ctx.classsuite().funcDef()) {
            c.functions.add((FuncNode) visit(func));
        }
        if (ctx.classsuite().constructor().size() > 1) {
            throw new syntaxError("More than one Constructor", new position(ctx));
        } else if (ctx.classsuite().constructor().size() == 1) {
            c.constructor = (blockStmtNode) visit(ctx.classsuite().constructor(0).suite());
        }
        return c;
    }

    @Override
    public ASTNode visitFuncDef(MxParser.FuncDefContext ctx) {
        FuncNode f = new FuncNode(new position(ctx));
        f.returnType = new ReturnType(ctx.returnType());
        for(MxParser.ParamContext param : ctx.param()) {
            f.paramType.add(new Type(param.type()));
            f.paramName.add(param.name.toString());
        }
        for(MxParser.StatementContext stmt : ctx.suite().statement()) {
            f.body.add((StmtNode) visit(stmt));
        }
        return f;
    }

    @Override
    public ASTNode visitSuite(MxParser.SuiteContext ctx) {
        blockStmtNode b = new blockStmtNode(new position(ctx));
        for (MxParser.StatementContext stmt : ctx.statement()) {
            b.statements.add((StmtNode) visit(stmt));
        }
        return b;
    }

    @Override
    public ASTNode visitVarDef(MxParser.VarDefContext ctx) {
        varDefStmtNode v = new varDefStmtNode(new position(ctx));
        v.type = new Type(ctx.type());
        v.name = ctx.name.getText();
        v.expr = (ExprNode) visit(ctx.expression());
        return v;
    }

    @Override
    public ASTNode visitBlockStatement(MxParser.BlockStatementContext ctx) {
        blockStmtNode b = new blockStmtNode(new position(ctx));
        for (MxParser.StatementContext stmt : ctx.suite().statement()) {
            b.statements.add((StmtNode) visit(stmt));
        }
        return b;
    }

    @Override
    public ASTNode visitVardefStatement(MxParser.VardefStatementContext ctx) {
        varDefStmtNode v = new varDefStmtNode(new position(ctx));
        v.type = new Type(ctx.type());
        v.name = ctx.name.getText();
        v.expr = (ExprNode) visit(ctx.expression());
        return v;
    }

    @Override
    public ASTNode visitIfStatement(MxParser.IfStatementContext ctx) {
        ifStmtNode i = new ifStmtNode(new position(ctx));
        i.condition = (ExprNode) visit(ctx.expression());
        i.thenBlock = (StmtNode) visit(ctx.trueStmt);
        i.elseBlock = (StmtNode) visit(ctx.falseStmt);
        return i;
    }

    @Override
    public ASTNode visitForStatement(MxParser.ForStatementContext ctx) {
        forStmtNode f = new forStmtNode(new position(ctx));
        f.initialStmt = (StmtNode) visit(ctx.initialStmt);
        f.conditionExpr = (ExprNode) visit(ctx.conditionExpr);
        f.incrementExpr = (ExprNode) visit(ctx.stepExpr);
        f.bodyStmt = (StmtNode) visit(ctx.statement(1));
        return f;
    }

    @Override
    public ASTNode visitWhileStatement(MxParser.WhileStatementContext ctx) {
        whileStmtNode w = new whileStmtNode(new position(ctx));
        w.condition = (ExprNode) visit(ctx.expression());
        w.body = (StmtNode) visit(ctx.statement());
        return w;
    }

    @Override
    public ASTNode visitReturnStatement(MxParser.ReturnStatementContext ctx) {
        returnStmtNode r = new returnStmtNode(new position(ctx));
        r.expr = (ExprNode) visit(ctx.expression());
        return r;
    }

    @Override
    public ASTNode visitBreakStatement(MxParser.BreakStatementContext ctx) {
        return new breakStmtNode(new position(ctx));
    }

    @Override
    public ASTNode visitContinueStatement(MxParser.ContinueStatementContext ctx) {
        return new continueStmtNode(new position(ctx));
    }

    @Override
    public ASTNode visitExpressionStatement(MxParser.ExpressionStatementContext ctx) {
        expressionStmtNode e = new expressionStmtNode(new position(ctx));
        e.expression = (ExprNode) visit(ctx.expression());
        return e;
    }

    @Override
    public ASTNode visitEmptyStatement(MxParser.EmptyStatementContext ctx) {
        return null;
    }

    @Override
    public ASTNode visitNewExpr(MxParser.NewExprContext ctx) {

    }

    @Override
    public ASTNode visitFormatString(MxParser.FormatStringContext ctx) {}

    @Override
    public ASTNode visitThisExpr(MxParser.ThisExprContext ctx) {}

    @Override
    public ASTNode visitRightExpr(MxParser.RightExprContext ctx) {}

    @Override
    public ASTNode visitNullExpr(MxParser.NullExprContext ctx) {}

    @Override
    public ASTNode visitClassFuncExpr(MxParser.ClassFuncExprContext ctx) {}

    @Override
    public ASTNode visitBinaryExpr(MxParser.BinaryExprContext ctx) {}

    @Override
    public ASTNode visitFuncCallExpr(MxParser.FuncCallExprContext ctx) {}

    @Override
    public ASTNode visitVariableExpr(MxParser.VariableExprContext ctx) {}

    @Override
    public ASTNode visitNotExpr(MxParser.NotExprContext ctx) {}

    @Override
    public ASTNode visitClassMemExpr(MxParser.ClassMemExprContext ctx) {}

    @Override
    public ASTNode visitTernaryExpr(MxParser.TernaryExprContext ctx) {}

    @Override
    public ASTNode visitPriorityExpr(MxParser.PriorityExprContext ctx) {}

    @Override
    public ASTNode visitArrayVisitExpr(MxParser.ArrayVisitExprContext ctx) {}

    @Override
    public ASTNode visitLogicExpr(MxParser.LogicExprContext ctx) {}

    @Override
    public ASTNode visitLeftExpr(MxParser.LeftExprContext ctx) {}

    @Override
    public ASTNode visitBoolExpr(MxParser.BoolExprContext ctx) {}

    @Override
    public ASTNode visitAssignExpr(MxParser.AssignExprContext ctx) {}

    @Override
    public ASTNode visitConstantExpr(MxParser.ConstantExprContext ctx) {}

    @Override
    public ASTNode visitType(MxParser.TypeContext ctx) {}

    @Override
    public ASTNode visitIntCons(MxParser.IntConsContext ctx) {}

    @Override
    public ASTNode visitStrCons(MxParser.StrConsContext ctx) {}

    @Override
    public ASTNode visitArrCons(MxParser.ArrConsContext ctx) {}

    @Override
    public ASTNode visitBoolCons(MxParser.BoolConsContext ctx) {}

    @Override
    public ASTNode visitArray_Cons(MxParser.Array_ConsContext ctx) {}

    @Override
    public ASTNode visitArray_Content(MxParser.Array_ContentContext ctx) {}
}
