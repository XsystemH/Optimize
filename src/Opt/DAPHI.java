package Opt;

import IR.Instruction.Instr;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;

public class DAPHI {
    private HashMap<String, String> map = new HashMap<>();
    private ArrayList<Pair> result = new ArrayList<>();

    public DAPHI(HashMap<String, String> map_) {
        map.putAll(map_);
        processAssignments();
    }

    private void processAssignments() {
        ArrayList<String> getTmp = new ArrayList<>();
        // Step 1: Build the graph
        HashMap<String, List<String>> graph = new HashMap<>();
        for (Map.Entry<String, String> entry : map.entrySet()) {
            String rs = entry.getKey();
            String rd = entry.getValue();
            graph.computeIfAbsent(rd, k -> new ArrayList<>()).add(rs);
        }

        // Step 2: Perform topological sort
        List<String> order = topologicalSort(graph);

        // Step 3: Process assignments
        for (String variable : order) {
            if (map.containsKey(variable)) {
                String rd = map.get(variable);
                result.add(new Pair(variable, rd));
                map.remove(variable);
            }
        }
    }

    private List<String> topologicalSort(HashMap<String, List<String>> graph) {
        HashMap<String, Integer> indegree = new HashMap<>();
        for (String node : graph.keySet()) {
            indegree.put(node, 0);
        }

        // Calculate indegrees
        for (List<String> edges : graph.values()) {
            for (String neighbor : edges) {
                indegree.put(neighbor, indegree.getOrDefault(neighbor, 0) + 1);
            }
        }

        // Queue for nodes with no incoming edges
        Queue<String> queue = new LinkedList<>();
        for (Map.Entry<String, Integer> entry : indegree.entrySet()) {
            if (entry.getValue() == 0) {
                queue.add(entry.getKey());
            }
        }

        List<String> order = new ArrayList<>();

        // Process nodes
        while (!queue.isEmpty()) {
            String current = queue.poll();
            order.add(current);

            // Decrease the indegree of neighbors
            for (String neighbor : graph.getOrDefault(current, new ArrayList<>())) {
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
        String rs;
        String rd;

        Pair(String rs, String rd) {
            this.rs = rs;
            this.rd = rd;
        }
    }
}
