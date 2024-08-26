package MIR.Instruction;

import MIR.Expression.Expr;
import MIR.Expression.Register.Reg;
import MIR.IRType.IRType;

public class getInstr extends Instr{
    public Reg result = null;
    public IRType type = null;
    public Expr ptr = null;
    public Expr idx;

    @Override
    public String getString() {
        return result.toString() + " = getelementptr " + type.getString() + ", ptr " + ptr.getString() + ", i32" + idx.getString();
    }
}
