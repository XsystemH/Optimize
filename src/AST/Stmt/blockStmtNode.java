package AST.Stmt;

import AST.ASTVisitor;
import util.position;

import java.util.ArrayList;

public class blockStmtNode extends StmtNode{
    public ArrayList<StmtNode> statements;

    public blockStmtNode(ArrayList<StmtNode> statements, position pos) {
        super(pos);
        this.statements = statements;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
