package util.Type;

import Parser.MxParser;

import java.util.HashMap;

public class Type extends BasicType{
    public int dim = 0;

    public Type() {}

    public Type(BasicType other) {
        super(other);
        if (other instanceof Type) dim = ((Type) other).dim;
    }

    public Type(String typeName) {
        super(typeName);
    }

    public Type(MxParser.TypeContext ctx) {
        super(ctx);
        dim = ctx.Left_Bracket().size();
    }
}
