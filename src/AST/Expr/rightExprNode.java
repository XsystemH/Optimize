package AST.Expr;

import AST.ASTVisitor;
import util.Type;
import util.position;

public class rightExprNode extends ExprNode{
    public ExprNode expr;

    public enum rightOpType {
        add, sub;
    }
    public rightOpType opCode;

    public rightExprNode(ExprNode expr, rightOpType opCode, Type type_, position pos) {
        super(pos);
        this.expr = expr;
        this.opCode = opCode;
        type = type_;
    }

    @Override
    public void accept(ASTVisitor visitor) {

    }
}
