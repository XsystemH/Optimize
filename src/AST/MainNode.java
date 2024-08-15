package AST;

import AST.Stmt.StmtNode;
import util.position;

import java.util.ArrayList;

public class MainNode extends ASTNode {
    public ArrayList<StmtNode> statements;

    public MainNode(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {

    }
}
