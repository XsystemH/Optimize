package AST.Expr;

import AST.ASTVisitor;
import util.position;

import java.util.ArrayList;

public class classFuncExprNode extends ExprNode{
    public ExprNode className;
    public String funcName;
    public ArrayList<ExprNode> parameters;

    public classFuncExprNode(ExprNode className, String funcName, ArrayList<ExprNode> parameters, position pos) {
        super(pos);
        this.className = className;
        this.funcName = funcName;
        this.parameters = parameters;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
