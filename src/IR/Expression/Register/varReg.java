package IR.Expression.Register;

public class varReg extends Reg {
    public String name;
    public int depth;

    public varReg(String n, int d) {
        name = n;
        depth = d;
    }

    @Override
    public String getString() {
        if (depth == 0) {
            return "@" + name;
        }
        if (depth == -1) {
            return "%" + name; // for func param
        }
        return "%" + name + "." + depth;
    }
}
