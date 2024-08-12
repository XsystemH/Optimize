package AST;

import util.position;

public class FuncNode extends ASTNode {
    public FuncNode(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {

    }
}
