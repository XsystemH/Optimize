package IR.Instruction;

import java.util.HashSet;

public abstract class Instr {
    public boolean isRemoved = false;
    public int ID;
    public String parent;

    public HashSet<String> use = new HashSet<>();
    public HashSet<String> def = new HashSet<>();
    public HashSet<String> in_ = new HashSet<>();
    public HashSet<String> out = new HashSet<>();

    public Instr() {}

    public abstract String getString();

    public abstract int getSpSize();
}
