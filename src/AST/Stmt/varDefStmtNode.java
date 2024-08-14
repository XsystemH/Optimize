package AST.Stmt;

import AST.ASTVisitor;
import AST.Expr.ExprNode;
import util.Type.Type;
import util.position;

public class varDefStmtNode extends StmtNode{
    public Type type;
    public String name;
    public ExprNode expr;

    public varDefStmtNode(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
