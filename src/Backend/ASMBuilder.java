package Backend;

import ASM.operand.PhysicalReg;
import ASM.section.DataSection;
import ASM.section.RodataSection;
import ASM.section.TextSection;
import IR.Instruction.Instr;
import IR.Instruction.allocaInstr;
import IR.Instruction.globalInstr;
import IR.Instruction.preStrInstr;

public class ASMBuilder {
    public static final int regSize = 36;
    public IRBuilder irBuilder;
    public PhysicalReg physicalReg = new PhysicalReg();

    public TextSection textSection = new TextSection();
    public DataSection dataSection = new DataSection();
    public RodataSection roDataSection = new RodataSection();

    public int funcNum = 0;

    boolean outOfBound(int imm) {
        return imm < -2048 || imm > 2047;
    }

    public ASMBuilder(IRBuilder ir) {
        irBuilder = ir;
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

    public void buildFunctions() {

    }
}
