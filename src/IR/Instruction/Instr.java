package IR.Instruction;

import IR.Expression.Register.Reg;

import java.util.HashSet;

public abstract class Instr {
    public boolean toReg = false;

    public HashSet<Reg> use = new HashSet<>();
    public HashSet<Reg> def = new HashSet<>();
    public HashSet<Reg> in_ = new HashSet<>();
    public HashSet<Reg> out = new HashSet<>();

    public Instr() {}

    public abstract String getString();

    public abstract int getSpSize();
}
