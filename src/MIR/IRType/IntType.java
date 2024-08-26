package MIR.IRType;

public class IntType extends IRType{
    public int N;

    public IntType(int N) {
        this.N = N;
    }

    @Override
    public String getString() {
        return "i" + N;
    }
}
