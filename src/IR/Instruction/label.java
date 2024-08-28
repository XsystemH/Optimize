package IR.Instruction;

public class label extends Instr{
    public String info;
    public int num;

    public label(int n) {
        info = "";
        num = n;
    }
    public label(String info, int n) {
        this.info = info;
        num = n;
    }

    @Override
    public String getString() {
        return "label_" + info + "_" + num + ":";
    }

    public String getLabel() {
        return "%label_" + info + "_" + num;
    }
}