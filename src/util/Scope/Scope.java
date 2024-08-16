package util.Scope;

import util.Type.ReturnType;
import util.Type.Type;
import util.error.semanticError;
import util.position;

import java.util.HashMap;

public class Scope {
    public enum ScopeType {
        Basic, Global, Class, Func, Loop
    }
    public ScopeType scopeType = ScopeType.Basic;
    public ReturnType returnType;

    private HashMap<String, Type> member;
    public Scope parent;

    public Scope(Scope parent) {
        member = new HashMap<>();
        this.parent = parent;
        returnType = null;
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

    public boolean isInFunction() {
        if (scopeType == ScopeType.Func) {
            return true;
        }
        else if (parent != null) {
            return parent.isInFunction();
        }
        return false;
    }

    public boolean isInClass() {
        if (scopeType == ScopeType.Class) {
            return true;
        }
        else if (parent != null) {
            return parent.isInClass();
        }
        return false;
    }

    public boolean isInLoop() {
        if (scopeType == ScopeType.Loop) {
            return true;
        }
        else if (parent != null) {
            return parent.isInLoop();
        }
        return false;
    }
}