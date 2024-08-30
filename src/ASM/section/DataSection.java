package ASM.section;

import ASM.ASMInstr.Directive;

import java.util.ArrayList;

public class DataSection extends ASMSection{
    ArrayList<ASMBlock> data = new ArrayList<>();

    public DataSection() {
        name = ".data";
    }

    public void addGlobalVar(String var, String label) {
        ASMBlock block = new ASMBlock();
        block.label = label;
        block.isGlobal = true;
        block.alignSize = 4;
        Directive dir = new Directive();
        dir.dir = ".word";
        dir.com = var;
        block.instrs.add(dir);
        data.add(block);
    }

    @Override
    public String getString() {
        StringBuilder s = new StringBuilder();
        s.append(".section ").append(name).append("\n");
        for (ASMBlock block : data) {
            s.append(block.getString()).append("\n");
        }
        return s.toString();
    }
}
