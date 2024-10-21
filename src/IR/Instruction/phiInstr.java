package IR.Instruction;

import IR.Expression.Expr;
import IR.Expression.Register.Reg;
import IR.IRType.IRType;

import java.util.ArrayList;

public class phiInstr extends Instr{
    public Reg result;
    public IRType type;
    public ArrayList<Expr> vals;
    public ArrayList<String> blocks;

    @Override
    public String getString() {
        StringBuilder str = new StringBuilder();
        str.append(result.getString());
        str.append(" = phi ");
        str.append(type.getString());
        str.append(" ");
        for (int i = 0; i < vals.size(); i++) {
            if (i > 0) {
                str.append(", ");
            }
            str.append("[ ");
            str.append(vals.get(i).getString());
            str.append(", ");
            str.append(blocks.get(i));
            str.append(" ]");
        }
        return str.toString();
    }

    @Override
    public int getSpSize() {
        return 1;
    }
}
