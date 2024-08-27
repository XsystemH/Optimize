package MIR;

public class Program extends block{
    public funcDef init;

    public Program() {
        init = new funcDef();
        init.name = "_init";
    }

    @Override
    public String getString() {
        return super.getString() + init.getString();
    }
}
