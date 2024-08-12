package AST.Cons;

import AST.ASTVisitor;
import util.position;

import java.util.ArrayList;

public class arrConsNode extends ConsNode{
    public ArrayList<ConsNode> content;

    public arrConsNode(ArrayList<ConsNode> content, position pos) {
        super(pos);
        this.content = content;
        type = consType.ArrCons;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
