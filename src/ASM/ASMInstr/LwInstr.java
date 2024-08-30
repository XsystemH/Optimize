package ASM.ASMInstr;

public class LwInstr extends ASMInstr{
    public int size;
    public String dest;
    public String base;
    public int offset;

    @Override
    public String getString() {
        return "lw "+ dest + ", " + offset + "(" + base + ")";
    }
}
