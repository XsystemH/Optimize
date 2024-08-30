package ASM.ASMInstr;

public class Directive extends ASMInstr {
    public String dir;
    public String com;

    @Override
    public String getString() {
        if (com == null) {
            return dir;
        }
        return dir + " " + com;
    }
}
