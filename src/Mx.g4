grammar Mx;

program: (classDef | funcDef | varDef)* mainFn;
mainFn: 'int' 'main' '(' ')' suite EOF;

classDef : 'class' Identifier classsuite ';';

funcDef : returnType funcName=Identifier '(' param* ')' suite;
returnType : type | Void;
param : type name = Identifier;

suite : '{' statement* '}';
classsuite : '{' (varDef | funcDef | constructor)* '}';

varDef : type name=Identifier ('=' expression)? ';';
constructor : Identifier '(' ')' suite;

statement
    : suite #blockStatement
    | type name=Identifier ('=' expression)? ';' #vardefStatement
    | If '(' expression ')' trueStmt=statement
            (Else falseStmt=statement)? #ifStatement
    | For '(' (initialStmt=statement | ';') conditionExpr=expression? ';' stepExpr=expression? ')' statement #forStatement
    | While '(' expression ')' statement #whileStatement
    | Return expression? ';' #returnStatement
    | Break ';' #breakStatement
    | Continue ';' #continueStatement
    | expression ';' #expressionStatement
    | ';' #emptyStatement
    ;

expression
    : '(' expression ')' #priorityExpr
    | constants  #constantExpr
    | varName=Identifier #variableExpr
    | This #thisExpr
    | funcName=Identifier '(' expression? (','expression)* ')' #funcCallExpr
    | className=expression '.' memberName=Identifier #classMemExpr
    | className=expression '.' funcName=Identifier '(' expression? (','expression)* ')' #classFuncExpr
    | arrayName=expression '[' index=expression ']' ('[' index=expression ']')* #arrayVisitExpr
    | New type ('[' expression ']')* #newExpr
    | Null #nullExpr
    | op=('++' | '--' | '!' | '~' | '-') expression #leftExpr
    | expression op=('++' | '--') #rightExpr
    | expression op=('+' | '-' | '*' | '/' | '%' | '<<' | '>>') expression #binaryExpr
    | expression op=('==' | '!=' | '>' | '<' | '>=' | '<=') expression #boolExpr
    | expression op=('&&' | '||') expression #logicExpr
    | '!' expression #notExpr
    | expression '?' expression ':' expression #ternaryExpr
    | <assoc=right> expression '=' expression #assignExpr
    | ( FormatEmpty
      | (FormatBegin expression (FormatMid expression)* FormatEnd)) #formatString
    ;

type : BasicType (Left_Bracket RightBracket)*;

BasicType
    : Int
    | Bool
    | String
    | Identifier
    ;

FormatBegin : 'f"' (FormatChar | EscapeSequence | '$$')* '$';
FormatEmpty : 'f"' (FormatChar | EscapeSequence | '$$')* '"';
FormatEnd : '$' (FormatChar | EscapeSequence | '$$')* '"';
FormatMid : '$' (FormatChar | EscapeSequence | '$$')* '$';

// Constants
constants
    : DecInteger #intCons
    | StringCons #strCons
    | array_Cons #arrCons
    | (True | False) #boolCons
    ;
DecInteger
    : [1-9] [0-9]*
    | '0'
    ;

StringCons : '"' (PrintableChar | EscapeSequence | '$$')* '"';

array_Cons : '{'  array_Content? '}';
array_Content : constants (',' constants)*;

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
Main : 'main';

Identifier
    : [a-zA-Z] [a-zA-Z_0-9]*
    ;
Whitespace
    :   [ \t\r\n] +
        -> skip
    ;
PrintableChar : [\u0020\u0023-\u007E]; // no "
FormatChar : [\u0020\u0021\u0023\u0025-\u007E]; // no " $
EscapeSequence : '\\' [n"\\];
