package Opt;

import IR.Expression.Constant.intCons;
import IR.Expression.Expr;
import IR.Expression.Register.Reg;
import IR.Expression.Register.varReg;
import IR.Instruction.*;
import IR.funcDef;

import java.util.*;

public class CFG {
    public HashMap<String, BasicBlock> BasicBlocks;
    public HashMap<String, Reg> Regs;
    public BasicBlock Entry;
    public ArrayList<BasicBlock> Exit;
    public ArrayList<allocaInstr> AllocInstr;

    public ArrayList<BasicBlock> rpo;

    public HashMap<String, ActivePeriod> activePeriods;

    public CFG(funcDef func) {
        BasicBlocks = new HashMap<>();
        Entry = new BasicBlock();
        BasicBlock currentBlock = Entry;
        Entry.Label = new label("entry", -1);
        Exit = new ArrayList<>();
        AllocInstr = new ArrayList<>();
        activePeriods = new HashMap<>();

        for (Instr alloc : func.alloc) {
            if (alloc instanceof allocaInstr alloca) {
                AllocInstr.add(alloca);
            }
        }

        for (Instr irInstr : func.instrs) {
            if (irInstr instanceof label) {
                currentBlock.Label = (label) irInstr;
            }
            else if (currentBlock.Label == null) {
                continue; // skip multi ctrl instr
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
                        if (load.result.getString().equals(((allocaInstr)alloca).result.getString())) {
                            ((allocaInstr) alloca).defs.add(load);
                            flag = true;
                        }
                        if (load.pointer.getString().equals(((allocaInstr)alloca).result.getString())) {
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
                        if (store.ptr.getString().equals(((allocaInstr)alloca).result.getString())) {
                            ((allocaInstr) alloca).defs.add(store);
                            flag = true;
                        }
                        if (store.value.getString().equals(((allocaInstr)alloca).result.getString())) {
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
        rmUnused();
        Dominate();
        getPhiPos();

        HashMap<String, Expr> last_def = new HashMap<>();
        HashMap<String, Stack<Expr>> cur_name = new HashMap<>();
        for (allocaInstr alloc : AllocInstr) {
            cur_name.put(alloc.result.getString(), new Stack<>());
        }

        reNameVar(rpo.get(0), cur_name, last_def);
    }

    private void rmUnused() {
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
//
//                }
//                continue;
//            }
        }
    }

    private void Dominate() {
        rpo = getRPO(Entry);
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

        for (BasicBlock bb : rpo) {
            bb.dom = domSets.get(bb.Label.getLabel());
        }

        // get Immediate Dominator
        for (int i = 1; i < rpo.size(); i++) {
            BasicBlock cur = rpo.get(i);
            for (int j = 0; j < rpo.size(); j++) {
                if (cur.dom.get(j)) {
                    // tmp = (dom[j] & dom[i]) ^ dom[i]
                    BitSet tmp = (BitSet) rpo.get(j).dom.clone();
                    tmp.and(cur.dom);
                    tmp.xor(cur.dom);

                    if (tmp.cardinality() == 1 && tmp.get(i)) {
                        cur.iDom = j;
                        cur.iDomBlock = rpo.get(j);
                        rpo.get(j).domChildren.add(cur);
                        break;
                    }
                }
            }
        }

        // get Dominance Frontier
        for (BasicBlock bb : rpo) {
            if (bb.lastBlocks.size() > 1) {
                for (String la : bb.lastBlocks) {
                    BasicBlock runner = BasicBlocks.get(la);
                    while (runner != null && runner != bb.iDomBlock) {
                        runner.domFrontier.add(bb);
                        runner = runner.iDomBlock;
                    }
                }
            }
        }
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

    private void getPhiPos() {
        for (allocaInstr alloc : AllocInstr) {
            if (alloc.toReg) continue;

            HashSet<BasicBlock> workTable = getWorkTable(alloc.result);
            HashSet<BasicBlock> added = new HashSet<>();

            while (!workTable.isEmpty()) {
                BasicBlock cur = workTable.iterator().next();
                for (BasicBlock f : cur.domFrontier) {
                    if (!added.contains(f)) {
                        added.add(f);
                        workTable.add(f);
                    }
                    if (!f.phiMap.containsKey(alloc.result.getString())) {
                        phiInstr phi = new phiInstr();
                        phi.ori = alloc.result;
                        phi.result = null;
                        phi.type = alloc.type;
                        f.phiMap.put(alloc.result.getString(), phi);
                    }
                }
                workTable.remove(cur);
            }
        }
    }

    private HashSet<BasicBlock> getWorkTable(Reg reg) {
        // blocks including "store reg"
        HashSet<BasicBlock> work = new HashSet<>();
        for (BasicBlock bb : BasicBlocks.values()) {
            for (Instr instr : bb.Instrs) {
                if (instr instanceof storeInstr store) {
                    if (store.ptr.getString().equals(reg.getString())) {
                        work.add(bb);
                        break;
                    }
                }
            }
        }
        return work;
    }

    private void reNameVar(BasicBlock curBlock, HashMap<String, Stack<Expr>> curName, HashMap<String, Expr> lastDef) {
        HashMap<String, Integer> newNum = new HashMap<>();
        for (allocaInstr alloc : AllocInstr) {
            newNum.put(alloc.result.getString(), 0);
        }

        // phi
        for (String ori : curBlock.phiMap.keySet()) {
            phiInstr phi = curBlock.phiMap.get(ori);
            phi.result = new varReg(ori.substring(1) + ".phi." + rpo.indexOf(curBlock), -1, 0);
            curName.get(ori).push(phi.result);
            newNum.put(ori, newNum.get(ori) + 1);
        }

        reNameVarInBlock(curBlock, curName, lastDef, newNum);

        for (String sucStr : curBlock.nextBlocks) {
            BasicBlock suc = BasicBlocks.get(sucStr);
            setPhi(suc, curBlock, curName);
        }

        for (BasicBlock domChild : curBlock.domChildren) {
            reNameVar(domChild, curName, lastDef);
        }

        for (String var : newNum.keySet()) {
            for (int i = 0; i < newNum.get(var); i++)
                curName.get(var).pop();
        }
    }

    private Expr getReg(HashMap<String, Expr> lastDef, Expr val) {
        if (val instanceof Reg) {
            if (!lastDef.containsKey(val.getString())) return val;
            return lastDef.get(val.getString());
        }
        return val;
    }

    private void setPhi(BasicBlock curBlock, BasicBlock preBlock, HashMap<String, Stack<Expr>> curName) {
        for (String varStr : curBlock.phiMap.keySet()) {
            phiInstr phi = curBlock.phiMap.get(varStr);
            if (!curName.get(varStr).isEmpty()) {
                phi.addVal(curName.get(varStr).peek(), preBlock.Label.getLabel());
            }
            else {
                phi.addEmpty(preBlock.Label.getLabel());
            }
        }
    }

    private void reNameVarInBlock(BasicBlock curBlock, HashMap<String, Stack<Expr>> curName, HashMap<String, Expr> lastDef, HashMap<String, Integer> newNum) {
        ArrayList<Instr> newInstrs = new ArrayList<>();
        for (Instr instr : curBlock.Instrs) {
            if (instr instanceof storeInstr store) {
                if (!curName.containsKey(store.ptr.getString())) {
                    storeInstr newStore = new storeInstr();
                    newStore.type = store.type;
                    newStore.value = getReg(lastDef, store.value);
                    newStore.ptr = store.ptr;
                    newInstrs.add(newStore);
                }
                else {
                    curName.get(store.ptr.getString()).push(getReg(lastDef, store.value));
                    newNum.put(store.ptr.getString(), newNum.get(store.ptr.getString()) + 1);
                }
            }
            else if (instr instanceof loadInstr load) {
                if (!curName.containsKey(load.pointer.getString())) {
                    newInstrs.add(load);
                }
                else {
                    if (curName.get(load.pointer.getString()).isEmpty())
                        curName.get(load.pointer.getString()).add(new intCons(0));
                    lastDef.put(load.result.getString(), curName.get(load.pointer.getString()).peek());
                }
            }
            else if (instr instanceof binInstr bin) {
                binInstr newBin = new binInstr();
                newBin.result = bin.result;
                newBin.type = bin.type;
                newBin.op = bin.op;
                newBin.operand1 = getReg(lastDef, bin.operand1);
                newBin.operand2 = getReg(lastDef, bin.operand2);
                newInstrs.add(newBin);
            }
            else if (instr instanceof callInstr call) {
                callInstr newCall = new callInstr();
                newCall.result = call.result;
                newCall.returnType = call.returnType;
                newCall.className = call.className;
                newCall.methodName = call.methodName;
                for (int i = 0; i < call.paramExpr.size(); i++) {
                    newCall.paramTypes.add(call.paramTypes.get(i));
                    newCall.paramExpr.add(getReg(lastDef, call.paramExpr.get(i)));
                }
                newInstrs.add(newCall);
            }
            else if (instr instanceof getInstr get) {
                getInstr newGet = new getInstr();
                newGet.result = get.result;
                newGet.type = get.type;
                newGet.ptr = getReg(lastDef, get.ptr);
                newGet.idx = new ArrayList<>();
                for (Expr idx : get.idx) {
                    newGet.idx.add(getReg(lastDef, idx));
                }
                newInstrs.add(newGet);
            }
            else if (instr instanceof icmpInstr icmp) {
                icmpInstr newIcmp = new icmpInstr();
                newIcmp.result = icmp.result;
                newIcmp.type = icmp.type;
                newIcmp.cond = icmp.cond;
                newIcmp.op1 = getReg(lastDef, icmp.op1);
                newIcmp.op2 = getReg(lastDef, icmp.op2);
                newInstrs.add(newIcmp);
            }
            else if (instr instanceof selectInstr select) {
                selectInstr newSelect = new selectInstr();
                newSelect.result = select.result;
                newSelect.cond = getReg(lastDef, select.cond);
                newSelect.ty1 = select.ty1;
                newSelect.ty2 = select.ty2;
                newSelect.val1 = getReg(lastDef, select.val1);
                newSelect.val2 = getReg(lastDef, select.val2);
                newInstrs.add(newSelect);
            }
            else {
                throw new RuntimeException("[rename] wrong instr type in instrs");
            }
        }
        curBlock.Instrs = newInstrs;

        if (curBlock.Ctrl instanceof brInstr br) {
            brInstr newBr = new brInstr();
            if (br.cond != null) newBr.cond = getReg(lastDef, br.cond);
            newBr.destLabel = br.destLabel;
            newBr.trueLabel = br.trueLabel;
            newBr.falseLabel = br.falseLabel;
            curBlock.Ctrl = newBr;
        }
        else if (curBlock.Ctrl instanceof retInstr ret) {
            retInstr newRet = new retInstr();
            newRet.type = ret.type;
            newRet.value = getReg(lastDef, ret.value);
            curBlock.Ctrl = newRet;
        }
    }

    public void rmPhi() {

    }

    public void activeAnalysis() {
        AAInstr();

        ArrayList<BasicBlock> task = new ArrayList<>();
        for (int i = rpo.size() - 1; i >= 0; i--) {
            BasicBlock cur = rpo.get(i);
            if (cur.nextBlocks.isEmpty()) task.add(cur);
        }
        while (!task.isEmpty()) {
            BasicBlock curBlock = task.remove(0);

            HashSet<String> use = new HashSet<>();
            HashSet<String> def = new HashSet<>();
            HashSet<String> in_ = new HashSet<>();
            HashSet<String> out = new HashSet<>();
            // AA in Block
            int t = curBlock.Instrs.size();
            Instr curInstr = curBlock.Ctrl;
            out = curBlock.out;
            while (t >= 0) {
                if (t < curBlock.Instrs.size()) {
                    out = in_;
                }
                use = curInstr.use;
                def = curInstr.def;

                curInstr.out.clear();
                curInstr.out.addAll(out);

                out.removeAll(def);
                in_.addAll(use);
                in_.addAll(out);

                curInstr.in_.clear();
                curInstr.in_.addAll(in_);

                if (t > 0) curInstr = curBlock.Instrs.get(t - 1);
                t--;
            }

            // AA to lastBlock
            for (String lastStr : curBlock.lastBlocks) {
                BasicBlock last = BasicBlocks.get(lastStr);
                if (!last.out.containsAll(in_)) {
                    last.out.addAll(in_);
                    task.add(last);
                }
            }
        }

        // collect active periods
        for (int blockID = 0; blockID < rpo.size(); blockID++) {
            BasicBlock curBlock = rpo.get(blockID);
            for (int instrID = 0; instrID < curBlock.Instrs.size(); instrID++) {
                Instr instr = curBlock.Instrs.get(instrID);
                for (String reg : instr.out) {
                    if (!activePeriods.containsKey(reg)) {
                        ActivePeriod ap = new ActivePeriod();
                        ap.startBlock = blockID;
                        ap.startInstr = instrID;
                        activePeriods.put(reg, ap);
                    }
                }
            }
        }
        for (int blockID = rpo.size() - 1; blockID >= 0; blockID--) {
            BasicBlock curBlock = rpo.get(blockID);
            for (String reg : curBlock.out) {
                if (activePeriods.containsKey(reg)) {
                    ActivePeriod ap = activePeriods.get(reg);
                    ap.endBlock = blockID;
                    ap.endInstr = curBlock.Instrs.size();
                }
            }
            for (int instrID = curBlock.Instrs.size() - 1; instrID >= 0; instrID--) {
                Instr instr = curBlock.Instrs.get(instrID);
                for (String reg : instr.in_) {
                    if (activePeriods.containsKey(reg)) {
                        ActivePeriod ap = activePeriods.get(reg);
                        ap.endBlock = blockID;
                        ap.endInstr = instrID;
                    }
                }
            }
        }
    }

    public void AAInstr() {
        for (BasicBlock cur : rpo) {
            for (Instr instr : cur.Instrs) {
                if (instr instanceof binInstr bin) {
                    bin.def.add(bin.result.getString());
                    if (bin.operand1 instanceof Reg reg) bin.use.add(reg.getString());
                    if (bin.operand2 instanceof Reg reg) bin.use.add(reg.getString());
                }
                else if (instr instanceof callInstr call) {
                    call.def.add(call.result.getString());
                    for (Expr expr : call.paramExpr) {
                        if (expr instanceof Reg reg) call.use.add(reg.getString());
                    }
                }
                else if (instr instanceof getInstr get) {
                    get.def.add(get.result.getString());
                    if (get.ptr instanceof Reg reg) get.use.add(reg.getString());
                    for (Expr expr : get.idx) {
                        if (expr instanceof Reg reg) get.use.add(reg.getString());
                    }
                }
                else if (instr instanceof icmpInstr icmp) {
                    icmp.def.add(icmp.result.getString());
                    if (icmp.op1 instanceof Reg reg) icmp.use.add(reg.getString());
                    if (icmp.op2 instanceof Reg reg) icmp.use.add(reg.getString());
                }
                else if (instr instanceof selectInstr select) {
                    select.def.add(select.result.getString());
                    if (select.val1 instanceof Reg reg) select.use.add(reg.getString());
                    if (select.val2 instanceof Reg reg) select.use.add(reg.getString());
                }
                else if (instr instanceof loadInstr load) {
                    load.def.add(load.result.getString());
                    load.use.add(load.pointer.getString());
                }
                else if (instr instanceof storeInstr store) {
                    store.use.add(store.ptr.getString());
                    if (store.value instanceof Reg reg) store.use.add(reg.getString());
                }
                else {
                    throw new RuntimeException("[AA] wrong instr type in instrs");
                }
            }
            if (cur.Ctrl instanceof brInstr br) {
                if (br.cond instanceof Reg reg) br.use.add(reg.getString());
            }
            else if (cur.Ctrl instanceof retInstr ret) {
                if (ret.value instanceof Reg reg) ret.use.add(reg.getString());
            }
        }
    }
}
