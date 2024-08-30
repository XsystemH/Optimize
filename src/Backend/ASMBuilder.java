package Backend;

import ASM.ASMInstr.*;
import ASM.section.*;
import IR.Expression.Constant.Cons;
import IR.Expression.Expr;
import IR.Expression.Register.Reg;
import IR.Instruction.*;
import IR.Program;
import IR.funcDef;

import java.util.ArrayList;

public class ASMBuilder {
    public static final int regSize = 36;
    public IRBuilder irBuilder;

    public TextSection textSection = new TextSection();
    public DataSection dataSection = new DataSection();
    public RodataSection roDataSection = new RodataSection();

    public int funcNum = 0;

    public ASMBuilder(IRBuilder ir) {
        irBuilder = ir;
    }

    boolean outOfBound(int imm) {
        return imm < -2048 || imm > 2047;
    }

    public int getSpSize(funcDef func){
        int size = func.params.size();
        for (Instr instr : func.instrs) {
            size += instr.getSpSize();
        }
        return size * 4;
    }

    public ArrayList<ASMInstr> Imm(String op, String rd, String rs, int imm) {
        ArrayList<ASMInstr> instrs = new ArrayList<>();
        if (outOfBound(imm)) {
            LiInstr li = new LiInstr();
            li.rd = "t6";
            li.val = imm;
            instrs.add(li);

            ArithInstr ar = new ArithInstr();
            ar.opType = op;
            ar.rd = rd;
            ar.rs1 = rs;
            ar.rs2 = "t6";
            instrs.add(ar);

            return instrs;
        }
        ImmInstr im = new ImmInstr();
        im.opType = op;
        im.rd = rd;
        im.rs = rs;
        im.imm = imm;
        instrs.add(im);

        return instrs;
    }

    public ArrayList<ASMInstr> Sw(String src, int offset, String rd) {
        ArrayList<ASMInstr> instrs = new ArrayList<>();
        if (outOfBound(offset)) {
            LiInstr li = new LiInstr();
            li.rd = "t6";
            li.val = offset;
            instrs.add(li);

            ArithInstr ar = new ArithInstr();
            ar.opType = "add";
            ar.rd = "t6";
            ar.rs1 = rd;
            ar.rs2 = "t6";
            instrs.add(ar);

            SwInstr sw = new SwInstr();
            sw.src = src;
            sw.offset = 0;
            sw.dest = rd;
            instrs.add(sw);

            return instrs;
        }
        SwInstr sw = new SwInstr();
        sw.src = src;
        sw.offset = offset;
        sw.dest = rd;
        instrs.add(sw);
        return instrs;
    }

    public ArrayList<ASMInstr> Lw(String rd, int offset, String rs) {
        ArrayList<ASMInstr> instrs = new ArrayList<>();
        if (outOfBound(offset)) {
            LiInstr li = new LiInstr();
            li.rd = "t6";
            li.val = offset;
            instrs.add(li);

            ArithInstr ar = new ArithInstr();
            ar.opType = "add";
            ar.rd = "t6";
            ar.rs1 = rs;
            ar.rs2 = "t6";
            instrs.add(ar);

            LwInstr lw = new LwInstr();
            lw.dest = rd;
            lw.offset = 0;
            lw.base = "t6";
            instrs.add(lw);
            return instrs;
        }
        LwInstr lw = new LwInstr();
        lw.dest = rd;
        lw.offset = offset;
        lw.base = rs;
        instrs.add(lw);
        return instrs;
    }

    public void visitProgram(Program program) {
        buildStringCons();
        buildGlobalVars();
        for (Instr irInstr : irBuilder.program.instrs) {
            if (irInstr instanceof funcDef func) {
                funcNum++;
                buildFunction(func);
            }
        }
    }

    public void buildStringCons() {
        for (Instr irInstr : irBuilder.program.instrs) {
            if (irInstr instanceof preStrInstr preStr) {
                String str = (preStr.str); // todo irStr2RiscV
                String label = preStr.reg.getString().substring(1);
                roDataSection.addStr(str, label);
            }
        }
    }

    public void buildGlobalVars(){
        for (Instr irInstr : irBuilder.program.instrs) {
            if (irInstr instanceof globalInstr global) {
                String varName = global.result.getString().substring(1);
                dataSection.addGlobalVar("0", varName);
            }
        }
    }

