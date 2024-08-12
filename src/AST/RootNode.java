package AST;

import util.position;

public class RootNode extends ASTNode {
    public RootNode(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {

    }
}
