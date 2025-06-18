package Opt;

import IR.Expression.Constant.intCons;
import IR.Expression.Expr;
import IR.Instruction.Instr;
import IR.Instruction.binInstr;

import java.util.HashMap;

public class Multiply {
    
    public static void multiplyOptimization(HashMap<String, BasicBlock> basicBlocks) {
        for (BasicBlock block : basicBlocks.values()) {
            for (Instr instr : block.Instrs) {
                if (instr instanceof binInstr binOp && binOp.op == binInstr.binaryOP.mul && !instr.isRemoved) {
                    optimizeMultiply(binOp);
                }
            }
        }
    }

    private static void optimizeMultiply(binInstr mulOp) {
        intCons constOperand = null;
        Expr varOperand = null;

        if (mulOp.operand1 instanceof intCons) {
            constOperand = (intCons) mulOp.operand1;
            varOperand = mulOp.operand2;
        } else if (mulOp.operand2 instanceof intCons) {
            constOperand = (intCons) mulOp.operand2;
            varOperand = mulOp.operand1;
        }

        if (constOperand != null && varOperand != null) {
            int constValue = constOperand.value;
            
            // 乘以0
            if (constValue == 0) {
                mulOp.op = binInstr.binaryOP.add;
                mulOp.operand1 = new intCons(0);
                mulOp.operand2 = new intCons(0);
                return;
            }

            // 乘以1
            if (constValue == 1) {
                mulOp.op = binInstr.binaryOP.add;
                mulOp.operand1 = varOperand;
                mulOp.operand2 = new intCons(0);
                return;
            }

            // 乘以-1
            if (constValue == -1) {
                mulOp.op = binInstr.binaryOP.sub;
                mulOp.operand1 = new intCons(0);
                mulOp.operand2 = varOperand;
                return;
            }

            // 乘以2的幂次方的优化 (转换为左移)
            if (constValue > 0 && (constValue & (constValue - 1)) == 0) {
                int shiftAmount = Integer.numberOfTrailingZeros(constValue);
                mulOp.op = binInstr.binaryOP.shl;
                mulOp.operand1 = varOperand;
                mulOp.operand2 = new intCons(shiftAmount);
                return;
            }

            // 乘以小常数的优化 (转换为加法和左移的组合)
            if (constValue > 0 && constValue <= 16) {
                optimizeSmallMultiply(mulOp, varOperand, constValue);
            }
        }
    }

    private static void optimizeSmallMultiply(binInstr mulOp, Expr varOperand, int constValue) {
        switch (constValue) {
            case 3: // x * 3 = x + (x << 1)
            case 5: // x * 5 = x + (x << 2)  
            case 9: // x * 9 = x + (x << 3)
                int shiftAmount = Integer.numberOfTrailingZeros(constValue - 1);
                break;
        }
    }
} 