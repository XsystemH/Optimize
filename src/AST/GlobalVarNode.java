package AST;

import util.position;

public class GlobalVarNode extends ASTNode{
    public GlobalVarNode(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {

    }
}
