package ASM.section;

import ASM.operand.PhysicalReg;

import java.util.ArrayList;
import java.util.HashMap;

public class ASMFunction {
    public String name;
    public ArrayList<ASMBlock> blocks = new ArrayList<>();
    public int spOffset;
    public int curOffset;

    public ASMBlock curBlock;
    public PhysicalReg physicalReg = new PhysicalReg();

    public int idxNum = 0;
    public String head;

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

    public void newBlock(String label) {
        ASMBlock block = new ASMBlock();
        block.label = label;
        block.parent = this;
        curBlock = block;
        blocks.add(curBlock);
    }
}
