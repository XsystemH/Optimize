package AST.Expr;

import AST.ASTVisitor;
import util.position;

public class notExprNode extends ExprNode{
    public ExprNode expr;

    public notExprNode(ExprNode expr, position pos) {
        super(pos);
        this.expr = expr;
    }

    @Override
    public void accept(ASTVisitor visitor) {

    }
}
