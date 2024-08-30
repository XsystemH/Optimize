package IR.Instruction;

import IR.Expression.Register.Reg;
import IR.IRType.IRType;

public class allocaInstr extends Instr{
    public Reg result = null;
    public IRType type = null;

    @Override
    public String getString() {
        return result.getString() + " = alloca " + type.getString();
    }

    @Override
    public int getSpSize() {
        return 2;
    }
}
