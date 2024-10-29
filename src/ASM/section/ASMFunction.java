package ASM.section;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

public class ASMFunction {
    public String name;
    public ArrayList<ASMBlock> blocks = new ArrayList<>();
    public int spOffset;
    public int curOffset;

    public ASMBlock curBlock;

    public int idxNum = 0;
    public String head;

    public HashSet<String> allReg = new HashSet<>();
    public HashMap<String, Integer> virtualReg = new HashMap<>();

    public int alloc(int size) {
        assert size % 4 != 0;
        curOffset += size;
        assert curOffset > spOffset;
        return curOffset - size;
    }

    public void putVirtualReg(String reg, int offset) {
        virtualReg.put(reg, offset);
    }

    public int getVirtualReg(String reg) {
        if (!virtualReg.containsKey(reg)) {
            if (!allReg.contains(reg))
                throw new RuntimeException("Virtual reg '" + reg + "' is useless");
            int offset = alloc(4);
            virtualReg.put(reg, offset);
        }
        return virtualReg.get(reg);
    }

    public void newBlock(String label) {
        ASMBlock block = new ASMBlock();
        block.label = label;
        block.parent = this;
        curBlock = block;
        blocks.add(curBlock);
    }

    public String getString() {
        StringBuilder s = new StringBuilder();
        s.append(".type ").append(name).append(", @function\n");
        for (ASMBlock block : blocks) {
            s.append(block.getString()).append("\n");
        }
        return s.toString();
    }
}
