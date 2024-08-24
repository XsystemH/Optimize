package MIR;

import util.error.internalError;
import util.position;

import java.util.ArrayList;
import java.util.LinkedList;

public class block {
    private LinkedList<statement> stmts = new LinkedList<>();
    private terminalStmt tailStmt = null;
    public block() {}
    public void push_back(statement s) {
        stmts.add(s);
        if (s instanceof terminalStmt) {
            if (tailStmt != null) {
                throw new internalError("multiple tails of a block",
                        new position(0, 0));
            }
            tailStmt = (terminalStmt) s;
        }
    }
    public ArrayList<statement> stmts() {
        return new ArrayList<>(stmts);
    }
    public ArrayList<block> successors() {
        ArrayList<block> ret = new ArrayList<>();
        if (tailStmt instanceof branch) {
            ret.add(((branch) tailStmt).trueBranch);
            ret.add(((branch) tailStmt).falseBranch);
        }
        else if (tailStmt instanceof jump) {
            ret.add(((jump) tailStmt).destination);
        }
        return ret;
    }
}