    public void buildFunction(funcDef irFunc) {
        ASMFunction func = new ASMFunction();
        func.name = irFunc.name;
        int size = getSpSize(irFunc) + regSize;
        func.spOffset = (size / 16 + (size%16==0 ? 0 : 1)) * 16;
        func.curOffset = 0;

        ASMBlock block = new ASMBlock();
        block.label = irFunc.name;
        block.isGlobal = true;
        block.alignSize = 2;
        block.parent = func;
        func.curBlock = block;
        func.blocks.add(block);

        func.idxNum = funcNum;
        func.head = "B" + funcNum + ".";
        func.curBlock.instrs.addAll(Imm("add", "sp", "sp", -func.spOffset));
        func.curBlock.instrs.addAll(Sw("ra", func.alloc(4), "sp"));

        for (int i = 0; i < irFunc.params.size(); i++) {
            if (i < 8) {
                int offset = func.alloc(4);
                func.curBlock.instrs.addAll(Sw("a" + i, offset, "sp"));
                func.putVirtualReg("%" + irFunc.params.get(i), offset);
            }
            else {
                func.putVirtualReg("%" + irFunc.params.get(i), func.spOffset + (i - 8) * 4);
            }
        }

        boolean flag = true;
        for (Instr irInstr : irFunc.instrs) {
            if (flag) flag = false;
            else if (irInstr instanceof label la) {
                func.newBlock(func.head + la.info);
                continue;
            }
            visitIRInstr(irInstr, func);
        }
        textSection.functions.add(func);
    }

    void visitIRInstr(Instr instr, ASMFunction func) {
        if (instr instanceof allocaInstr alloc) {
            visitAlloc(alloc, func);
        }
        else if (instr instanceof binInstr bin) {
            visitBin(bin, func);
        }
        else if (instr instanceof brInstr br) {
            visitBr(br, func);
        }
        else if (instr instanceof callInstr call) {
            visitCall(call, func);
        }
        else if (instr instanceof getInstr get) {
            visitGet(get, func);
        }
        else if (instr instanceof icmpInstr icmp) {
            visitIcmp(icmp, func);
        }
        else if (instr instanceof loadInstr load) {
            visitLoad(load, func);
        }
        else if (instr instanceof retInstr ret) {
            visitRet(ret, func);
        }
        else if (instr instanceof selectInstr select) {
            visitSelect(select, func);
        }
        else if (instr instanceof storeInstr store) {
            visitStore(store, func);
        }
    }

    public void visitAlloc(allocaInstr alloc, ASMFunction func) {
        int regOffset = func.alloc(4);
        func.putVirtualReg(alloc.result.getString(), regOffset);
        int offset = func.alloc(4);
        func.curBlock.instrs.addAll(Imm("add", "t5", "sp", offset));
        func.curBlock.instrs.addAll(Sw("t5", regOffset, "sp"));
    }

    void getReg(Expr expr, String dest, ASMFunction func) {
        if (expr instanceof Reg reg) {
            String regName = reg.getString();
            if (regName.startsWith("%")) {
                int offset = func.getVirtualReg(regName);
                func.curBlock.instrs.addAll(Lw(dest, offset, "sp"));
            }
            else if (regName.startsWith("@")) {
                LaInstr la = new LaInstr();
                la.rd = dest;
                la.label = regName.substring(1);
                func.curBlock.instrs.add(la);
            }
            else throw new RuntimeException("wrong var begin");
        }
        else if (expr instanceof Cons cons) {
            int val;
            String str = cons.getString();
            if (str.equals("true")) val = 1;
            else if (str.equals("false")) val = 0;
            else if (str.equals("null")) val = 0;
            else val = Integer.parseInt(str);
            LiInstr li = new LiInstr();
            li.rd = dest;
            li.val = val;
            func.curBlock.instrs.add(li);
        }
    }

    public void visitBin(binInstr bin, ASMFunction func) {
        getReg(bin.operand1, "t1", func);
        getReg(bin.operand2, "t2", func);
        ArithInstr ar = new ArithInstr();
        switch (bin.op) {
            case add -> ar.opType = "add";
            case sub -> ar.opType = "sub";
            case mul -> ar.opType = "mul";
            case sdiv -> ar.opType = "div";
            case srem -> ar.opType = "rem";
            case shl -> ar.opType = "sll";
            case ashr -> ar.opType = "sra";
            case and -> ar.opType = "and";
            case or -> ar.opType = "or";
            case xor -> ar.opType = "xor";
        }
        ar.rd = "t0";
        ar.rs1 = "t1";
        ar.rs2 = "t2";
        func.curBlock.instrs.add(ar);
        int offset = func.getVirtualReg(bin.result.getString());
        func.curBlock.instrs.addAll(Sw("t0", offset, "sp"));
    }

