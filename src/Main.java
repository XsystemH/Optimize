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
import Parser.*;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import util.MxErrorListener;
import util.Scope.globalScope;
import util.error.error;

import java.io.*;
import java.nio.charset.StandardCharsets;

public class Main {
    public static void main(String[] args) throws IOException {
//        String filename = "testcases/codegen/t15.mx";
//        InputStream input = new FileInputStream(filename);
//        OutputStream output = new FileOutputStream("output.ll");
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
            for (Instr instr : irBuilder.program.instrs) {
                if (instr instanceof funcDef func) func.autoFill();
            }

            for (Instr instr : irBuilder.program.instrs) {
                if (instr instanceof funcDef func) {
                    func.cfg = new CFG(func);
                    func.cfg.Mem2Reg();
                    func.cfg.rmPhi();
                }
                if (instr instanceof mainFn main) {
                    main.init.cfg = new CFG(main.init);
                    main.init.cfg.Mem2Reg();
                    main.init.cfg.rmPhi();
                }
            }
            output.write(irBuilder.strPreDef.getString().getBytes(StandardCharsets.UTF_8));
            output.write(irBuilder.program.getString().getBytes(StandardCharsets.UTF_8));

//            ASMBuilder asmBuilder = new ASMBuilder(irBuilder);
//            asmBuilder.visitProgram();
//            output.write(asmBuilder.getString().getBytes(StandardCharsets.UTF_8));
        }
        catch (error e) {
            System.out.println(e.message);
            System.exit(1);
        }
//        System.out.println("Successfully parsed!");
    }
}