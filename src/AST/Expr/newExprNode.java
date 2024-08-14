package AST.Expr;

import AST.ASTVisitor;
import util.Type.Type;
import util.position;

import java.util.ArrayList;

public class newExprNode extends ExprNode{
    public Type newType;
    public ArrayList<ExprNode> expr;
    public newExprNode(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
