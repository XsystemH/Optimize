package MIR;

import MIR.Expression.Expr;
import MIR.Expression.Register.resReg;
import MIR.Instruction.Instr;

public class branch extends Instr {
    public Expr cond;
    public block trueBranch = new block();
    public block falseBranch = new block();

    @Override
    public String getString() {
        return "";
    }
}
