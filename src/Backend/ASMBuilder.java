package Backend;

import ASM.ASMInstr.*;
import ASM.operand.PhysicalReg;
import ASM.section.*;
import IR.Instruction.*;
import IR.Program;
import IR.funcDef;

import java.util.ArrayList;

public class ASMBuilder {
    public static final int regSize = 36;
    public IRBuilder irBuilder;
    public PhysicalReg physicalReg = new PhysicalReg();

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
            li.rd = "t0";
            li.val = imm;
            instrs.add(li);

            ArithInstr ar = new ArithInstr();
            ar.opType = op;
            ar.rd = rd;
            ar.rs1 = rs;
            ar.rs2 = "t0";
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

        }
        else if (instr instanceof binInstr bin) {

        }
        else if (instr instanceof brInstr br) {

        }
        else if (instr instanceof callInstr call) {

        }
        else if (instr instanceof getInstr get) {

        }
        else if (instr instanceof icmpInstr icmp) {

        }
        else if (instr instanceof loadInstr load) {

        }
        else if (instr instanceof retInstr ret) {

        }
        else if (instr instanceof selectInstr select) {

        }
        else if (instr instanceof storeInstr store) {

        }
    }

    public void visitAlloc(allocaInstr alloc, ASMFunction func) {

    }

    public void visitBin(binInstr bin, ASMFunction func) {

    }

    public void visitBr(brInstr br, ASMFunction func) {

    }

    public void visitCall(callInstr call, ASMFunction func) {

    }

    public void visitGet(getInstr get, ASMFunction func) {

    }

    public void visitIcmp(icmpInstr icmp, ASMFunction func) {

    }

    public void visitLoad(loadInstr load, ASMFunction func) {

    }

    public void visitRet(retInstr ret, ASMFunction func) {

    }

    public void visitSelect(selectInstr select, ASMFunction func) {

    }

    public void visitStore(storeInstr store, ASMFunction func) {

    }
}