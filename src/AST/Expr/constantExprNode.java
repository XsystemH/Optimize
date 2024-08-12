package AST.Expr;

import AST.ASTVisitor;
import AST.Cons.ConsNode;
import util.position;

public class constantExprNode extends ExprNode{
    public ConsNode constant;

    public constantExprNode(ConsNode constant, position pos) {
        super(pos);
        this.constant = constant;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
