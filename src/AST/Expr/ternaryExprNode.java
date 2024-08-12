package AST.Expr;

import AST.ASTVisitor;
import util.position;

public class ternaryExprNode extends ExprNode{
    public boolExprNode condition;
    public ExprNode case1, case0;

    public ternaryExprNode(boolExprNode condition, ExprNode case1, ExprNode case0, position pos) {
        super(pos);
        this.condition = condition;
        this.case1 = case1;
        this.case0 = case0;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
