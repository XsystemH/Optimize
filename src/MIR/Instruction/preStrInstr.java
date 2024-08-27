package MIR.Instruction;

import MIR.Expression.Register.Reg;

public class preStrInstr extends Instr{
    public Reg reg;
    public String str;

    @Override
    public String getString() {
        return reg.getString() + " = [" + (str.length() + 1) + " x i8] c\"" + str + "\\00" + "\"";
    }
}
