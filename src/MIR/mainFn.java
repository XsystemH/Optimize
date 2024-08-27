package MIR;

import MIR.Instruction.Instr;
import MIR.Instruction.label;

import java.util.HashSet;
import java.util.Set;

public class mainFn extends block {
    public mainFn() {}

    @Override
    public String getString() {
        StringBuilder s = new StringBuilder("define i32 @main() {\nentry:\n");
        for(Instr i : instrs) {
            if (!(i instanceof label)) {
                s.append("  ");
            }
            s.append(i.getString()).append("\n");
        }
        s.append("}");
        return s.toString();
    }
}
