package LLVM.Instruction;

import LLVM.Expression.Expr;
import LLVM.Expression.Register.Reg;
import LLVM.IRType.IRType;

public class storeInstr extends Instr{
    public IRType type = null;
    public Expr value = null;
    public Reg ptr = null;

    @Override
    public String getString() {
        return "store " + type.getString() + " " + value.getString() + ", ptr " + ptr.getString();
    }
}
