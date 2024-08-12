package AST.Expr;

import AST.ASTVisitor;
import util.position;

public class newExprNode extends ExprNode{
    public newExprNode(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {

    }
}
