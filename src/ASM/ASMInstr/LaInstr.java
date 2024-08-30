package ASM.ASMInstr;

public class LaInstr extends ASMInstr{
    public String rd;
    public String label;

    @Override
    public String getString() {
        return "la " + rd + ", " + label;
    }
}
