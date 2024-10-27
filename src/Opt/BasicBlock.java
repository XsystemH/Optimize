package Opt;

import IR.Expression.Register.Reg;
import IR.Instruction.Instr;
import IR.Instruction.label;
import IR.Instruction.phiInstr;

import java.util.ArrayList;
import java.util.BitSet;
import java.util.HashMap;
import java.util.HashSet;

public class BasicBlock {
    public label Label;
    public ArrayList<Instr> Instrs = new ArrayList<>();
    public Instr Ctrl;

    public ArrayList<String> lastBlocks = new ArrayList<>();
    public ArrayList<String> nextBlocks = new ArrayList<>();

    public BitSet dom = new BitSet();
    public HashSet<BasicBlock> domFrontier = new HashSet<>();
    public int iDom;
    public BasicBlock iDomBlock;
    public HashSet<BasicBlock> domChildren = new HashSet<>();

    public HashMap<String, phiInstr> phiMap = new HashMap<>();

    public HashSet<String> use = new HashSet<>();
    public HashSet<String> def = new HashSet<>();
    public HashSet<String> in_ = new HashSet<>();
    public HashSet<String> out = new HashSet<>();
}
