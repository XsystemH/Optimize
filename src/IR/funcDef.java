package IR;

import IR.Expression.Constant.boolCons;
import IR.Expression.Constant.intCons;
import IR.Expression.Constant.ptrCons;
import IR.IRType.IRType;
import IR.Instruction.Instr;
import IR.Instruction.brInstr;
import IR.Instruction.label;
import IR.Instruction.retInstr;
import Opt.CFG;

import java.util.ArrayList;

public class funcDef extends block {
    public IRType returnType;
    public String className;
    public String name;
    public ArrayList<String> params = new ArrayList<>();
    public ArrayList<IRType> paramTypes = new ArrayList<>();
    public ArrayList<Instr> alloc = new ArrayList<>();

    public CFG cfg;

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
            str.append(className).append("..");
        }
        str.append(name).append("(");
        for (int i = 0; i < params.size(); i++) {
            if (i > 0) str.append(", ");
            str.append(paramTypes.get(i).getString()).append(" %");
            str.append(params.get(i));
        }
        str.append(") {\nentry:\n");
        for (Instr instr : alloc) {
            str.append("  ").append(instr.getString()).append("\n");
        }
        for (Instr instr : instrs) {
            if (!(instr instanceof label)) {
                str.append("  ");
            }
            str.append(instr.getString()).append("\n");
        }
        if (instrs.isEmpty() || (!(instrs.get(instrs.size() - 1) instanceof brInstr) &&
                !(instrs.get(instrs.size() - 1) instanceof retInstr))) {
            if (returnType != null) {
                str.append("ret ").append(returnType.getString()).append(" ");
                str.append(returnType.getDefault()).append(" \n");
                retInstr ret = new retInstr();
                ret.type = returnType;
                switch (returnType.getDefault()) {
                    case "0" -> ret.value = new intCons(0);
                    case "null" -> ret.value = new ptrCons();
                    case "true" -> ret.value = new boolCons(true);
                    case "false" -> ret.value = new boolCons(false);
                }
                instrs.add(ret);
            }
            else {
                str.append("ret void\n");
                instrs.add(new retInstr());
            }
        }
        str.append("}\n");
        return str.toString();
    }
}
