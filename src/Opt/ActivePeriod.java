package Opt;

public class ActivePeriod {
    public int l;
    public int r;

    public boolean endAfter(ActivePeriod p) {
        if (r != p.r) return p.r < r;
        return l < p.l;
    }

    public boolean endBefore(int ll) {
        return r < ll;
    }
}
