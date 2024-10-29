import AST.ProgramNode;
import Backend.ASMBuilder;
import Backend.IRBuilder;
import Frontend.ASTBuilder;
import Frontend.SemanticChecker;
import Frontend.SymbolCollector;
import IR.Instruction.Instr;
import IR.funcDef;
import IR.mainFn;
import Opt.CFG;
import Opt.NASMBuilder;
import Parser.*;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import util.MxErrorListener;
import util.Scope.globalScope;
import util.error.error;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.HashSet;

public class Main {
    public static void main(String[] args) throws IOException {
//        String filename = "testcases/sema/basic-package/basic-2.mx";
//        InputStream input = new FileInputStream(filename);
//        OutputStream IROut = new FileOutputStream("output.ll");
//        OutputStream output = new FileOutputStream("output.s");
        InputStream input = System.in;
        OutputStream output = System.out;
        //input 设置为标准输入
        try{
            MxLexer lexer = new MxLexer(CharStreams.fromStream(input));
            lexer.removeErrorListeners();
            lexer.addErrorListener(new MxErrorListener());
            MxParser parser = new MxParser(new CommonTokenStream(lexer));
            parser.removeErrorListeners();
            parser.addErrorListener(new MxErrorListener());
            ParseTree parseTreeRoot = parser.program();
            globalScope gScope = new globalScope(null);
            ASTBuilder astBuilder = new ASTBuilder();
            ProgramNode ast = (ProgramNode) astBuilder.visit(parseTreeRoot);
            new SymbolCollector(gScope).visit(ast);
            new SemanticChecker(gScope).visit(ast);
            IRBuilder irBuilder = new IRBuilder(gScope);
            irBuilder.visit(ast);
            try {
                for (Instr instr : irBuilder.program.instrs) {
                    if (instr instanceof funcDef func) func.autoFill();
                }
                // Mem2Reg
                for (Instr instr : irBuilder.program.instrs) {
                    if (instr instanceof funcDef func) {
                        func.cfg = new CFG(func);
                        func.cfg.Mem2Reg();
                    }
                    if (instr instanceof mainFn main) {
                        main.init.cfg = new CFG(main.init);
                        main.init.cfg.Mem2Reg();
                    }
                }
//            IROut.write(irBuilder.strPreDef.getString().getBytes(StandardCharsets.UTF_8));
//            IROut.write(irBuilder.program.getString().getBytes(StandardCharsets.UTF_8));
                // rm phi
                for (Instr instr : irBuilder.program.instrs) {
                    if (instr instanceof funcDef func) {
                        func.cfg.rmPhi();
                        func.cfg.linear_scan();
                    }
                    if (instr instanceof mainFn main) {
                        main.init.cfg.rmPhi();
                        main.init.cfg.linear_scan();
                    }
                }

                NASMBuilder nasmBuilder = new NASMBuilder(irBuilder);

                String builtin = "src/Backend/builtin/builtin.s";
                BufferedReader reader = new BufferedReader(new FileReader(builtin));
                String line;
                while ((line = reader.readLine()) != null) {
                    System.out.println(line);
                }

                output.write(nasmBuilder.getString().getBytes(StandardCharsets.UTF_8));
            }
            catch (error e) {

            }
        }
        catch (error e) {
            System.out.println(e.message);
            System.exit(1);
        }
//        System.out.println("Successfully parsed!");
    }
}