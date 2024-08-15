package util.Decl;

import AST.ClassNode;
import util.Type.Type;

import java.util.HashMap;

public class ClassDecl {
    public String name;
    public HashMap<String, Type> vars;
    public HashMap<String, FuncDecl> functions;
    public boolean hasConstructor = false;

    public ClassDecl(String name) {
        this.name = name;
        this.vars = new HashMap<>();
        this.functions = new HashMap<>();
    }

    public ClassDecl(ClassNode cla) {
        this.name = cla.name;
        this.vars = new HashMap<>();
        this.functions = new HashMap<>();
        // todo var func constructor
    }
}
