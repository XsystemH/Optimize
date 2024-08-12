package AST.Expr;

import AST.ASTVisitor;
import util.position;

import java.util.ArrayList;

public class arrayVisitExprNode extends ExprNode{
    public ExprNode arrayName;
    public ArrayList<ExprNode> indexes;

    public arrayVisitExprNode(ExprNode arrayName, ArrayList<ExprNode> indexes, position pos) {
        super(pos);
        this.arrayName = arrayName;
        this.indexes = indexes;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
