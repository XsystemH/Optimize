package MIR.Instruction;

import MIR.Expression.Register.Reg;
import MIR.IRType.IRType;

public class allocaInstr extends Instr{
    public Reg result = null;
    public IRType type = null;

    @Override
    public String getString() {
        return result.toString() + " = alloca " + type.toString();
    }
}
