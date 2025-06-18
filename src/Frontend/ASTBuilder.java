package Frontend;

import AST.*;
import AST.Cons.*;
import AST.Expr.*;
import AST.Stmt.*;
import Parser.MxBaseVisitor;
import Parser.MxParser;
import org.antlr.v4.runtime.tree.TerminalNode;
import util.Type.BasicType;
import util.Type.ReturnType;
import util.Type.Type;
import util.Scope.globalScope;
import util.position;
import util.error.*;

import java.util.Objects;

public class ASTBuilder extends MxBaseVisitor<ASTNode> {
    public ASTBuilder() {}

    private boolean isConstant(ExprNode expr) {
        return expr instanceof constantExprNode;
    }

    private int getIntValue(ExprNode expr) {
        if (expr instanceof constantExprNode) {
            constantExprNode constExpr = (constantExprNode) expr;
            if (constExpr.constant instanceof intConsNode) {
                return ((intConsNode) constExpr.constant).value;
            }
        }
        return 0;
    }

    private boolean getBoolValue(ExprNode expr) {
        if (expr instanceof constantExprNode) {
            constantExprNode constExpr = (constantExprNode) expr;
            if (constExpr.constant instanceof boolConsNode) {
                return ((boolConsNode) constExpr.constant).value;
            }
        }
        return false;
    }

    private boolean isIntConstant(ExprNode expr) {
        return expr instanceof constantExprNode && 
               ((constantExprNode) expr).constant instanceof intConsNode;
    }

    private boolean isBoolConstant(ExprNode expr) {
        return expr instanceof constantExprNode && 
               ((constantExprNode) expr).constant instanceof boolConsNode;
    }

    private ExprNode createIntConstant(int value, position pos) {
        constantExprNode constExpr = new constantExprNode(pos);
        intConsNode intConst = new intConsNode(pos);
        intConst.value = value;
        constExpr.constant = intConst;
        return constExpr;
    }

    private ExprNode createBoolConstant(boolean value, position pos) {
        constantExprNode constExpr = new constantExprNode(pos);
        boolConsNode boolConst = new boolConsNode(pos);
        boolConst.value = value;
        constExpr.constant = boolConst;
        return constExpr;
    }

    private ExprNode foldIntBinaryOp(binaryExprNode.binaryOpType op, int left, int right, position pos) {
        int result;
        switch (op) {
            case add -> result = left + right;
            case sub -> result = left - right;
            case mul -> result = left * right;
            case div -> {
                if (right == 0) return null;
                result = left / right;
            }
            case mod -> {
                if (right == 0) return null;
                result = left % right;
            }
            case and -> result = left & right;
            case or_ -> result = left | right;
            case xor -> result = left ^ right;
            case leftShift -> result = left << right;
            case rightShift -> result = left >> right;
            default -> { return null; }
        }
        return createIntConstant(result, pos);
    }

    private ExprNode foldBoolComparison(boolExprNode.boolOpType op, int left, int right, position pos) {
        boolean result;
        switch (op) {
            case equal -> result = (left == right);
            case notEqual -> result = (left != right);
            case less -> result = (left < right);
            case greater -> result = (left > right);
            case lessOrEqual -> result = (left <= right);
            case greaterOrEqual -> result = (left >= right);
            default -> { return null; }
        }
        return createBoolConstant(result, pos);
    }

    private ExprNode foldBoolComparison(boolExprNode.boolOpType op, boolean left, boolean right, position pos) {
        boolean result;
        switch (op) {
            case equal -> result = (left == right);
            case notEqual -> result = (left != right);
            default -> { return null; }
        }
        return createBoolConstant(result, pos);
    }

    private ExprNode foldLogicalOp(logicExprNode.logicOpType op, boolean left, boolean right, position pos) {
        boolean result;
        switch (op) {
            case land -> result = left && right;
            case lor -> result = left || right;
            default -> { return null; }
        }
        return createBoolConstant(result, pos);
    }

    private ExprNode foldUnaryOp(leftExprNode.leftOpType op, ExprNode operand, position pos) {
        if (op == leftExprNode.leftOpType.negative && isIntConstant(operand)) {
            int value = getIntValue(operand);
            return createIntConstant(-value, pos);
        }
        if (op == leftExprNode.leftOpType.negation && isIntConstant(operand)) {
            int value = getIntValue(operand);
            return createIntConstant(~value, pos);
        }
        return null;
    }

