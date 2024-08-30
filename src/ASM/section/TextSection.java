package ASM.section;

import java.util.ArrayList;

public class TextSection extends ASMSection {
    public ArrayList<ASMFunction> functions = new ArrayList<>();

    public TextSection() {
        name = ".text";
    }

    @Override
    public String getString() {
        StringBuilder s = new StringBuilder();
        s.append(".section").append(name).append("\n");
        for (ASMFunction f : functions) {
            s.append(f.getString()).append("\n");
        }
        return s.toString();
    }
}
