package util.Scope;

public class classScope extends Scope{
    public classScope(Scope parent){
        super(parent);
        scopeType = ScopeType.Class;
    }
}
