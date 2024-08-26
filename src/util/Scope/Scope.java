package util.Scope;

import MIR.Instruction.label;
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
    public boolean hasReturn = false;
    public String className;
    public int depth = 0;

    private HashMap<String, Type> member;
    public Scope parent;

    public Scope(Scope parent) {
        member = new HashMap<>();
        this.parent = parent;
        if (parent != null) {
            returnType = parent.returnType;
            depth = parent.depth + 1;
        }
        else {
            depth = 0;
        }
    }

    public int getVarDepth(String name) {
        if (member.containsKey(name)) return depth;
        assert parent != null;
        return parent.getVarDepth(name);
    }

    public boolean containsVariable(String name, boolean lookup) {
        if (member.containsKey(name)) return true;
        if (parent != null && lookup) return parent.containsVariable(name, true);
        return false;
    }

    public void defineVariable(String name, Type type, position pos, boolean lookup) {
        if (containsVariable(name, lookup))
            throw new semanticError("Multiple Definitions", pos);
        member.put(name, type);
    }

    public void defineVariable(String name, Type type) {
        defineVariable(name, type, new position(0, 0), false);
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

    public void getReturn() {
        if (parent != null) parent.getReturn();
    }

    public String isInClass() {
        if (scopeType == ScopeType.Class) {
            return className;
        }
        else if (parent != null) {
            return parent.isInClass();
        }
        return null;
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

    public label getLoopStart() {
        if (scopeType == ScopeType.Loop) {
            return ((loopScope) this).loopLabel;
        }
        else if (parent != null) {
            return parent.getLoopStart();
        }
        return null;
    }

    public label getLoopSkip() {
        if (scopeType == ScopeType.Loop) {
            return ((loopScope) this).skipLabel;
        }
        else if (parent != null) {
            return parent.getLoopSkip();
        }
        return null;
    }
}