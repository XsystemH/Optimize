package AST.Expr;

import AST.ASTVisitor;
import util.Type;
import util.position;

public class boolExprNode extends ExprNode{
    public ExprNode lhs, rhs;

    public enum boolOpType {
        equal, notEqual, less, greater, lessOrEqual, greaterOrEqual;
    }
    public boolOpType opCode;

    public boolExprNode(ExprNode lhs, ExprNode rhs, boolOpType opCode, Type type_, position pos) {
        super(pos);
        this.lhs = lhs;
        this.rhs = rhs;
        this.opCode = opCode;
        type = type_;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
