package IR.Instruction;

public class label extends Instr{
    public int num;

    public label(int n) {
        num = n;
    }

    @Override
    public String getString() {
        return "label_" + num + ":";
    }

    public String getLabel() {
        return "%label_" + num;
    }
}
