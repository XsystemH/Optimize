package ASM.ASMInstr;

public class SwInstr extends ASMInstr{
    public String src;
    public String dest;
    public int offset;

    @Override
    public String getString() {
        return "sw " + src + ", " + offset + "(" + dest + ")";
    }
}