    private ExprNode foldNotOp(ExprNode operand, position pos) {
        if (isBoolConstant(operand)) {
            boolean value = getBoolValue(operand);
            return createBoolConstant(!value, pos);
        }
        return null;
    }

    @Override
    public ASTNode visitProgram(MxParser.ProgramContext ctx) {
        ProgramNode p = new ProgramNode(new position(ctx));
        for (int i = 0; i < ctx.getChildCount(); i++) {
            if (ctx.getChild(i) instanceof MxParser.ClassDefContext) {
                p.members.add((ClassNode) visit(ctx.getChild(i)));
            }
            if (ctx.getChild(i) instanceof MxParser.FuncDefContext) {
                if (!(ctx.getChild(i) instanceof MxParser.MainFnContext))
                    p.members.add((FuncNode) visit(ctx.getChild(i)));
            }
            if (ctx.getChild(i) instanceof MxParser.VarDefContext) {
                p.members.add((varDefStmtNode) visit(ctx.getChild(i)));
            }
            if (ctx.getChild(i) == ctx.mainFn()) {
                p.members.add((FuncNode) visit(ctx.getChild(i)));
                p.main = (MainNode) visit(ctx.getChild(i));
            }
        }
        if (ctx.mainFn() == null) {
            throw new semanticError("Invalid Identifier", new position(ctx));
        }
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
        c.name = ctx.Identifier().getText();
        for (MxParser.VarDefContext var : ctx.classsuite().varDef()) {
            c.vars.add((varDefStmtNode) visit(var));
        }
        for (MxParser.FuncDefContext func : ctx.classsuite().funcDef()) {
            c.functions.add((FuncNode) visit(func));
        }
        if (ctx.classsuite().constructor().size() > 1) {
            throw new syntaxError("Multiple Definitions", new position(ctx));
        } else if (ctx.classsuite().constructor().size() == 1) {
            if (!ctx.classsuite().constructor().get(0).Identifier().getText().equals(c.name)) {
                throw new syntaxError("Invalid Identifier", new position(ctx));
            }
            c.constructor = (blockStmtNode) visit(ctx.classsuite().constructor(0).suite());
        }
        return c;
    }

