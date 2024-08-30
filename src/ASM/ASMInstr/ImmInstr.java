package ASM.ASMInstr;

public class ImmInstr extends ASMInstr{
    public String opType;
    public String rd;
    public String rs;
    public String imm;

    @Override
    public String getString() {
        return opType + " " + rd + ", " + rs + ", " + imm;
    }
}
