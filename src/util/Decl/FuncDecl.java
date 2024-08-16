package util.Decl;

import AST.FuncNode;
import util.Type.ReturnType;
import util.Type.Type;

import java.util.ArrayList;

public class FuncDecl {
    public String name;
    public ReturnType retType;
    public ArrayList<Type> paramType;
    public ArrayList<String> paramName;

    public FuncDecl(FuncNode func) {
        name = func.name;
        retType = func.returnType;
        paramType = new ArrayList<>();
        paramName = new ArrayList<>();
        paramType.addAll(func.paramType);
        paramName.addAll(func.paramName);
    }
}
