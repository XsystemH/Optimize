package Opt;

import IR.Expression.Expr;
import IR.Expression.Register.Reg;
import IR.Expression.Register.varReg;
import IR.Instruction.Instr;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;

public class DAPHI {
    private HashMap<Reg, Expr> map = new HashMap<>();
    private ArrayList<Pair> result = new ArrayList<>();

    public DAPHI(HashMap<Reg, Expr> map_) {
        map.putAll(map_);
        processAssignments();
    }
    
    public ArrayList<Instr> getInstrs() {
        ArrayList<Instr> instrs = new ArrayList<>();
        for (Pair p : result) {
            moveInstr mv = new moveInstr();
            mv.val = p.rs;
            mv.dest = p.rd;
            instrs.add(mv);
        }
        return instrs;
    }

    private void processAssignments() {
        ArrayList<Reg> getTmp = new ArrayList<>();
        while (!map.isEmpty()) { // Step 1: Build the graph
            HashMap<Expr, List<Expr>> graph = new HashMap<>();
            for (Map.Entry<Reg, Expr> entry : map.entrySet()) {
                Expr rs = entry.getValue();
                Expr rd = entry.getKey();
                graph.computeIfAbsent(rd, k -> new ArrayList<>()).add(rs);
            }

            // Step 2: Perform topological sort
            List<Reg> order = topologicalSort(graph);

            // Step 3: Process assignments
            for (Reg variable : order) {
                if (map.containsKey(variable)) {
                    Expr rs = map.get(variable);
                    result.add(new Pair(rs, variable));
                    map.remove(variable);
                }
            }

            if (!map.isEmpty()) {
                Map.Entry<Reg, Expr> entry = map.entrySet().iterator().next();
                Expr r1 = entry.getValue();
                Reg r2 = entry.getKey();
                map.remove(r2);
                getTmp.add(r2);
                map.put(new varReg(".phi.temp" + getTmp.size(), -1, 0), r1); // Use temporary variable naming convention
            } else {
                break;
            }
        }
        for (int i = 1; i <= getTmp.size(); i++) {
            Reg var = getTmp.get(i - 1);
            result.add(new Pair(new varReg(".phi.temp" + i, -1, 0), var)); // Use temporary variable naming convention
        }
    }

    private List<Reg> topologicalSort(HashMap<Expr, List<Expr>> graph) {
        HashMap<Expr, Integer> indegree = new HashMap<>();
        for (Expr node : graph.keySet()) {
            indegree.put(node, 0);
        }

        // Calculate indegrees
        for (List<Expr> edges : graph.values()) {
            for (Expr neighbor : edges) {
                indegree.put(neighbor, indegree.getOrDefault(neighbor, 0) + 1);
            }
        }

        // Queue for nodes with no incoming edges
        Queue<Expr> queue = new LinkedList<>();
        for (Map.Entry<Expr, Integer> entry : indegree.entrySet()) {
            if (entry.getValue() == 0) {
                queue.add(entry.getKey());
            }
        }

        List<Reg> order = new ArrayList<>();

        // Process nodes
        while (!queue.isEmpty()) {
            Expr current = queue.poll();
            if (current instanceof Reg reg)
                order.add(reg);

            // Decrease the indegree of neighbors
            for (Expr neighbor : graph.getOrDefault(current, new ArrayList<>())) {
                indegree.put(neighbor, indegree.get(neighbor) - 1);
                if (indegree.get(neighbor) == 0) {
                    queue.add(neighbor);
                }
            }
        }

        return order;
    }

    public ArrayList<Pair> getResult() {
        return result;
    }

    // Pair class to hold rs and rd
    public static class Pair {
        Expr rs;
        Reg rd;

        Pair(Expr rs, Reg rd) {
            this.rs = rs;
            this.rd = rd;
        }
    }
}
