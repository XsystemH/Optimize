package MIR.Instruction;

import MIR.Expression.Expr;
import MIR.IRType.IRType;

public class retInstr extends Instr{
    public IRType type = null;
    public Expr value;

    @Override
    public String getString() {
        if (type == null) {
            return "ret void";
        }
        else {
            return "ret " + type.toString() + " " + value.toString();
        }
    }
}
