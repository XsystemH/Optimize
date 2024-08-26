package MIR.Expression.Register;

public class varReg extends Reg {
    public String name;
    public int depth;

    public varReg(String n, int d) {
        name = n;
        depth = d;
    }

    @Override
    public String getString() {
        return "%" + name + "." + depth;
    }
}
