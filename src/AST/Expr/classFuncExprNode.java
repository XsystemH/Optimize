package AST.Expr;

import AST.ASTVisitor;
import util.position;

import java.util.ArrayList;

public class classFuncExprNode extends ExprNode{
    public ExprNode className;
    public String funcName;
    public ArrayList<ExprNode> parameters;

    public classFuncExprNode(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
