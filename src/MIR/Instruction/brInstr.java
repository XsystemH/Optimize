package MIR.Instruction;

import MIR.Expression.Expr;

public class brInstr extends Instr{
    public Expr cond = null;
    public label trueLabel;
    public label falseLabel;
    public label destLabel;

    @Override
    public String getString() {
        if (cond != null) {
            return "br i1 " + cond.getString() + ", label " + trueLabel.getString() + ", label " + falseLabel.getString();
        }
        else {
            return "br label %label_" + destLabel;
        }
    }
}
