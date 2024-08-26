package MIR.IRType;

public class arrType extends IRType{
    public int size;
    public IRType type;

    public arrType(int size, IRType type) {
        this.size = size;
        this.type = type;
    }

    @Override
    public String getString() {
        return "[" + size + " x " + type.toString() + "]";
    }
}
