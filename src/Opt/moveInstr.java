package Opt;

import IR.Expression.Expr;
import IR.Expression.Register.Reg;
import IR.Instruction.Instr;

public class moveInstr extends Instr {
    public Reg dest;
    public Expr val;

    @Override
    public String getString() {
        return dest.getString() + " = " + val.getString();
    }

    @Override
    public int getSpSize() {
        return 1;
    }
}
