package AST.Cons;

import AST.ASTVisitor;
import util.position;

public class intConsNode extends ConsNode{
    public int value;

    public intConsNode(position pos) {
        super(pos);
        type = consType.intCons;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
