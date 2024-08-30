package ASM.ASMInstr;

public class BranchInstr extends ASMInstr{
    public String op;
    public String rs1, rs2;
    public String label;

    @Override
    public String getString() {
        if (rs2 == null) {
            return op + " " + rs1 + ", " + label;
        }
        return op + " "+ rs1 + ", " + rs2 + ", " + label;
    }
}
