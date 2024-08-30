package ASM.ASMInstr;

public class MvInstr extends ASMInstr {
    public String rd, rs;

    @Override
    public String getString() {
        return "mv " + rd + ", " + rs;
    }
}
