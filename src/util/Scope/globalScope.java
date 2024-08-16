package util.Scope;

import AST.ClassNode;
import AST.FuncNode;
import util.Decl.*;
import util.Type.Type;

import java.util.HashMap;

public class globalScope extends Scope{
    private HashMap<String, ClassDecl> classes;
    private HashMap<String, FuncDecl> functions;

    public globalScope(Scope parent) {
        super(parent);
        classes = new HashMap<>();
        functions = new HashMap<>();
        scopeType = ScopeType.Global;
    }

    public void defineFunction(FuncNode node) {
        if (functions.get(node.name) != null) {
            throw new RuntimeException("Duplicate function name: " + node.name);
        }
        functions.put(node.name, new FuncDecl(node));
    }

    public void defineClass(ClassNode node) {
        if (classes.get(node.name) != null) {
            throw new RuntimeException("Duplicate class name: " + node.name);
        }
        classes.put(node.name, new ClassDecl(node));
    }

    public Type getClassType(String name) {
        return null;
    }

    public FuncDecl getFunction(String name) {
        return functions.get(name);
    }

    public ClassDecl getClass(String name) {
        return classes.get(name);
    }
}
