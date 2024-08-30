package ASM.ASMInstr;

public class JalInstr extends ASMInstr{
    public String label;

    @Override
    public String getString() {
        return "jal " + label;
    }
}
