package MIR.Instruction;

import MIR.Expression.Expr;
import MIR.Expression.Register.Reg;
import MIR.IRType.IRType;

import java.util.ArrayList;

public class callInstr extends Instr{
    public Reg result = null;
    public IRType returnType = null;
    public String className = null;
    public String methodName = null;
    public ArrayList<IRType> paramTypes = new ArrayList<>();
    public ArrayList<Expr> paramExpr = new ArrayList<>();

    @Override
    public String getString() {
        StringBuilder s;
        if (returnType != null) {
            s = new StringBuilder(result.getString() + " = call " + returnType.getString() + " @");
        }
        else {
            s = new StringBuilder("call void @");
        }
        if (className != null) {
            s.append(className).append("::");
        }
        s.append(methodName).append("(");
        for (int i = 0; i < paramTypes.size(); i++) {
            if (i > 0) {
                s.append(", ");
            }
            s.append(paramTypes.get(i).getString()).append(" ");
            s.append(paramExpr.get(i).getString());
        }
        s.append(")");
        return s.toString();
    }
}
