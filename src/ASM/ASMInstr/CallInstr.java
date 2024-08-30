package ASM.ASMInstr;

public class CallInstr extends ASMInstr {
    public String func;

    @Override
    public String getString() {
        return "call " + func;
    }
}
