package AST.Stmt;

import AST.ASTVisitor;
import AST.Expr.ExprNode;
import util.position;

public class forStmtNode extends StmtNode{
    public StmtNode initialStmt;
    public ExprNode conditionExpr;
    public ExprNode incrementExpr;
    public StmtNode bodyStmt;

    public forStmtNode(StmtNode initial, ExprNode condition, ExprNode increment, StmtNode bodyStmt, position pos) {
        super(pos);
        this.initialStmt = initial;
        this.conditionExpr = condition;
        this.incrementExpr = increment;
        this.bodyStmt = bodyStmt;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
