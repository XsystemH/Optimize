package ASM.section;

import ASM.ASMInstr.ASMInstr;

import java.util.ArrayList;

public class ASMBlock {
    public boolean isGlobal = false;
    public int alignSize = 0;
    public String label;
    public ASMFunction parent;
    public ArrayList<ASMInstr> instrs = new ArrayList<>();

    public String getString() {
        StringBuilder str = new StringBuilder();
        if (alignSize > 0) {
            str.append(".p2align ").append(alignSize).append("\n");
        }
        if (isGlobal) {
            str.append(".global").append(label).append("\n");
        }
        str.append(label).append(":\n");
        for (ASMInstr instr : instrs) {
            str.append("\t").append(instr.getString()).append("\n");
        }
        return str.toString();
    }
}
