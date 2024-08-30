package IR;

import IR.Instruction.Instr;

import java.util.ArrayList;

public class block extends Instr {
    public ArrayList<Instr> instrs = new ArrayList<>();
    public block() {}

    @Override
    public String getString() {
        StringBuilder ret = new StringBuilder();
        for (Instr s : instrs) {
            ret.append(s.getString()).append("\n");
        }
        return ret.toString();
    }

    @Override
    public int getSpSize() {
        int ret = 0;
        for (Instr s : instrs) {
            ret += s.getSpSize();
        }
        return ret;
    }
}
