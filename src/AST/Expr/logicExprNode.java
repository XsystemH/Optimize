package AST.Expr;

import AST.ASTVisitor;
import util.Type.Type;
import util.position;

public class logicExprNode extends ExprNode{
    public ExprNode lhs, rhs;

    public enum logicOpType {
        land, lor;
    }
    public logicOpType opCode;

    public logicExprNode(ExprNode lhs, ExprNode rhs, logicOpType opCode, Type type_, position pos) {
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
