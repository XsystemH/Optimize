package AST.Stmt;

import AST.ASTVisitor;
import AST.Expr.ExprNode;
import util.Type.Type;
import util.position;

public class varDefStmtNode extends StmtNode{
    public Type type;
    public String name;
    public ExprNode expr;

    public varDefStmtNode(Type type, String name, ExprNode expr, position pos) {
        super(pos);
        this.type = type;
        this.name = name;
        this.expr = expr;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
