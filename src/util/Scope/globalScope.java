package util.Scope;

import AST.FuncNode;
import util.Decl.*;
import util.Type.Type;

import java.util.HashMap;

public class globalScope extends Scope{
    private HashMap<String, ClassDecl> classes;
    private HashMap<String, FuncDecl> functions;

    public globalScope(Scope parent) {
        super(parent);
    }

    public void defineFunction(FuncNode node) {

    }

    public void defineClass(ClassDecl node) {

    }
}
