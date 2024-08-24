package LLVM.Instruction;

import LLVM.Expression.Register.Reg;
import LLVM.IRType.IRType;

public class loadInstr extends Instr{
    public Reg result = null;
    public IRType type = null;
    public Reg pointer = null;

    @Override
    public String getString() {
        return result.getString() + " = load " + type.getString() + ", ptr " + pointer.getString();
    }
}
