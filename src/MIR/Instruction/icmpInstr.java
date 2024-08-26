package MIR.Instruction;

import MIR.Expression.Expr;
import MIR.Expression.Register.Reg;
import MIR.IRType.IRType;

public class icmpInstr extends Instr{
    public Reg result = null;
    public enum condType {
        eq, ne, ugt, uge, ult, ule, sgt, sge, slt, sle
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
