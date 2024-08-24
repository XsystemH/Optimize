package LLVM.Instruction;

import LLVM.Expression.Expr;
import LLVM.Expression.Register.Reg;
import LLVM.IRType.IRType;

public class icmpInstr extends Instr{
    public Reg result = null;
    public enum condType {
        eq, ne, ugt, uge, ult, ule, sgt, slt, sle
    }
    public condType cond;
    public IRType type = null;
    public Expr op1 = null;
    public Expr op2 = null;

    @Override
    public String getString() {
        return result.getString() + " = icmp " + cond.toString() + " " + type.getString() + " " + op1.toString() + " " + op2.toString();
    }
}
