package LLVM.Expression.Constant;

public class intCons extends Cons{
    public int value;

    @Override
    public String getString() {
        return "" + value;
    }
}
