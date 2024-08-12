package AST.Expr;

import AST.ASTVisitor;
import util.position;

public class priorityExprNode extends ExprNode{
    public ExprNode expr;

    public priorityExprNode(ExprNode expr, position pos) {
        super(pos);
        this.expr = expr;
    }

    @Override
    public void accept(ASTVisitor visitor) {

    }
}
