package MIR;

import MIR.IRType.IRType;
import MIR.Instruction.Instr;

import java.util.ArrayList;

public class classDef extends Instr {
    public String name;
    public ArrayList<IRType> members = new ArrayList<>();

    @Override
    public String getString() {
        return "";
    }
}
