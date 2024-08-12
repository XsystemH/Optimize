package AST.Expr;

import AST.ASTVisitor;
import util.position;

public class variableExprNode extends ExprNode{
    public String name;

    public variableExprNode(String name, position pos) {
        super(pos);
        this.name = name;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
