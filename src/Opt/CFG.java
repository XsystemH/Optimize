package Opt;

import Backend.IRBuilder;
import IR.Instruction.*;
import IR.funcDef;

import java.util.ArrayList;
import java.util.HashMap;

public class CFG {
    public HashMap<String, BasicBlock> BasicBlocks;
    public BasicBlock Entry;
    public ArrayList<BasicBlock> Exit;

    public CFG(funcDef func) {
        BasicBlocks = new HashMap<>();
        Entry = new BasicBlock();
        BasicBlock currentBlock = Entry;
        Entry.Label = new label("entry", -1);
        for (Instr irInstr : func.instrs) {
            if (irInstr instanceof label) {
                currentBlock.Label = (label) irInstr;
            }
            else if (irInstr instanceof brInstr) {
                currentBlock.Ctrl = (brInstr) irInstr;
                if (((brInstr) irInstr).cond != null) {
                    currentBlock.nextBlocks.add(((brInstr) irInstr).trueLabel.getLabel());
                    currentBlock.nextBlocks.add(((brInstr) irInstr).falseLabel.getLabel());
                }
                else {
                    currentBlock.nextBlocks.add(((brInstr) irInstr).destLabel.getLabel());
                }
                BasicBlocks.put(currentBlock.Label.getLabel(), currentBlock);
                currentBlock = new BasicBlock();
            }
            else if (irInstr instanceof retInstr) {
                currentBlock.Ctrl = (retInstr) irInstr;
                BasicBlocks.put(currentBlock.Label.getLabel(), currentBlock);
                Exit.add(currentBlock);
                currentBlock = new BasicBlock();
            }
            else {
                currentBlock.Instrs.add(irInstr);
            }
        }
        for (BasicBlock bb : BasicBlocks.values()) {
            for (String ne : bb.nextBlocks) {
                BasicBlocks.get(ne).lastBlocks.add(bb.Label.getLabel());
            }
        }
    }
}
