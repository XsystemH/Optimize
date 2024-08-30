package ASM.section;

import ASM.ASMInstr.Directive;

import java.util.ArrayList;

public class RodataSection extends ASMSection {
    public String name = ".rodata";
    public ArrayList<ASMBlock> strings = new ArrayList<>();

    public void addStr(String str, String label) {
        ASMBlock block = new ASMBlock();
        block.label = label;
        block.isGlobal = true;
        block.alignSize = 1;
        block.parent = null;
        Directive dir = new Directive();
        dir.dir = ".asciz";
        dir.com = "\"" + str + "\"";
        block.instrs.add(dir);
        strings.add(block);
    }

    @Override
    public String getString() {
        return "";
    }
}
