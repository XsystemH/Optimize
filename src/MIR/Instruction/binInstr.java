package MIR.Instruction;

import MIR.Expression.Expr;
import MIR.IRType.IRType;
import MIR.Expression.Register.Reg;

public class binInstr extends Instr {
    public Reg result;
    public enum binaryOP {
        add, sub, mul, sdiv, srem, shl, ashr, and, or, xor
    }
    String[] opName = {"add", "sub", "mul", "sdiv", "srem", "shl", "ashr", "and", "or", "xor"};
    public binaryOP op;
    public IRType type;
    public Expr operand1;
    public Expr operand2;

    @Override
    public String getString() {
        return result.getString() + " = " +opName[op.ordinal()] + " " +
                type.getString() + " " + operand1.getString() + " " + operand2.getString();
    }
}
