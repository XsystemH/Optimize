package MIR;

import MIR.Instruction.Instr;

import java.util.HashSet;
import java.util.Set;

public class mainFn extends block {
    public mainFn() {}

    @Override
    public String getString() {
        StringBuilder s = new StringBuilder("define i32 @main() {\n");
        for(Instr i : instrs) {
            s.append("  ").append(i.getString()).append("\n");
        }
        s.append("}");
        return s.toString();
    }
}
