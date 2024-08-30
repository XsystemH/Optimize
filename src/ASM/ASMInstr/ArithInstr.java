package ASM.ASMInstr;

public class ArithInstr extends ASMInstr {
    public String rd, rs1, rs2;
    public String opType;

    @Override
    public String getString() {
        return opType + " " + rd + ", " + rs1 + ", " + rs2;
    }
}
