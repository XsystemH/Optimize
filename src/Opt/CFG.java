package Opt;

import IR.Expression.Expr;
import IR.Instruction.*;
import IR.funcDef;

import java.util.*;

public class CFG {
    public HashMap<String, BasicBlock> BasicBlocks;
    public BasicBlock Entry;
    public ArrayList<BasicBlock> Exit;
    public ArrayList<allocaInstr> AllocInstr;

    public CFG(funcDef func) {
        BasicBlocks = new HashMap<>();
        Entry = new BasicBlock();
        BasicBlock currentBlock = Entry;
        Entry.Label = new label("entry", -1);
        Entry.Instrs.addAll(func.alloc);
        Exit = new ArrayList<>();
        for (Instr irInstr : func.instrs) {
            if (irInstr instanceof label) {
                currentBlock.Label = (label) irInstr;
            }
            else if (irInstr instanceof brInstr br) {
                currentBlock.Ctrl = br;
                // br in draft.md
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
            else if (irInstr instanceof retInstr ret) {
                currentBlock.Ctrl = ret;
                // ret draft.md
                BasicBlocks.put(currentBlock.Label.getLabel(), currentBlock);
                Exit.add(currentBlock);
                currentBlock = new BasicBlock();
            }
            else {
                currentBlock.Instrs.add(irInstr);
                // use&def in draft.md
                if (irInstr instanceof loadInstr load) {
                    for (Instr alloca : func.alloc) {
                        boolean flag = false;
                        if (load.result.equals(((allocaInstr)alloca).result)) {
                            ((allocaInstr) alloca).defs.add(load);
                            flag = true;
                        }
                        if (load.pointer.equals(((allocaInstr)alloca).result)) {
                            ((allocaInstr) alloca).uses.add(load);
                            flag = true;
                        }
                        if (flag) {
                            if (((allocaInstr) alloca).blockName != null && !Objects.equals(((allocaInstr) alloca).blockName, currentBlock.Label.getLabel()))
                                ((allocaInstr) alloca).oneBlock = false;
                            else ((allocaInstr) alloca).blockName = currentBlock.Label.getLabel();
                        }
                    }
                }
                if (irInstr instanceof storeInstr store) {
                    for (Instr alloca : func.alloc) {
                        boolean flag = false;
                        if (store.ptr.equals(((allocaInstr)alloca).result)) {
                            ((allocaInstr) alloca).defs.add(store);
                            flag = true;
                        }
                        if (store.value.equals(((allocaInstr)alloca).result)) {
                            ((allocaInstr) alloca).uses.add(store);
                            flag = true;
                        }
                        if (flag) {
                            if (((allocaInstr) alloca).blockName != null && !Objects.equals(((allocaInstr) alloca).blockName, currentBlock.Label.getLabel()))
                                ((allocaInstr) alloca).oneBlock = false;
                            else ((allocaInstr) alloca).blockName = currentBlock.Label.getLabel();
                        }
                    }
                }
            }
        }
        for (BasicBlock bb : BasicBlocks.values()) {
            for (String ne : bb.nextBlocks) {
                BasicBlocks.get(ne).lastBlocks.add(bb.Label.getLabel());
            }
        }
    }

    public void Mem2Reg() {
        // Mem2Reg
        for (allocaInstr alloc : AllocInstr) {
            // case 1: no use
            if (alloc.uses.isEmpty()) {
                alloc.toReg = true;
                for (Instr def : alloc.defs) {
                    def.toReg = true;
                }
                continue;
            }
//            if (alloc.oneBlock && alloc.defs.size() == 1) {
//                alloc.toReg = true;
//                alloc.defs.get(0).toReg = true;
//
//                Expr val = ((storeInstr) alloc.defs.get(0)).value;
//                for (Instr use : alloc.uses) {
//                    // todo: mem -> val
//                }
//                continue;
//            }
            // to SSA
        }
        // Dominate
        ArrayList<BasicBlock> rpo = getRPO(Entry);
        Queue<String> queue = new LinkedList<>();
        HashMap<String, BitSet> domSets = new HashMap<>();

        for (String name : BasicBlocks.keySet()) {
            BitSet bitSet = new BitSet(BasicBlocks.size());
            bitSet.set(0, BasicBlocks.size()); // set all bits to true
            domSets.put(name, bitSet);
        }

        // Set Dom[Entry] to only includes itself
        BitSet startDomSet = domSets.get(Entry.Label.getLabel());
        startDomSet.clear();
        startDomSet.set(rpo.indexOf(Entry));

        boolean flag;
        do {
            flag = false;
            for (BasicBlock bb : rpo) {
                if (bb.equals(Entry)) {
                    continue;
                }

                BitSet newDom = new BitSet(BasicBlocks.size());
                newDom.set(0, BasicBlocks.size());

                for (String la : bb.lastBlocks) {
                    newDom.and(domSets.get(la));
                }
                newDom.set(rpo.indexOf(bb));

                if (!newDom.equals(domSets.get(bb.Label.getLabel()))) {
                    domSets.put(bb.Label.getLabel(), newDom);
                    flag = true;
                }
            }
        } while (flag);
    }

    private ArrayList<BasicBlock> getRPO(BasicBlock start) {
        ArrayList<BasicBlock> po = new ArrayList<>();
        Set<String> visited = new HashSet<>() ;
        Stack<BasicBlock> stack = new Stack<>();
        
        stack.push(start);
        while (!stack.isEmpty()) {
            BasicBlock bb = stack.peek();
            if (visited.contains(bb.Label.getLabel())) {
                stack.pop();
                if (!po.contains(bb)) {
                    po.add(bb);
                }
            }
            else {
                visited.add(bb.Label.getLabel());
                for (String str : bb.nextBlocks) {
                    if (!visited.contains(str)) {
                        stack.push(BasicBlocks.get(str));
                    }
                }
            }
        }

        ArrayList<BasicBlock> rpo = new ArrayList<>();
        for (int i = po.size() - 1; i >= 0; i--) {
            rpo.add(po.get(i));
        }
        return rpo;
    }
}
