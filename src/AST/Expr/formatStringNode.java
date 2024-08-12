package AST.Expr;

import AST.ASTVisitor;
import util.position;

import java.util.ArrayList;

public class formatStringNode extends ExprNode{
    public String begin, end;
    public ArrayList<ExprNode> exprList;
    public ArrayList<String> midList;

    public formatStringNode(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
