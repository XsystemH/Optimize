package src;
import src.Parser.MxLexer;
import src.Parser.MxParser;
import src.Parser.MxVisitor;
import src.Parser.MxListener;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

import javax.xml.transform.ErrorListener;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

public class Main {
    public static void main(String[] args) throws IOException {
        System.out.println("Hello Compiler!");

        String filename = "testcases/test";
        InputStream input = new FileInputStream(filename);

        MxLexer lexer = new MxLexer(CharStreams.fromStream(input));
        lexer.removeErrorListeners();
        lexer.addErrorListener(new MxErrorListener());
    }
}