package AST;

import AST.Stmt.varDefStmtNode;
import util.position;

import java.util.ArrayList;

public class ProgramNode extends ASTNode {
    public ArrayList<ClassNode> Classes;
    public ArrayList<FuncNode> functions;
    public ArrayList<varDefStmtNode> globalVars;
    public FuncNode mainFn;

    public ProgramNode(position pos) {
        super(pos);
        Classes = new ArrayList<>();
        functions = new ArrayList<>();
        globalVars = new ArrayList<>();
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
