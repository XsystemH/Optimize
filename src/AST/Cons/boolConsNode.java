package AST.Cons;

import AST.ASTVisitor;
import util.position;

public class boolConsNode extends ConsNode{
    public boolean value;

    public boolConsNode(position pos) {
        super(pos);
        type = consType.BoolCons;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
