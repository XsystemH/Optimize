package Frontend;

import AST.*;
import AST.Stmt.StmtNode;
import AST.Stmt.blockStmtNode;
import Parser.MxBaseVisitor;
import Parser.MxParser;
import org.antlr.v4.runtime.tree.ParseTree;
import util.globalScope;
import util.position;

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
        for (MxParser.GlobalVardefContext var : ctx.globalVardef()) {
            p.globalVars.add((GlobalVarNode) visit(var));
        }
        p.mainFn = (FuncNode) visit(ctx.mainFn());
        return p;
    }

    @Override
    public ASTNode visitMainFn(MxParser.MainFnContext ctx) {}

    @Override
    public ASTNode visitClassDef(MxParser.ClassDefContext ctx) {}

    @Override
    public ASTNode visitFuncDef(MxParser.FuncDefContext ctx) {}

    @Override
    public ASTNode visitSuite(MxParser.SuiteContext ctx) {
        ArrayList<StmtNode> statements = new ArrayList<>();
        if (ctx.statement() != null) {
            for (ParseTree stmt : ctx.statement()) {
                StmtNode tmp = (StmtNode)visit(stmt);
                if (tmp != null) {
                    statements.add(tmp);
                }
            }
        }
        return new blockStmtNode(statements, new position(ctx));
    }

    @Override
    public ASTNode visitClasssuite(MxParser.ClasssuiteContext ctx) {}

    @Override
    public ASTNode visitVarMember(MxParser.VarMemberContext ctx) {}

    @Override
    public ASTNode visitFuncMember(MxParser.FuncMemberContext ctx) {}

    @Override
    public ASTNode visitConstructor(MxParser.ConstructorContext ctx) {}

    @Override
    public ASTNode visitBlockStatement(MxParser.BlockStatementContext ctx) {}

    @Override
    public ASTNode visitVardefStatement(MxParser.VardefStatementContext ctx) {}

    @Override
    public ASTNode visitIfStatement(MxParser.IfStatementContext ctx) {}

    @Override
    public ASTNode visitForStatement(MxParser.ForStatementContext ctx) {}

    @Override
    public ASTNode visitWhileStatement(MxParser.WhileStatementContext ctx) {}

    @Override
    public ASTNode visitReturnStatement(MxParser.ReturnStatementContext ctx) {}

    @Override
    public ASTNode visitBreakStatement(MxParser.BreakStatementContext ctx) {
        return null;
    }

    @Override
    public ASTNode visitContinueStatement(MxParser.ContinueStatementContext ctx) {
        return null;
    }

    @Override
    public ASTNode visitExpressionStatement(MxParser.ExpressionStatementContext ctx) {}

    @Override
    public ASTNode visitEmptyStatement(MxParser.EmptyStatementContext ctx) {
        return null;
    }

    @Override
    public ASTNode visitGlobalVardef(MxParser.GlobalVardefContext ctx) {}

    @Override
    public ASTNode visitNewExpr(MxParser.NewExprContext ctx) {}

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
