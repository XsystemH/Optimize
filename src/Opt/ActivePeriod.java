package Opt;

public class ActivePeriod {
    public int startBlock;
    public int endBlock;

    public int startInstr;
    public int endInstr;

    public boolean isAfter(ActivePeriod p) {
        if (startBlock != p.endBlock) return p.endBlock < startBlock;
        return p.endInstr < startInstr;
    }

    public boolean isBefore(ActivePeriod p) {
        if (endBlock != p.startBlock) return p.startBlock > endBlock;
        return p.startInstr > endInstr;
    }

    public boolean cmp(ActivePeriod p) {
        if (startBlock != p.startBlock) return p.startBlock < startBlock;
        if (startInstr != p.startInstr) return p.startInstr < startInstr;
        if (endBlock != p.endBlock) return p.endBlock < endBlock;
        return p.endInstr < endInstr;
    }
}
