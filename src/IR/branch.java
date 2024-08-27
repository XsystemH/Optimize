package IR;

import IR.Expression.Expr;
import IR.Instruction.Instr;

public class branch extends Instr {
    public Expr cond;
    public block trueBranch = new block();
    public block falseBranch = new block();

    @Override
    public String getString() {
        return "";
    }
}
