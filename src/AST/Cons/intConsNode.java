package AST.Cons;

import AST.ASTVisitor;
import util.position;

public class intConsNode extends ConsNode{
    int value;

    public intConsNode(int value, position pos) {
        super(pos);
        this.value = value;
        type = consType.intCons;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
