package util.Type;

import Parser.MxParser;

import java.util.Objects;

public class ReturnType extends BasicType{
    public boolean isVoid = false;

    public ReturnType(BasicType other) {
        super(other);
        if (other instanceof ReturnType) {
            isVoid = ((ReturnType)other).isVoid;
        }
    }

    public ReturnType(String typeName) {
        super(typeName);
        if (typeName.equals("void")) {
            isVoid = true;
        }
    }

    public ReturnType(MxParser.ReturnTypeContext ctx) {
        super(ctx.type());
        if (Objects.equals(ctx.toString(), "void")) {
            isVoid = true;
        }
    }
}
