package IR;

import IR.Expression.Constant.intCons;
import IR.IRType.IntType;
import IR.Instruction.*;
import Opt.BasicBlock;

public class mainFn extends funcDef {
    public funcDef init;

    public mainFn() {
        name = "main";
        returnType = new IntType(32);
        callInstr c = new callInstr();
        c.methodName = ".init";
        instrs.add(c);
    }

    @Override
    public String getString() {
        StringBuilder s = new StringBuilder("define i32 @main() {\n");
        for (BasicBlock block : cfg.rpo) {
            s.append(block.Label.getString()).append("\n");
            for (phiInstr phi : block.phiMap.values()) {
                s.append("  ").append(phi.getString()).append("\n");
            }
            for (Instr instr : block.Instrs) {
                s.append("  ").append(instr.getString()).append("\n");
            }
            s.append("  ").append(block.Ctrl.getString()).append("\n");
        }
        s.append("}");
        return init.getString() + s;
    }
}
