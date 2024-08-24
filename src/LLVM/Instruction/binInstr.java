package LLVM.Instruction;

import LLVM.IRType.IRType;
import LLVM.Expression.Register.Reg;

public class binInstr extends Instr {
    public Reg result;
    public enum binaryOP {
        add, sub, mul, sdiv, srem, shl, ashr, and, or, xor
    }
    String[] opName = {"add", "sub", "mul", "sdiv", "srem", "shl", "ashr", "and", "or", "xor"};
    public binaryOP op;
    public IRType type;
    public Reg operand1;
    public Reg operand2;

    @Override
    public String getString() {
        return result.getString() + " = " +opName[op.ordinal()] + " " +
                type.getString() + " " + operand1.getString() + " " + operand2.getString();
    }
}
