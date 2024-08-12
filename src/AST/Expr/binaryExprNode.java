package AST.Expr;

import AST.ASTVisitor;
import util.Type;
import util.position;

public class binaryExprNode extends ExprNode{
    public ExprNode lhs, rhs;

    public enum binaryOpType {
        add, sub, mul, div, mod, leftShift, rightShift;
    }
    public binaryOpType opCode;

    public binaryExprNode(ExprNode lhs, ExprNode rhs, binaryOpType opCode, Type type_, position pos) {
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
