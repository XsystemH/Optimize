package Opt;

import IR.Instruction.Instr;
import IR.Instruction.label;

import java.util.ArrayList;

public class BasicBlock {
    public label Label;
    public ArrayList<Instr> Instrs = new ArrayList<>();
    public Instr Ctrl;

    public ArrayList<String> lastBlocks = new ArrayList<>();
    public ArrayList<String> nextBlocks = new ArrayList<>();
}
