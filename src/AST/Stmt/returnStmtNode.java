package AST.Stmt;

import AST.ASTVisitor;
import AST.Expr.ExprNode;
import util.position;

public class returnStmtNode extends StmtNode{
    public ExprNode expr;

    public returnStmtNode(ExprNode expr, position pos) {
        super(pos);
        this.expr = expr;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
