package MIR.Instruction;

import MIR.Expression.Expr;
import MIR.Expression.Register.Reg;
import MIR.IRType.IRType;

public class storeInstr extends Instr{
    public IRType type = null;
    public Expr value = null;
    public Reg ptr = null;

    @Override
    public String getString() {
        return "store " + type.getString() + " " + value.getString() + ", ptr " + ptr.getString();
    }
}
