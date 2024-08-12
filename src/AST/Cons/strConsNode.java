package AST.Cons;

import AST.ASTVisitor;
import util.position;

public class strConsNode extends ConsNode{
    public String value;

    public strConsNode(String value, position pos) {
        super(pos);
        this.value = value;
        type = consType.strCons;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
