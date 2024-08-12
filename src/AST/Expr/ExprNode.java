package AST.Expr;

import AST.ASTNode;
import util.Type;
import util.position;

public abstract class ExprNode extends ASTNode {
    public Type type;

    public ExprNode(position pos) {
        super(pos);
    }
}
