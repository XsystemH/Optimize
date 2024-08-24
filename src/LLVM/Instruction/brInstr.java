package LLVM.Instruction;

import LLVM.Expression.Register.Reg;

public class brInstr extends Instr{
    public Reg cond = null;
    public int trueLabel;
    public int falseLabel;
    public int destLabel;

    @Override
    public String getString() {
        if (cond != null) {
            return "br i1 " + cond.getString() + ", label %label_" + trueLabel + ", label %label" + falseLabel;
        }
        else {
            return "br label %label_" + destLabel;
        }
    }
}
