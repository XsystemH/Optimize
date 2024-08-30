package ASM.ASMInstr;

public class LiInstr extends ASMInstr{
    public int val;
    public String rd;

    @Override
    public String getString() {
        return "li " + rd + ", " + val;
    }
}
