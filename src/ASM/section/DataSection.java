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
        return "";
    }
}
