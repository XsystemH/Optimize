import AST.ProgramNode;
import Backend.ASMBuilder;
import Backend.IRBuilder;
import Frontend.ASTBuilder;
import Frontend.SemanticChecker;
import Frontend.SymbolCollector;
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
//        System.out.println("Hello Compiler!");

//        String filename = "testcases/sema/array-package/array-1.mx";
//        InputStream input = new FileInputStream(filename);
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
//            output.write(irBuilder.strPreDef.getString().getBytes(StandardCharsets.UTF_8));
//            output.write(irBuilder.program.getString().getBytes(StandardCharsets.UTF_8));
            irBuilder.strPreDef.getString();
            irBuilder.program.getString();
            ASMBuilder asmBuilder = new ASMBuilder(irBuilder);
            asmBuilder.visitProgram();
            output.write(asmBuilder.getString().getBytes(StandardCharsets.UTF_8));
        }
        catch (error e) {
            System.out.println(e.message);
            System.exit(1);
        }
//        System.out.println("Successfully parsed!");
        return;
    }
}