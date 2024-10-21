package IR.Instruction;

public abstract class Instr {
    public boolean toReg = false;

    public Instr() {}

    public abstract String getString();

    public abstract int getSpSize();
}
