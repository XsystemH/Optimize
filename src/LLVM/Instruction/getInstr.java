package LLVM.Instruction;

import LLVM.Expression.Register.Reg;
import LLVM.IRType.IRType;

public class getInstr extends Instr{
    public Reg result = null;
    public IRType type = null;
    public Reg ptr = null;
    public int idx;

    @Override
    public String getString() {
        return result.toString() + " = getelementptr " + type.getString() + ", ptr " + ptr.getString() + ", i32 " + idx;
    }
}
