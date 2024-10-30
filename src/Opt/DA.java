package Opt;

import ASM.ASMInstr.ASMInstr;
import ASM.ASMInstr.MvInstr;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;

public class DA {
    private HashMap<Integer, Integer> map = new HashMap<>();
    private ArrayList<Pair> result = new ArrayList<>();
    private HashSet<Integer> tempVars = new HashSet<>();

    public DA(HashMap<Integer, Integer> map_) {
        map.putAll(map_);
        processAssignments();
    }

    private String physicName(int id) {
        if (id < 0) {
            return "t" + (-id);
        }
        if (id < 8) {
            return "a" + id;
        }
        if (id < 20) {
            return "s" + (id - 8);
        }
        if (id == 20) return "tp";
        return "gp";
    }

    public ArrayList<ASMInstr> getInstr() {
        ArrayList<ASMInstr> instrs = new ArrayList<>();
        for (Pair p : result) {
            MvInstr mv = new MvInstr();
            mv.rs = physicName(p.rs);
            mv.rd = physicName(p.rd);
            instrs.add(mv);
        }
        return instrs;
    }

    private void processAssignments() {
        ArrayList<Integer> getTmp = new ArrayList<>();
        while (!map.isEmpty()) {// Step 1: Build the graph
            HashMap<Integer, List<Integer>> graph = new HashMap<>();
            for (Map.Entry<Integer, Integer> entry : map.entrySet()) {
                int rs = entry.getKey();
                int rd = entry.getValue();
                graph.computeIfAbsent(rd, k -> new ArrayList<>()).add(rs);
            }

            // Step 2: Perform topological sort
            List<Integer> order = topologicalSort(graph);

            // Step 3: Process assignments
            for (int variable : order) {
                if (map.containsKey(variable)) {
                    int rd = map.get(variable);
                    result.add(new Pair(variable, rd));
                    map.remove(variable);
                }
            }

            if (map.size() > 1) {
                Map.Entry<Integer, Integer> entry = map.entrySet().iterator().next();
                int r1 = entry.getKey();
                int r2 = entry.getValue();
                map.remove(r1);
                getTmp.add(r2);
                map.put(r1, -getTmp.size());
            }
            else {
                break;
            }
        }
        for (int i = 1; i <= getTmp.size(); i++) {
            int var = getTmp.get(i - 1);
            result.add(new Pair(-i, var));
        }
    }

    private List<Integer> topologicalSort(HashMap<Integer, List<Integer>> graph) {
        HashMap<Integer, Integer> indegree = new HashMap<>();
        for (Integer node : graph.keySet()) {
            indegree.put(node, 0);
        }

        // Calculate indegrees
        for (List<Integer> edges : graph.values()) {
            for (Integer neighbor : edges) {
                indegree.put(neighbor, indegree.getOrDefault(neighbor, 0) + 1);
            }
        }

        // Queue for nodes with no incoming edges
        Queue<Integer> queue = new LinkedList<>();
        for (Map.Entry<Integer, Integer> entry : indegree.entrySet()) {
            if (entry.getValue() == 0) {
                queue.add(entry.getKey());
            }
        }

        List<Integer> order = new ArrayList<>();

        // Process nodes
        while (!queue.isEmpty()) {
            int current = queue.poll();
            order.add(current);

            // Decrease the indegree of neighbors
            for (Integer neighbor : graph.getOrDefault(current, new ArrayList<>())) {
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
        int rs;
        int rd;

        Pair(int rs, int rd) {
            this.rs = rs;
            this.rd = rd;
        }
    }
}
