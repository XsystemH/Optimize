package MIR;

import MIR.IRType.IRType;
import MIR.Instruction.Instr;
import MIR.Instruction.label;

import java.util.ArrayList;

public class funcDef extends block {
    public IRType returnType;
    public String className;
    public String name;
    public ArrayList<String> params = new ArrayList<>();
    public ArrayList<IRType> paramTypes = new ArrayList<>();

    @Override
    public String getString() {
        StringBuilder str = new StringBuilder("define ");
        if (returnType != null) {
            str.append(returnType.getString()).append(" @");
        }
        else {
            str.append("void @");
        }
        if (className != null) {
            str.append(className).append("::");
        }
        str.append(name).append("() ( ");
        for (int i = 0; i < params.size(); i++) {
            if (i > 0) str.append(", ");
            str.append(paramTypes.get(i).getString()).append(" %");
            str.append(params.get(i));
        }
        str.append(" ) {\nentry:\n");
        for (Instr instr : instrs) {
            if (!(instr instanceof label)) {
                str.append("  ");
            }
            str.append(instr.getString()).append("\n");
        }
        str.append("}\n");
        return str.toString();
    }
}
