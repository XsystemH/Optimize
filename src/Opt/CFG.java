package Opt;

import IR.Expression.Constant.intCons;
import IR.Expression.Expr;
import IR.Expression.Register.Reg;
import IR.Expression.Register.varReg;
import IR.Instruction.*;
import IR.funcDef;

import java.util.*;

public class CFG {
    private funcDef IRFunc;
    public HashMap<String, BasicBlock> BasicBlocks;
    public BasicBlock Entry;
    public ArrayList<BasicBlock> Exit;
    public ArrayList<allocaInstr> AllocInstr;

    public ArrayList<BasicBlock> rpo;
    public ArrayList<Instr> rpoInstr;

    public HashMap<String, ActivePeriod> activePeriods;
    public ArrayList<String> sortedAP;
    public HashMap<String, Integer> reg_map = new HashMap<>();
    public int varNum = 0;
    public int succeedNum = 0;

    public CFG(funcDef func) {
        IRFunc = func;
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
                alloc.isRemoved = true;
                for (Instr def : alloc.defs) {
                    def.isRemoved = true;
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
            if (alloc.isRemoved) continue;

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
        // new rpo&blockMap needed if did any opt on blocks
        for (BasicBlock curBlock : rpo) {
            if (!curBlock.phiMap.isEmpty()) {
                for (int i = 0; i < curBlock.lastBlocks.size(); i++) {
                    HashMap<Reg, Expr> moveMap = new HashMap<>();
                    for (phiInstr phi : curBlock.phiMap.values()) {
                        if (phi.isRemoved) continue;
                        moveMap.put(phi.result, phi.vals.get(i));
                    }
                    DAPHI daphi = new DAPHI(moveMap);
                    BasicBlock lastBlock = BasicBlocks.get(curBlock.phiMap.values().iterator().next().blocks.get(i));
                    lastBlock.Instrs.addAll(daphi.getInstrs());
                }
            }
        }
//        for (BasicBlock curBlock : rpo) {
//            for (phiInstr phi : curBlock.phiMap.values()) {
//                for (int i = 0; i < phi.blocks.size(); i++) {
//                    String la = phi.blocks.get(i);
//                    BasicBlock laBlock = BasicBlocks.get(la);
//                    moveInstr move = new moveInstr();
//                    move.dest = new varReg(phi.result.getString().substring(1) + ".tmp", -1, 0);
//                    move.val = phi.vals.get(i);
//                    laBlock.Instrs.add(move);
//                }
//                moveInstr move = new moveInstr();
//                move.dest = phi.result;
//                move.val = new varReg(phi.result.getString().substring(1) + ".tmp", -1, 0);
//                curBlock.Instrs.add(0, move);
//            }
//        }
    }

    public void DCE() {
        HashSet<String> Regs = new HashSet<>();
        HashMap<String, HashSet<Instr>> useMap = new HashMap<>();
        HashMap<String, Instr> defMap = new HashMap<>();
        HashSet<String> args = new HashSet<>(IRFunc.params);

        ArrayList<Instr> instrs = AAInstr();

        for (Instr instr : instrs) {
            Regs.addAll(instr.use);
            Regs.addAll(instr.def);

            for (String reg : instr.use) {
                if (!useMap.containsKey(reg)) {
                    HashSet<Instr> instrSet = new HashSet<>();
                    instrSet.add(instr);
                    useMap.put(reg, instrSet);
                }
                else {
                    HashSet<Instr> instrSet = useMap.get(reg);
                    instrSet.add(instr);
                }
            }
            for (String reg : instr.def) {
                if (!defMap.containsKey(reg)) {
                    defMap.put(reg, instr);
                }
            }
        }

        Regs.removeAll(args);

        while (!Regs.isEmpty()) {
            String reg = Regs.iterator().next();
            Regs.remove(reg);
            if (useMap.containsKey(reg) && useMap.get(reg).isEmpty()) {
                Instr S = defMap.get(reg);
                if (S.def.size() == 1) {
                    S.isRemoved = true;
                    for (String useReg : S.use) {
                        if (useMap.containsKey(useReg)) {
                            useMap.get(useReg).remove(S);
                            Regs.add(useReg);
                        }
                    }
                }
            }
        }
    }

    public void ADCE() {
        HashSet<String> liveUses = new HashSet<>();
        HashSet<Instr> workList = new HashSet<>();
        HashMap<String, Instr> defMap = new HashMap<>();
        HashSet<String> liveBlocks = new HashSet<>();
        HashSet<Instr> liveInstrs = new HashSet<>();

        AAInstr();

        for (BasicBlock curBlock : rpo) {
            for (phiInstr phi : curBlock.phiMap.values()) {
                phi.parent = curBlock.Label.getLabel();
                defMap.put(phi.result.getString(), phi);
                for (Expr val : phi.vals) {
                    if (val instanceof Reg)
                        phi.use.add(val.getString());
                }
            }
            for (Instr instr : curBlock.Instrs) {
                instr.parent = curBlock.Label.getLabel();
                if (instr.def.size() == 1) {
                    defMap.put(instr.def.iterator().next(), instr);
                }
                if (instr instanceof storeInstr) workList.add(instr);
                if (instr instanceof callInstr) workList.add(instr);
            }
            curBlock.Ctrl.parent = curBlock.Label.getLabel();
            if (curBlock.Ctrl instanceof retInstr ret) workList.add(ret);
        }

        while (!workList.isEmpty()) {
            Instr instr = workList.iterator().next();
            workList.remove(instr);
            liveInstrs.add(instr);
            liveBlocks.add(instr.parent);
            liveUses.addAll(instr.use);

            if (instr instanceof phiInstr phi) {
                for (String last : phi.blocks) {
                    BasicBlock lastBlock = BasicBlocks.get(last);
                    if (lastBlock.Ctrl != null && !liveInstrs.contains(lastBlock.Ctrl)) {
                        workList.add(lastBlock.Ctrl);
                        liveBlocks.add(last);
                    }
                }
            }
            BasicBlock curBlock = BasicBlocks.get(instr.parent);
            for (String last : curBlock.lastBlocks) {
                BasicBlock lastBlock = BasicBlocks.get(last);
                if (lastBlock.Ctrl != null && !liveInstrs.contains(lastBlock.Ctrl)) {
                    workList.add(lastBlock.Ctrl);
                }
            }
            for (String use : instr.use) {
                if (use.startsWith("@")) continue;
                if (IRFunc.params.contains(use)) continue;
                Instr def = defMap.get(use);
                if (def != null && !liveInstrs.contains(def)) {
                    workList.add(def);
                }
            }
        }

        for (BasicBlock curBlock : rpo) {
            for (phiInstr phi : curBlock.phiMap.values()) {
                if (!liveInstrs.contains(phi)) phi.isRemoved = true;
            }
            for (Instr instr : curBlock.Instrs) {
                if (!liveInstrs.contains(instr)) instr.isRemoved = true;
            }
        }
    }

    private void getShortCut(Instr instr, label farWay, label shortCut) {
        if (instr instanceof brInstr br) {
            if (br.cond == null) br.destLabel = shortCut;
            else {
                if (Objects.equals(br.trueLabel.getLabel(), farWay.getLabel()))
                    br.trueLabel = shortCut;
                if (Objects.equals(br.falseLabel.getLabel(), farWay.getLabel()))
                    br.falseLabel = shortCut;
            }
        }
        else throw new RuntimeException("wrong Ctrl instr");
    }

    public void rmEmpty() {
        rpo = getRPO(Entry);
        for (BasicBlock curBlock : rpo) {
            int i = 0;
            for (Instr instr : curBlock.Instrs) if (!instr.isRemoved) i++;
            if (i == 0 && curBlock.Ctrl instanceof brInstr br) {
                if (br.cond == null) {
                    BasicBlock nextBlock = BasicBlocks.get(br.destLabel.getLabel());
                    nextBlock.lastBlocks.remove(curBlock.Label.getLabel());
                    for (String last : curBlock.lastBlocks) {
                        BasicBlock lastBlock = BasicBlocks.get(last);
                        getShortCut(lastBlock.Ctrl, curBlock.Label, br.destLabel);
                        lastBlock.nextBlocks.remove(curBlock.Label.getLabel());
                        lastBlock.nextBlocks.add(br.destLabel.getLabel());
                        nextBlock.lastBlocks.add(last);
                    }
                    BasicBlocks.remove(curBlock.Label.getLabel());
                }
            }
        }
        rpo = getRPO(Entry);
    }

    private HashMap<String, Integer> BlockID;

    public void activeAnalysis() {
        rpoInstr = AAInstr();

        boolean changeFlag = true;
        while (changeFlag) {
            changeFlag = false;
            for (int i = rpoInstr.size() - 1; i >= 0; i--) {
                Instr instr = rpoInstr.get(i);
                HashSet<String> newIn_ = new HashSet<>();
                HashSet<String> newOut = new HashSet<>();
                if (instr instanceof brInstr br) {
                    if (br.cond != null) {
                        int suc1 = BlockID.get(br.trueLabel.getLabel());
                        int suc2 = BlockID.get(br.falseLabel.getLabel());
                        newOut.addAll(rpoInstr.get(suc1).in_);
                        newOut.addAll(rpoInstr.get(suc2).in_);
                    }
                    else {
                        int suc = BlockID.get(br.destLabel.getLabel());
                        newOut.addAll(rpoInstr.get(suc).in_);
                    }
                }
                else if (instr instanceof retInstr ret) {

                }
                else if (i + 1 < rpoInstr.size()) {
                    newOut.addAll(rpoInstr.get(i + 1).in_);
                }
                newIn_.addAll(newOut);
                newIn_.removeAll(instr.def);
                newIn_.addAll(instr.use);

                if (!newIn_.equals(instr.in_) || !newOut.equals(instr.out)) {
                    changeFlag = true;
                    instr.in_ = newIn_;
                    instr.out = newOut;
                }
            }
        }

        // collect active periods
        activePeriods = new HashMap<>();
        for (int i = 0; i < rpoInstr.size(); i++) {
            Instr instr = rpoInstr.get(i);
            if (i == 0) for (String reg : instr.in_) {
                if (!activePeriods.containsKey(reg)) {
                    if (reg.startsWith("@")) continue;
                    boolean isArg = false;
                    for (String arg : IRFunc.params) {
                        if (arg.equals(reg.substring(1))) {
                            isArg = true;
                            break;
                        }
                    }
                    if (!isArg) varNum++;
                    ActivePeriod ap = new ActivePeriod();
                    ap.l = -1;
                    ap.r = 0;
                    activePeriods.put(reg, ap);
                }
                else {
                    ActivePeriod ap = activePeriods.get(reg);
                    ap.r = i;
                }
            }
            for (String reg : instr.out) {
                if (!activePeriods.containsKey(reg)) {
                    if (reg.startsWith("@")) continue;
                    boolean isArg = false;
                    for (String arg : IRFunc.params) {
                        if (arg.equals(reg.substring(1))) {
                            isArg = true;
                            break;
                        }
                    }
                    if (!isArg) varNum++;
                    ActivePeriod ap = new ActivePeriod();
                    ap.l = i;
                    if (isArg) ap.l = -1;
                    ap.r = i + 1;
                    activePeriods.put(reg, ap);
                }
                else {
                    ActivePeriod ap = activePeriods.get(reg);
                    ap.r = i + 1;
                }
            }
        }

        HashMap<String, ActivePeriod> tasks = new HashMap<>();
        // sort
        for (String reg : activePeriods.keySet()) {
            ActivePeriod ap = activePeriods.get(reg);
            tasks.put(reg, ap);
        }
        sortedAP = new ArrayList<>();
        while (!tasks.isEmpty()) {
            String curStr = tasks.keySet().iterator().next();
            ActivePeriod curAP = tasks.get(curStr);
            for (String apStr : tasks.keySet()) {
                ActivePeriod ap = tasks.get(apStr);
                if (curAP.l != ap.l) {
                    if (ap.l < curAP.l) {
                        curAP = ap;
                        curStr = apStr;
                    }
                }
                else if (ap.r < curAP.r) {
                    curAP = ap;
                    curStr = apStr;
                }
            }
            sortedAP.add(curStr);
            tasks.remove(curStr);
        }
    }

    public ArrayList<Instr> AAInstr() {
        BlockID = new HashMap<>();
        ArrayList<Instr> instrs = new ArrayList<>();
        for (BasicBlock cur : rpo) {
            BlockID.put(cur.Label.getLabel(), instrs.size());
            for (Instr instr : cur.Instrs) {
                if (instr.isRemoved) continue;
                instr.ID = instrs.size();
                instrs.add(instr);
                if (instr instanceof binInstr bin) {
                    bin.def.add(bin.result.getString());
                    if (bin.operand1 instanceof Reg reg) bin.use.add(reg.getString());
                    if (bin.operand2 instanceof Reg reg) bin.use.add(reg.getString());
                }
                else if (instr instanceof callInstr call) {
                    if (call.result != null) call.def.add(call.result.getString());
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
                else if (instr instanceof moveInstr move) {
                    move.def.add(move.dest.getString());
                    if (move.val instanceof Reg reg) move.use.add(reg.getString());
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
            instrs.add(cur.Ctrl);
        }
        return instrs;
    }

    private BitSet free_regs = new BitSet(22);
    private HashSet<String> occupied = new HashSet<>();

    private void eviction(int l) {
        HashSet<String> rmList = new HashSet<>();
        for (String intervalStr : occupied) {
            ActivePeriod ap = activePeriods.get(intervalStr);
            if (ap.endBefore(l)) {
                int regID = reg_map.get(intervalStr);
                free_regs.set(regID);
                rmList.add(intervalStr);
            }
        }
        occupied.removeAll(rmList);
    }

    private String get_furthest() {
        String cur = reg_map.keySet().iterator().next();
        ActivePeriod curAP = activePeriods.get(cur);
        for (String str : occupied) {
            ActivePeriod ap = activePeriods.get(str);
            if (ap.endAfter(curAP)) {
                curAP = ap;
                cur = str;
            }
        }
        return cur;
    }

    private void try_spill(String apStr) {
        String furthestStr = get_furthest();
        ActivePeriod furAP = activePeriods.get(furthestStr);
        ActivePeriod curAP = activePeriods.get(apStr);
        if (furAP.r > curAP.r) {
            int regID = reg_map.get(furthestStr);
            // spill furthest
            occupied.remove(furthestStr);
            occupied.add(apStr);
            reg_map.remove(furthestStr);
            reg_map.put(apStr, regID);
        }
    }

    public void linear_scan() {
        activeAnalysis();
        free_regs.set(0, 22);

        for (String apStr : sortedAP) {
            ActivePeriod ap = activePeriods.get(apStr);
            int l = ap.l;
            eviction(l);
            if (free_regs.isEmpty()) {
                try_spill(apStr);
            }
            else {
                int reg = free_regs.nextSetBit(0);
                free_regs.clear(reg);
                occupied.add(apStr);
                reg_map.put(apStr, reg);
                if (!IRFunc.params.contains(apStr.substring(1)))
                    succeedNum++;
            }
        }

        for (String apStr : sortedAP) {
            ActivePeriod ap = activePeriods.get(apStr);
            if (reg_map.containsKey(apStr)) {
                for (int i = ap.l + 1; i <= ap.r; i++) {
                    if (i == rpoInstr.size()) continue;
                    Instr instr = rpoInstr.get(i);
                    if (instr instanceof callInstr call) {
                        call.occupied.set(reg_map.get(apStr));
                    }
                }
            }
        }
    }
}
