grammar Mx;

program: (classDef | funcDef)* mainFn;
mainFn: 'int' 'main()' suite EOF;

classDef : 'class' Identifier suite ';';

funcDef : type Identifier '(' ')' suite; // todo funcParameter

suite : '{' statement* '}';

statement
    : suite #block
    | type Identifier ('=' expression)? ';' #vardefStatement
    | If '(' expression ')' trueStmt=statement
            (Else falseStmt=statement)? #ifStmt
    | For '(' expression ')' statement #forStatement
    | While '(' expression ')' statement #whileStatement
    | Return expression? ';' #returnStatement
    | Break ';' #breakStatement
    | Continue ';' #continueStatement
    | expression ';' #expressionStatement
    | ';' #emptyStatement
    ;

expression
    : primary #primaryExpression
    | op=('++' | '--' | '|' | '~' | '-') expression #leftM
    | expression op=('++' | '--') #rightM
    | expression op=('+' | '-' | '*' | '/') expression #binary
    | expression op=('==' | '!=' | '>' | '<' | '>=' | '<=') expression #boolExpr
    | expression '?' expression ':' expression #trinocular
    | <assoc=right> expression '=' expression #assignExpr
    | ( FormatEmpty
      | (FormatBegin expression (FormatMid expression)* FormatEnd)) #formatString
    ;

primary
    : '(' expression ')' #priority
    | Constant  #constant
    | varName=Identifier #variable
    | This #this
    | funcName=Identifier '(' expression? (','expression)* ')' #funcCall
    | className=Identifier '.' memberName=Identifier #classMember
    | arrayName=Identifier '[' index=expression ']' #arrayVisit
    | New expression #newExpr
    ;

type
    : Int
    | Bool
    | String
    | Identifier // for class
    ;

FormatBegin : 'f"' (PrintableChar~'$' | EscapeSequence | '$$')* '$';
FormatEmpty : 'f"' (PrintableChar~'$' | EscapeSequence | '$$')* '"';
FormatMid : '$' (PrintableChar~'$' | EscapeSequence | '$$')* '$';
FormatEnd : '$' (PrintableChar~'$' | EscapeSequence | '$$')* '"';

// Constants
Constant
    : DecInteger
    | StringCons
    | Array_Cons
    | True
    | False
    ;
DecInteger
    : [1-9] [0-9]*
    | '0'
    ;

StringCons : '"' (PrintableChar | EscapeSequence | '$$')* '"';

Array_Cons : '{' [ \t\r\n]* Array_Content? [ \t\r\n]* '}';
Array_Content : Constant ([ \t\r\n]* ',' [ \t\r\n]* Constant)*;

// Character Set
Add : '+';
Sub : '-';
Mul : '*';
Div : '/';

Greater : '>';
Smaller : '<';
GorE : '>=';
SorE : '<=';
NotEqual : '!=';
Equal : '==';

LogicAnd : '&&';
LogicOr_ : '||';
LogicNot : '!';

RightShift : '>>';
Left_Shift : '<<';
And : '&';
Or_ : '|';
Xor : '^';
Not : '~';

Assign : '=';

SelfAdd : '++';
SelfSub : '--';

Component : '.';

Left_Bracket : '[';
RightBracket : ']';
Left_Paren : '(';
RightParen : ')';

Question : '?';
Colon : ':';

SemiC : ';';
Comma : ',';
Left_Brace : '{';
RightBrace : '}';

LineComment
    :   '//' ~[\r\n]*
        -> skip
    ;
BlockComment
    :   '/*' .*? '*/'
        -> skip
    ;
Quote : '"';

// Key Words
Void : 'void';
Bool : 'bool';
Int : 'int';
String : 'string';
New : 'new';
Class : 'class';
Null : 'null';
True : 'true';
False : 'false';
This : 'this';
If : 'if';
Else : 'else';
For : 'for';
While : 'while';
Break : 'break';
Continue : 'continue';
Return : 'return';

Identifier
    : [a-zA-Z] [a-zA-Z_0-9]*
    ;

PrintableChar : [\u0020-\u007E];
EscapeSequence : '\\' [n"\\];
Whitespace
    :   [ \t\r\n] +
        -> skip
    ;