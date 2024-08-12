package AST.Expr;

import AST.ASTVisitor;
import util.Type;
import util.position;

public class leftExprNode extends ExprNode{
    public ExprNode expr;

    public enum leftOpType {
        add, sub, not, negation, negative;
    }
    public leftOpType opCode;

    public leftExprNode(ExprNode expr, leftOpType opCode, Type type_, position pos) {
        super(pos);
        this.expr = expr;
        this.opCode = opCode;
        type = type_;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
