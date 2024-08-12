package AST.Cons;

import AST.ASTVisitor;
import util.position;

public class boolConsNode extends ConsNode{
    public boolean value;

    public boolConsNode(boolean value, position pos) {
        super(pos);
        this.value = value;
        type = consType.BoolCons;
    }

    @Override
    public void accept(ASTVisitor visitor) {

    }
}
