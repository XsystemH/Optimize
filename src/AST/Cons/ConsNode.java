package AST.Cons;

import AST.ASTNode;
import util.position;

public abstract class ConsNode extends ASTNode {
    public enum consType {
        intCons, strCons, ArrCons, BoolCons;
    }
    public consType type;

    public ConsNode(position pos) {
        super(pos);
    }
}
