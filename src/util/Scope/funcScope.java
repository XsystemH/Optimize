package util.Scope;

import util.Type.ReturnType;

public class funcScope extends Scope {
    public boolean hasReturn = false;
    public ReturnType returnType;

    public funcScope(Scope parent) {
        super(parent);
        scopeType = ScopeType.Func;
    }
}
