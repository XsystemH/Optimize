package AST;

import util.position;

public class StmtNode extends ASTNode {
    public StmtNode(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {

    }
}
