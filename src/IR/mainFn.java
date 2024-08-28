package IR;

import IR.Instruction.*;

public class mainFn extends funcDef {
    public funcDef init;

    public mainFn() {
        callInstr c = new callInstr();
        c.methodName = ".init";
        instrs.add(c);
    }

    @Override
    public String getString() {
        StringBuilder s = new StringBuilder("define i32 @main() {\nentry:\n");
        for (Instr i : alloc) {
            s.append("  ").append(i.getString()).append("\n");
        }
        for (Instr i : instrs) {
            if (!(i instanceof label)) {
                s.append("  ");
            }
            s.append(i.getString()).append("\n");
        }
        if (!(instrs.get(instrs.size() - 1) instanceof brInstr) &&
                !(instrs.get(instrs.size() - 1) instanceof retInstr)) {
            s.append("ret i32 0\n");
        }
        s.append("}");
        return init.getString() + s;
    }
}
