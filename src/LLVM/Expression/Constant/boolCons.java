package LLVM.Expression.Constant;

public class boolCons extends Cons{
    public boolean value;

    @Override
    public String getString() {
        return value ? "true" : "false";
    }
}
