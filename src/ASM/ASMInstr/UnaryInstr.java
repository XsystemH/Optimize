package ASM.ASMInstr;

public class UnaryInstr extends ASMInstr {
    public String op;
    public String rd, rs;

    @Override
    public String getString() {
        return op + " " + rd + ", " + rs;
    }
}
