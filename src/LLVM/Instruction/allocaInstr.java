package LLVM.Instruction;

import LLVM.Expression.Register.Reg;
import LLVM.IRType.IRType;

public class allocaInstr extends Instr{
    public Reg result = null;
    public IRType type = null;

    @Override
    public String getString() {
        return result.toString() + " = alloca " + type.toString();
    }
}
