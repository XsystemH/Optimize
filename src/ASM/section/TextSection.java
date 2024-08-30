package ASM.section;

import java.util.ArrayList;

public class TextSection extends ASMSection {
    public ArrayList<ASMFunction> functions = new ArrayList<>();

    public TextSection() {
        name = ".text";
    }

    @Override
    public String getString() {
        return "";
    }
}
