package AST;

import util.position;

import java.util.ArrayList;

public class ProgramNode extends ASTNode {
    public ArrayList<ClassNode> Classes;
    public ArrayList<FuncNode> functions;
    public ArrayList<GlobalVarNode> globalVars;
    public FuncNode mainFn;

    public ProgramNode(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {

    }
}
