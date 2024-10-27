package IR.Instruction;

import IR.Expression.Register.Reg;

import java.util.HashSet;

public abstract class Instr {
    public boolean toReg = false;

    public HashSet<String> use = new HashSet<>();
    public HashSet<String> def = new HashSet<>();
    public HashSet<String> in_ = new HashSet<>();
    public HashSet<String> out = new HashSet<>();

    public Instr() {}

    public abstract String getString();

    public abstract int getSpSize();
}
