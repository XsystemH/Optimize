package util.Type;

import Parser.MxParser;

import java.util.Objects;

public class ReturnType extends Type{
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
        if (ctx.getText().equals("void")) {
            isVoid = true;
        }
        else {
            isVoid = false;
            switch (typeName) {
                case "int" -> isInt = true;
                case "bool" -> isBool = true;
                case "string" -> isString = true;
                case "null" -> isNull = true;
                default -> this.typeName = typeName;
            }
            dim = ctx.type().Left_Bracket().size();
        }
    }
}
