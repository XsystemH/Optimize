package AST;

import AST.Stmt.blockStmtNode;
import AST.Stmt.varDefStmtNode;
import util.position;

import java.util.ArrayList;

public class ClassNode extends ASTNode {
    public ArrayList<varDefStmtNode> vars;
    public ArrayList<FuncNode> functions;
    public blockStmtNode constructor;

    public ClassNode(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {

    }
}
