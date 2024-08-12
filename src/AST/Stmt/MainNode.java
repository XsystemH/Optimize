package AST.Stmt;

import AST.ASTNode;
import AST.ASTVisitor;
import util.position;

import java.util.ArrayList;

public class MainNode extends ASTNode {
    public ArrayList<ASTNode> statements;

    public MainNode(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {

    }
}
