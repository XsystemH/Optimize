import AST.ProgramNode;
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
import util.error.semanticError;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

public class Main {
    public static void main(String[] args) throws IOException {
//        System.out.println("Hello Compiler!");

//        String filename = "testcases/sema/const-array-package/const_array3.mx";
//        InputStream input = new FileInputStream(filename);
        InputStream input = System.in;
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
            ASTBuilder astBuilder = new ASTBuilder(gScope);
            ProgramNode ast = (ProgramNode) astBuilder.visit(parseTreeRoot);
            new SymbolCollector(gScope).visit(ast);
            new SemanticChecker(gScope).visit(ast);
        }
        catch (error e) {
            System.out.println(e.message);
            System.exit(1);
        }
        System.out.println("Successfully parsed!");
        return;
    }
}