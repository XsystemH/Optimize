package ASM.ASMInstr;

public class JInstr extends ASMInstr {
    public String label;

    @Override
    public String getString() {
        return "j " + label;
    }
}
