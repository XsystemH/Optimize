package MIR;

import MIR.Instruction.retInstr;

public class Program extends block{
    public funcDef init;

    public Program() {
        init = new funcDef();
        init.name = "_init";
    }

    @Override
    public String getString() {
        init.instrs.add(new retInstr());
        return super.getString() + init.getString();
    }
}
