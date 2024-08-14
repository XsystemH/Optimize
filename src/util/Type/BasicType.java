package util.Type;

import Parser.MxParser;

public class BasicType {
    public boolean isInt = false, isBool = false, isString = false;
    public String typeName;

    public BasicType(BasicType other) {
        isInt = other.isInt;
        isBool = other.isBool;
        isString = other.isString;
        typeName = other.typeName;
    }

    public BasicType(String typeName) {
        switch (typeName) {
            case "int" -> isInt = true;
            case "bool" -> isBool = true;
            case "string" -> isString = true;
            default -> typeName = typeName;
        }
    }

    public BasicType(MxParser.TypeContext ctx) {
        this(ctx.BasicType().toString());
    }
}