    public void visitBr(brInstr br, ASMFunction func) {
        if (br.cond == null) {
            JInstr j = new JInstr();
            j.label = func.head + br.destLabel.getString();
            func.curBlock.instrs.add(j);
            return;
        }
        getReg(br.cond, "t0", func);
        BranchInstr bi = new BranchInstr();
        bi.op = "bnez";
        bi.rs1 = "t0";
        bi.label = func.head + br.trueLabel.getString();
        func.curBlock.instrs.add(bi);
        JInstr j = new JInstr();
        j.label = func.head + br.falseLabel.getString();
        func.curBlock.instrs.add(j);
    }

    public void visitCall(callInstr call, ASMFunction func) {
        int extra = 0;
        if (call.paramExpr.size() > 8) {
            extra =( call.paramExpr.size() - 8) * 4;
        }
        int curOffset = 0;
        if (extra > 0) {
            func.curBlock.instrs.addAll(Imm("add", "sp", "sp", -extra));
        }
        for (int i = 0; i < call.paramExpr.size(); i++) {
            if (i < 8) {
                getReg(call.paramExpr.get(i), "a" + i, func);
            }
            else {
                getReg(call.paramExpr.get(i), "t0", func);
                func.curBlock.instrs.addAll(Sw("t0", curOffset, "sp"));
                curOffset += 4;
            }
        }

        CallInstr ca = new CallInstr();
        if (call.className != null)
            ca.func = call.className + ".." + call.methodName;
        else ca.func = call.methodName;
        func.curBlock.instrs.add(ca);

        if (extra > 0)
            func.curBlock.instrs.addAll(Imm("add", "sp", "sp", extra));
        if (call.returnType != null) {
            int offset = func.getVirtualReg(call.result.getString());
            func.curBlock.instrs.addAll(Sw("a0", offset, "sp"));
        }
    }

    public void visitGet(getInstr get, ASMFunction func) {
        getReg(get.ptr, "t0", func);
        if (get.idx.size() > 1) {
            getReg(get.idx.get(1), "t1", func);
        }
        else getReg(get.idx.get(0), "t1", func);
        func.curBlock.instrs.addAll(Imm("sll", "t1", "t1", 2));
        ArithInstr ar = new ArithInstr();
        ar.rd = "t2";
        ar.opType = "add";
        ar.rs1 = "t0";
        ar.rs2 = "t1";
        func.curBlock.instrs.add(ar);
        func.curBlock.instrs.addAll(Sw("t2", func.getVirtualReg(get.result.getString()), "sp"));
    }

    public void visitIcmp(icmpInstr icmp, ASMFunction func) {
        getReg(icmp.op1, "t1", func);
        getReg(icmp.op2, "t2", func);
        switch (icmp.cond) {
            case eq -> {
                ArithInstr ar1 = new ArithInstr();
                ar1.opType = "xor";
                ar1.rd = "t3";
                ar1.rs1 = "t1";
                ar1.rs2 = "t2";
                func.curBlock.instrs.add(ar1);
                ImmInstr ar2 = new ImmInstr();
                ar2.opType = "sltu";
                ar2.rd = "t0";
                ar2.rs = "t3";
                ar2.imm = 1;
                func.curBlock.instrs.add(ar2);
            }
            case ne -> {
                ArithInstr ar1 = new ArithInstr();
                ar1.opType = "xor";
                ar1.rd = "t3";
                ar1.rs1 = "t1";
                ar1.rs2 = "t2";
                func.curBlock.instrs.add(ar1);
                ImmInstr ar2 = new ImmInstr();
                ar2.opType = "sltu";
                ar2.rd = "t3";
                ar2.rs = "t3";
                ar2.imm = 1;
                func.curBlock.instrs.add(ar2);
                ImmInstr ar3 = new ImmInstr();
                ar3.opType = "xor";
                ar3.rd = "t0";
                ar3.rs = "t3";
                ar3.imm = 1;
                func.curBlock.instrs.add(ar3);
            }
            case sgt -> {
                ArithInstr ar1 = new ArithInstr();
                ar1.opType = "slt";
                ar1.rd = "t0";
                ar1.rs1 = "t1";
                ar1.rs2 = "t2";
                func.curBlock.instrs.add(ar1);
            }
            case sge -> {
                ArithInstr ar1 = new ArithInstr();
                ar1.opType = "slt";
                ar1.rd = "t0";
                ar1.rs1 = "t2";
                ar1.rs2 = "t1";
                func.curBlock.instrs.add(ar1);
                ImmInstr ar2 = new ImmInstr();
                ar2.opType = "xor";
                ar2.rd = "t0";
                ar2.rs = "t0";
                ar2.imm = 1;
                func.curBlock.instrs.add(ar2);
            }
            case slt -> {
                ArithInstr ar1 = new ArithInstr();
                ar1.opType = "slt";
                ar1.rd = "t0";
                ar1.rs1 = "t2";
                ar1.rs2 = "t1";
                func.curBlock.instrs.add(ar1);
            }
            case sle -> {
                ArithInstr ar1 = new ArithInstr();
                ar1.opType = "slt";
                ar1.rd = "t0";
                ar1.rs1 = "t1";
                ar1.rs2 = "t2";
                func.curBlock.instrs.add(ar1);
                ImmInstr ar2 = new ImmInstr();
                ar2.opType = "slt";
                ar2.rd = "t0";
                ar2.rs = "t0";
                ar2.imm = 1;
                func.curBlock.instrs.add(ar2);
            }
        }
        int offset = func.getVirtualReg(icmp.result.getString());
        func.curBlock.instrs.addAll(Sw("t0", offset, "sp"));
    }

