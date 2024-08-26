package MIR;

import MIR.IRType.IRType;
import MIR.Instruction.Instr;

import java.util.ArrayList;

public class funcDef extends block {
    public IRType returnType;
    public String className;
    public String name;
    public ArrayList<String> params = new ArrayList<>();
    public ArrayList<IRType> paramTypes = new ArrayList<>();

    @Override
    public String getString() {
        StringBuilder str = new StringBuilder("define" + returnType.getString() + " @" + name + "(");
        for (int i = 0; i < params.size(); i++) {
            if (i > 0) str.append(", ");
            str.append(paramTypes.get(i).getString());
            str.append(params.get(i));
        }
        str.append(") {\n");
        for (Instr instr : instrs) {
            str.append(instr.getString()).append("\n");
        }
        str.append("}\n");
        return str.toString();
    }
}
