package util.Scope;

public class loopScope extends Scope{

    public loopScope(Scope parent) {
        super(parent);
        scopeType = ScopeType.Loop;
    }
}
