package AST.Stmt;

import AST.ASTVisitor;
import AST.Expr.ExprNode;
import util.position;

public class ifStmtNode extends StmtNode{
    public ExprNode condition;
    public StmtNode thenBlock;
    public StmtNode elseBlock;

    public ifStmtNode(ExprNode condition, StmtNode thenBlock, StmtNode elseBlock, position pos) {
        super(pos);
        this.condition = condition;
        this.thenBlock = thenBlock;
        this.elseBlock = elseBlock;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
