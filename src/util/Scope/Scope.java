package util.Scope;

import util.Type.Type;
import util.error.semanticError;
import util.position;

import java.util.HashMap;

public class Scope {
    private HashMap<String, Type> member;
    private Scope parent;

    public Scope(Scope parent) {
        member = new HashMap<>();
        this.parent = parent;
    }

    public boolean containsVariable(String name, boolean lookup) {
        if (member.containsKey(name)) return true;
        if (parent != null && lookup) return parent.containsVariable(name, true);
        return false;
    }

    public void defineVariable(String name, Type type, position pos, boolean lookup) {
        if (containsVariable(name, lookup))
            throw new semanticError("Semantic Error: variable redefine", pos);
        member.put(name, type);
    }

    public Type getType(String name, boolean lookup) {
        if (member.containsKey(name)) return member.get(name);
        if (parent != null && lookup) return parent.getType(name, true);
        return null;
    }
}
