package util.Scope;

import java.util.HashMap;

public class globalScope extends Scope{
    public HashMap<String, String> types;

    public globalScope(Scope parent) {
        super(parent);
    }
}
