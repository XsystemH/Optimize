package MIR;

import MIR.IRType.IRType;
import MIR.IRType.classType;
import MIR.Instruction.Instr;

import java.util.ArrayList;

public class classDef extends Instr {
    public String name;
    public ArrayList<IRType> members = new ArrayList<>();

    @Override
    public String getString() {
        StringBuilder s = new StringBuilder("%class." + name + " = { ");
        for (int i = 0; i < members.size(); i++) {
            if (i > 0) s.append(", ");
            if (members.get(i) instanceof classType) {
                s.append("ptr");
            }
            else s.append(members.get(i).getString());
        }
        s.append(" }");
        return s.toString();
    }
}
