package LLVM.Instruction;

import LLVM.Expression.Expr;
import LLVM.IRType.IRType;
import LLVM.Expression.Register.Reg;

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
