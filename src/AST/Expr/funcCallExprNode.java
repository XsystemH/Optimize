package AST.Expr;

import AST.ASTVisitor;
import util.position;

import java.util.ArrayList;

public class funcCallExprNode extends ExprNode{
    public String funcName;
    public ArrayList<ExprNode> parameters;

    public funcCallExprNode(String funcName, ArrayList<ExprNode> parameters, position pos) {
        super(pos);
        this.funcName = funcName;
        this.parameters = parameters;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