    @Override
    public ASTNode visitFuncDef(MxParser.FuncDefContext ctx) {
        FuncNode f = new FuncNode(new position(ctx));
        f.name = ctx.funcName.getText();
        f.returnType = new ReturnType(ctx.returnType());
        for (MxParser.ParamContext param : ctx.param()) {
            f.paramType.add(new Type(param.type()));
            f.paramName.add(param.name.getText());
        }
        for (MxParser.StatementContext stmt : ctx.suite().statement()) {
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
        for (int i = 0; i < ctx.varPair().size(); i++) {
            v.name.add(ctx.varPair(i).Identifier().getText());
            if (ctx.varPair(i).expression() != null)
                v.expr.add((ExprNode) visit(ctx.varPair(i).expression()));
            else
                v.expr.add(null);
        }
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
        v.type = new Type(ctx.varDef().type());
        for (int i = 0; i < ctx.varDef().varPair().size(); i++) {
            v.name.add(ctx.varDef().varPair(i).Identifier().getText());
            if (ctx.varDef().varPair(i).expression() != null)
                v.expr.add((ExprNode) visit(ctx.varDef().varPair(i).expression()));
            else v.expr.add(null);
        }
        return v;
    }

    @Override
    public ASTNode visitIfStatement(MxParser.IfStatementContext ctx) {
        ifStmtNode i = new ifStmtNode(new position(ctx));
        i.condition = (ExprNode) visit(ctx.expression());
        i.thenBlock = (StmtNode) visit(ctx.trueStmt);
        if (ctx.falseStmt != null)
            i.elseBlock = (StmtNode) visit(ctx.falseStmt);
        return i;
    }

    @Override
    public ASTNode visitForStatement(MxParser.ForStatementContext ctx) {
        forStmtNode f = new forStmtNode(new position(ctx));
        if (ctx.initialStmt != null)
            f.initialStmt = (StmtNode) visit(ctx.initialStmt);
        if (ctx.conditionExpr != null)
            f.conditionExpr = (ExprNode) visit(ctx.conditionExpr);
        if (ctx.stepExpr != null)
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
        if (ctx.expression() != null)
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
    public ASTNode visitNewArrExpr(MxParser.NewArrExprContext ctx) {
        newArrExprNode n = new newArrExprNode(new position(ctx));
        n.type = new Type(ctx.basicType());
        n.type.dim = ctx.Left_Bracket().size();
        int bracketNum = 0, exprNum = 0;
        for (int i = 0; i < ctx.expression().size(); i++) {
            n.expr.add((ExprNode) visit(ctx.expression(i)));
            if (ctx.expression(i).getStart().getTokenIndex() > ctx.RightBracket(i).getSymbol().getTokenIndex())
                throw new syntaxError("Invalid Identifier", new position(ctx));
        }
        if (ctx.array_Constant() != null)
            n.arr = (arrConsNode) visit(ctx.array_Constant());
        return n;
    }

    @Override
    public ASTNode visitNewVarExpr(MxParser.NewVarExprContext ctx) {
        newVarExprNode n = new newVarExprNode(new position(ctx));
        n.type = new Type(ctx.basicType());
        n.calling = (ctx.Left_Paren()!=null);
        return n;
    }

    @Override
    public ASTNode visitFormatString(MxParser.FormatStringContext ctx) {
        formatStringNode f = new formatStringNode(new position(ctx));
        if (ctx.children.size() == 1) {
            strConsNode s = new strConsNode(new position(ctx));
            s.value = ctx.FormatEmpty().getText();
            return s;
//            f.begin = ctx.FormatEmpty().getText();
        } else {
            f.begin = ctx.FormatBegin().getText();
            f.end = ctx.FormatEnd().getText();
            for (TerminalNode fMid : ctx.FormatMid()) {
                f.midList.add(fMid.getText());
            }
            for (MxParser.ExpressionContext expr : ctx.expression()) {
                f.exprList.add((ExprNode) visit(expr));
            }
        }
        return f;
    }

    @Override
    public ASTNode visitThisExpr(MxParser.ThisExprContext ctx) {
        return new thisExprNode(new position(ctx));
    }

    @Override
    public ASTNode visitRightExpr(MxParser.RightExprContext ctx) {
        rightExprNode r = new rightExprNode(new position(ctx));
        r.expr = (ExprNode) visit(ctx.expression());
        if (Objects.equals(ctx.op.getText(), "++")) {
            r.opCode = rightExprNode.rightOpType.add;
        } else if (Objects.equals(ctx.op.getText(), "--")) {
            r.opCode = rightExprNode.rightOpType.sub;
        }
        return r;
    }

    @Override
    public ASTNode visitNullExpr(MxParser.NullExprContext ctx) {
        return new nullExprNode(new position(ctx));
    }

    @Override
    public ASTNode visitClassFuncExpr(MxParser.ClassFuncExprContext ctx) {
        classFuncExprNode c = new classFuncExprNode(new position(ctx));
        c.className = (ExprNode) visit(ctx.expression(0));
        c.funcName = ctx.funcName.getText();
        for (int i = 1; i < ctx.expression().size(); i++) {
            c.parameters.add((ExprNode) visit(ctx.expression(i)));
        }
        return c;
    }

    @Override
    public ASTNode visitBinaryExpr1(MxParser.BinaryExpr1Context ctx) {
        ExprNode lhs = (ExprNode) visit(ctx.expression(0));
        ExprNode rhs = (ExprNode) visit(ctx.expression(1));
        
        binaryExprNode.binaryOpType opType;
        switch (ctx.op.getText()) {
            case "+" -> opType = binaryExprNode.binaryOpType.add;
            case "-" -> opType = binaryExprNode.binaryOpType.sub;
            case "*" -> opType = binaryExprNode.binaryOpType.mul;
            case "/" -> opType = binaryExprNode.binaryOpType.div;
            case "%" -> opType = binaryExprNode.binaryOpType.mod;
            case "&" -> opType = binaryExprNode.binaryOpType.and;
            case "|" -> opType = binaryExprNode.binaryOpType.or_;
            case "^" -> opType = binaryExprNode.binaryOpType.xor;
            case "<<" -> opType = binaryExprNode.binaryOpType.leftShift;
            case ">>" -> opType = binaryExprNode.binaryOpType.rightShift;
            default -> opType = binaryExprNode.binaryOpType.add; // 默认值
        }
        
        // 尝试常量折叠
        if (isIntConstant(lhs) && isIntConstant(rhs)) {
            int leftVal = getIntValue(lhs);
            int rightVal = getIntValue(rhs);
            ExprNode folded = foldIntBinaryOp(opType, leftVal, rightVal, new position(ctx));
            if (folded != null) {
                return folded;
            }
        }

        binaryExprNode b = new binaryExprNode(new position(ctx));
        b.lhs = lhs;
        b.rhs = rhs;
        b.opCode = opType;
        return b;
    }

    @Override
    public ASTNode visitBinaryExpr2(MxParser.BinaryExpr2Context ctx) {
        ExprNode lhs = (ExprNode) visit(ctx.expression(0));
        ExprNode rhs = (ExprNode) visit(ctx.expression(1));
        
        binaryExprNode.binaryOpType opType;
        switch (ctx.op.getText()) {
            case "+" -> opType = binaryExprNode.binaryOpType.add;
            case "-" -> opType = binaryExprNode.binaryOpType.sub;
            case "*" -> opType = binaryExprNode.binaryOpType.mul;
            case "/" -> opType = binaryExprNode.binaryOpType.div;
            case "%" -> opType = binaryExprNode.binaryOpType.mod;
            case "&" -> opType = binaryExprNode.binaryOpType.and;
            case "|" -> opType = binaryExprNode.binaryOpType.or_;
            case "^" -> opType = binaryExprNode.binaryOpType.xor;
            case "<<" -> opType = binaryExprNode.binaryOpType.leftShift;
            case ">>" -> opType = binaryExprNode.binaryOpType.rightShift;
            default -> opType = binaryExprNode.binaryOpType.add; // 默认值
        }

        if (isIntConstant(lhs) && isIntConstant(rhs)) {
            int leftVal = getIntValue(lhs);
            int rightVal = getIntValue(rhs);
            ExprNode folded = foldIntBinaryOp(opType, leftVal, rightVal, new position(ctx));
            if (folded != null) {
                return folded;
            }
        }

        binaryExprNode b = new binaryExprNode(new position(ctx));
        b.lhs = lhs;
        b.rhs = rhs;
        b.opCode = opType;
        return b;
    }

    @Override
    public ASTNode visitBinaryExpr3(MxParser.BinaryExpr3Context ctx) {
        ExprNode lhs = (ExprNode) visit(ctx.expression(0));
        ExprNode rhs = (ExprNode) visit(ctx.expression(1));
        
        binaryExprNode.binaryOpType opType;
        switch (ctx.op.getText()) {
            case "+" -> opType = binaryExprNode.binaryOpType.add;
            case "-" -> opType = binaryExprNode.binaryOpType.sub;
            case "*" -> opType = binaryExprNode.binaryOpType.mul;
            case "/" -> opType = binaryExprNode.binaryOpType.div;
            case "%" -> opType = binaryExprNode.binaryOpType.mod;
            case "&" -> opType = binaryExprNode.binaryOpType.and;
            case "|" -> opType = binaryExprNode.binaryOpType.or_;
            case "^" -> opType = binaryExprNode.binaryOpType.xor;
            case "<<" -> opType = binaryExprNode.binaryOpType.leftShift;
            case ">>" -> opType = binaryExprNode.binaryOpType.rightShift;
            default -> opType = binaryExprNode.binaryOpType.add; // 默认值
        }
        
        // 尝试常量折叠
        if (isIntConstant(lhs) && isIntConstant(rhs)) {
            int leftVal = getIntValue(lhs);
            int rightVal = getIntValue(rhs);
            ExprNode folded = foldIntBinaryOp(opType, leftVal, rightVal, new position(ctx));
            if (folded != null) {
                return folded;
            }
        }

        binaryExprNode b = new binaryExprNode(new position(ctx));
        b.lhs = lhs;
        b.rhs = rhs;
        b.opCode = opType;
        return b;
    }

    @Override
    public ASTNode visitBinaryExpr4(MxParser.BinaryExpr4Context ctx) {
        ExprNode lhs = (ExprNode) visit(ctx.expression(0));
        ExprNode rhs = (ExprNode) visit(ctx.expression(1));
        
        binaryExprNode.binaryOpType opType;
        switch (ctx.op.getText()) {
            case "+" -> opType = binaryExprNode.binaryOpType.add;
            case "-" -> opType = binaryExprNode.binaryOpType.sub;
            case "*" -> opType = binaryExprNode.binaryOpType.mul;
            case "/" -> opType = binaryExprNode.binaryOpType.div;
            case "%" -> opType = binaryExprNode.binaryOpType.mod;
            case "&" -> opType = binaryExprNode.binaryOpType.and;
            case "|" -> opType = binaryExprNode.binaryOpType.or_;
            case "^" -> opType = binaryExprNode.binaryOpType.xor;
            case "<<" -> opType = binaryExprNode.binaryOpType.leftShift;
            case ">>" -> opType = binaryExprNode.binaryOpType.rightShift;
            default -> opType = binaryExprNode.binaryOpType.add; // 默认值
        }

        if (isIntConstant(lhs) && isIntConstant(rhs)) {
            int leftVal = getIntValue(lhs);
            int rightVal = getIntValue(rhs);
            ExprNode folded = foldIntBinaryOp(opType, leftVal, rightVal, new position(ctx));
            if (folded != null) {
                return folded;
            }
        }

        binaryExprNode b = new binaryExprNode(new position(ctx));
        b.lhs = lhs;
        b.rhs = rhs;
        b.opCode = opType;
        return b;
    }

    @Override
    public ASTNode visitFuncCallExpr(MxParser.FuncCallExprContext ctx) {
        funcCallExprNode f = new funcCallExprNode(new position(ctx));
        f.funcName = ctx.funcName.getText();
        for (MxParser.ExpressionContext expr : ctx.expression()) {
            f.parameters.add((ExprNode) visit(expr));
        }
        return f;
    }

    @Override
    public ASTNode visitVariableExpr(MxParser.VariableExprContext ctx) {
        variableExprNode v = new variableExprNode(new position(ctx));
        v.name = ctx.varName.getText();
        return v;
    }

    @Override
    public ASTNode visitNotExpr(MxParser.NotExprContext ctx) {
        ExprNode operand = (ExprNode) visit(ctx.expression());

        ExprNode folded = foldNotOp(operand, new position(ctx));
        if (folded != null) {
            return folded;
        }

        notExprNode n = new notExprNode(new position(ctx));
        n.expr = operand;
        return n;
    }

    @Override
    public ASTNode visitClassMemExpr(MxParser.ClassMemExprContext ctx) {
        classMemExprNode c = new classMemExprNode(new position(ctx));
        c.className = (ExprNode) visit(ctx.expression());
        c.memName = ctx.memberName.getText();
        return c;
    }

    @Override
    public ASTNode visitTernaryExpr(MxParser.TernaryExprContext ctx) {
        ternaryExprNode t = new ternaryExprNode(new position(ctx));
        t.condition = (ExprNode) visit(ctx.expression(0));
        t.case0 = (ExprNode) visit(ctx.expression(1));
        t.case1 = (ExprNode) visit(ctx.expression(2));
        return t;
    }

    @Override
    public ASTNode visitPriorityExpr(MxParser.PriorityExprContext ctx) {
        priorityExprNode p = new priorityExprNode(new position(ctx));
        p.expr = (ExprNode) visit(ctx.expression());
        return p;
    }

    @Override
    public ASTNode visitArrayVisitExpr(MxParser.ArrayVisitExprContext ctx) {
        arrayVisitExprNode a = new arrayVisitExprNode(new position(ctx));
        a.arrayName = (ExprNode) visit(ctx.arrayName);
        a.index = (ExprNode) visit(ctx.index);
        if (a.index == null) {
            System.out.println(new position(ctx.index));
        }
        return a;
    }

    @Override
    public ASTNode visitLogicExpr(MxParser.LogicExprContext ctx) {
        ExprNode lhs = (ExprNode) visit(ctx.expression(0));
        ExprNode rhs = (ExprNode) visit(ctx.expression(1));
        
        logicExprNode.logicOpType opType;
        switch (ctx.op.getText()) {
            case "&&" -> opType = logicExprNode.logicOpType.land;
            case "||" -> opType = logicExprNode.logicOpType.lor;
            default -> opType = logicExprNode.logicOpType.land; // 默认值
        }

        if (isBoolConstant(lhs) && isBoolConstant(rhs)) {
            boolean leftVal = getBoolValue(lhs);
            boolean rightVal = getBoolValue(rhs);
            ExprNode folded = foldLogicalOp(opType, leftVal, rightVal, new position(ctx));
            if (folded != null) {
                return folded;
            }
        }

        logicExprNode l = new logicExprNode(new position(ctx));
        l.lhs = lhs;
        l.rhs = rhs;
        l.opCode = opType;
        return l;
    }

    @Override
    public ASTNode visitLeftExpr(MxParser.LeftExprContext ctx) {
        ExprNode operand = (ExprNode) visit(ctx.expression());
        
        leftExprNode.leftOpType opType;
        switch (ctx.op.getText()) {
            case "++" -> opType = leftExprNode.leftOpType.add;
            case "--" -> opType = leftExprNode.leftOpType.sub;
            case "~" -> opType = leftExprNode.leftOpType.negation;
            case "-" -> opType = leftExprNode.leftOpType.negative;
            default -> opType = leftExprNode.leftOpType.negative; // 默认值
        }
        
        // 尝试常量折叠 (只对负号和按位取反进行折叠)
        if (opType == leftExprNode.leftOpType.negative || opType == leftExprNode.leftOpType.negation) {
            ExprNode folded = foldUnaryOp(opType, operand, new position(ctx));
            if (folded != null) {
                return folded;
            }
        }
        
        // 如果无法折叠，创建普通的左一元表达式节点
        leftExprNode l = new leftExprNode(new position(ctx));
        l.expr = operand;
        l.opCode = opType;
        return l;
    }

    @Override
    public ASTNode visitBoolExpr(MxParser.BoolExprContext ctx) {
        ExprNode lhs = (ExprNode) visit(ctx.expression(0));
        ExprNode rhs = (ExprNode) visit(ctx.expression(1));
        
        boolExprNode.boolOpType opType;
        switch (ctx.op.getText()) {
            case "==" -> opType = boolExprNode.boolOpType.equal;
            case "!=" -> opType = boolExprNode.boolOpType.notEqual;
            case "<" -> opType = boolExprNode.boolOpType.less;
            case ">" -> opType = boolExprNode.boolOpType.greater;
            case "<=" -> opType = boolExprNode.boolOpType.lessOrEqual;
            case ">=" -> opType = boolExprNode.boolOpType.greaterOrEqual;
            default -> opType = boolExprNode.boolOpType.equal; // 默认值
        }
        
        // 尝试常量折叠
        if (isIntConstant(lhs) && isIntConstant(rhs)) {
            int leftVal = getIntValue(lhs);
            int rightVal = getIntValue(rhs);
            ExprNode folded = foldBoolComparison(opType, leftVal, rightVal, new position(ctx));
            if (folded != null) {
                return folded;
            }
        } else if (isBoolConstant(lhs) && isBoolConstant(rhs) && 
                   (opType == boolExprNode.boolOpType.equal || opType == boolExprNode.boolOpType.notEqual)) {
            boolean leftVal = getBoolValue(lhs);
            boolean rightVal = getBoolValue(rhs);
            ExprNode folded = foldBoolComparison(opType, leftVal, rightVal, new position(ctx));
            if (folded != null) {
                return folded;
            }
        }

        boolExprNode b = new boolExprNode(new position(ctx));
        b.lhs = lhs;
        b.rhs = rhs;
        b.opCode = opType;
        return b;
    }

    @Override
    public ASTNode visitAssignExpr(MxParser.AssignExprContext ctx) {
        assignExprNode a = new assignExprNode(new position(ctx));
        a.lhs = (ExprNode) visit(ctx.expression(0));
        a.rhs = (ExprNode) visit(ctx.expression(1));
        return a;
    }

    @Override
    public ASTNode visitConstantExpr(MxParser.ConstantExprContext ctx) {
        constantExprNode c = new constantExprNode(new position(ctx));
        c.constant = (ConsNode) visit(ctx.constants());
        return c;
    }

    @Override
    public ASTNode visitIntCons(MxParser.IntConsContext ctx) {
        intConsNode c = new intConsNode(new position(ctx));
        c.value = Integer.parseInt(ctx.getText());
        return c;
    }

    @Override
    public ASTNode visitStrCons(MxParser.StrConsContext ctx) {
        strConsNode c = new strConsNode(new position(ctx));
        c.value = ctx.getText();
        return c;
    }

    @Override
    public ASTNode visitArrCons(MxParser.ArrConsContext ctx) {
        arrConsNode c = new arrConsNode(new position(ctx));
        if (ctx.array_Constant() == null) return c;
        if (ctx.array_Constant().array_Content() == null) return c;
        for (MxParser.ConstantsContext content : ctx.array_Constant().array_Content().constants()) {
            c.content.add((ConsNode) visit(content));
        }
        return c;
    }

    @Override
    public ASTNode visitArray_Constant(MxParser.Array_ConstantContext ctx) {
        arrConsNode c = new arrConsNode(new position(ctx));
        if (ctx.array_Content() == null) return c;
        for (MxParser.ConstantsContext content : ctx.array_Content().constants()) {
            c.content.add((ConsNode) visit(content));
        }
        return c;
    }

    @Override
    public ASTNode visitBoolCons(MxParser.BoolConsContext ctx) {
        boolConsNode c = new boolConsNode(new position(ctx));
        c.value = Objects.equals(ctx.getText(), "true");
        return c;
    }
}