    public void visitLoad(loadInstr load, ASMFunction func) {
        getReg(load.pointer, "t0", func);
        LwInstr lw = new LwInstr();
        lw.dest = "t1";
        lw.offset = 0;
        lw.base = "t0";
        func.curBlock.instrs.add(lw);
        int offset = func.getVirtualReg(load.pointer.getString());
        func.curBlock.instrs.addAll(Sw("t1", offset, "sp"));
    }

    public void visitRet(retInstr ret, ASMFunction func) {
        if (ret.type != null) {
            getReg(ret.value, "a0", func);
        }
        func.curBlock.instrs.addAll(Lw("ra", 0, "sp"));
        ImmInstr imm = new ImmInstr();
        imm.opType = "add";
        imm.rd = "sp";
        imm.rs = "sp";
        imm.imm = func.spOffset;
        func.curBlock.instrs.add(imm);
        Directive r = new Directive();
        r.dir = "ret";
        func.curBlock.instrs.add(r);
    }

    public void visitSelect(selectInstr select, ASMFunction func) {
        getReg(select.cond, "t0", func);
        getReg(select.val1, "t1", func);
        getReg(select.val2, "t2", func);
        // from gpt
        ArithInstr ar1 = new ArithInstr();
        ar1.opType = "sltu";
        ar1.rd = "t3";
        ar1.rs1 = "x0";
        ar1.rs2 = "t0"; // t0 = 1 then > x0
        func.curBlock.instrs.add(ar1);
        UnaryInstr un1 = new UnaryInstr();
        un1.op = "neg";
        un1.rd = "t3";
        un1.rs = "t3";
        func.curBlock.instrs.add(un1); // all 0 or all 1
        ArithInstr ar2 = new ArithInstr();
        ar2.opType = "and";
        ar2.rd = "t4";
        ar2.rs1 = "t1";
        ar2.rs2 = "t3";
        func.curBlock.instrs.add(ar2);
        UnaryInstr un2 = new UnaryInstr();
        un2.op = "not";
        un2.rd = "t3";
        un2.rs = "t3";
        func.curBlock.instrs.add(un2);
        ArithInstr ar3 = new ArithInstr();
        ar3.opType = "and";
        ar3.rd = "t5";
        ar3.rs1 = "t2";
        ar3.rs2 = "t3";
        func.curBlock.instrs.add(ar3);
        ArithInstr ar4 = new ArithInstr();
        ar4.opType = "or";
        ar4.rd = "t3";
        ar4.rs1 = "t4";
        ar4.rs2 = "t5";
        func.curBlock.instrs.add(ar4);

        int offset = func.getVirtualReg(select.result.getString());
        func.curBlock.instrs.addAll(Sw("t3", offset, "sp"));
    }

    public void visitStore(storeInstr store, ASMFunction func) {
        getReg(store.value, "t0", func);
        getReg(store.ptr, "t1", func);
        func.curBlock.instrs.addAll(Sw("t0", 0, "t1"));
    }

    public String getString() {
        return textSection.getString() +
                dataSection.getString() +
                roDataSection.getString();
    }
}