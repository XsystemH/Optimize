package util.Type;

import Parser.MxParser;

import java.util.HashMap;

public class BasicType {
    public boolean isInt = false, isBool = false, isString = false;
    public String typeName;
    public HashMap<String, Type> members;

    public BasicType(BasicType other) {
        isInt = other.isInt;
        isBool = other.isBool;
        isString = other.isString;
        typeName = other.typeName;
        members = other.members;
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
