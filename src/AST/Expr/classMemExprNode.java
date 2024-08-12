package AST.Expr;

import AST.ASTVisitor;
import util.position;

public class classMemExprNode extends ExprNode{
    public ExprNode className;
    public String memName;

    public classMemExprNode(ExprNode className, String memName, position pos) {
        super(pos);
        this.className = className;
        this.memName = memName;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
