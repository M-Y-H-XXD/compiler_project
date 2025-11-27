lexer grammar SQLLexer;


//High Priority Rules (Moved to top for Precedence)

// FLOAT must come first
FLOAT       : ( DIGIT+ '.' DIGIT* | '.' DIGIT+ ) ( E [+-]? DIGIT+ )?;

// BRACKET_IDENTIFIER must be next to override Keywords like [SELECT]
BRACKET_IDENTIFIER
    : LBRACK IDENTIFIER_BODY RBRACK
    ;

LBRACK      : '[';
RBRACK      : ']';



//Reserved Keywords (case-insensitive)

SELECT      : S E L E C T;
FROM        : F R O M;
WHERE       : W H E R E;
AND         : A N D;
OR          : O R;
NOT         : N O T;
INSERT      : I N S E R T;
INTO        : I N T O;
VALUES      : V A L U E S;
UPDATE      : U P D A T E;
SET         : S E T;
DELETE      : D E L E T E;
CREATE      : C R E A T E;
TABLE       : T A B L E;
ALTER       : A L T E R;
DROP        : D R O P;
DECLARE     : D E C L A R E;
GO          : G O;
LIKE        : L I K E; 
IN          : I N;     



//Numbers 

INTEGER     : DIGIT+;



// Boolean

TRUE        : T R U E;
FALSE       : F A L S E;


//Strings + Special Cases 
SPLIT_STRING
    : N? SQUOTE
      ( NON_QUOTE_BACKSLASH
      | ESCAPED_SQUOTE
      | ESC_BACKSLASH
      )*
      BACKSLASH NEWLINE
      ( NON_QUOTE_BACKSLASH
      | ESCAPED_SQUOTE
      | ESC_BACKSLASH
      )*
      SQUOTE
    ;

STRING
    : N? SQUOTE
      ( NON_QUOTE_BACKSLASH
      | ESCAPED_SQUOTE
      | ESC_BACKSLASH
      )*
      SQUOTE
    ;



HEX_STRING
    : '0' [xX] HEX_DIGIT+ ( BACKSLASH NEWLINE HEX_DIGIT+ )*
    ;

BIT_STRING
    : '0' [bB] [01]+
    ;


// Operators

PLUS        : '+';
MINUS       : '-';
STAR        : '*';
SLASH       : '/';
PERCENT     : '%';
EQUAL       : '=';

// Compound operators must come first
GREATER_EQUAL : '>='; 
LESS_EQUAL  : '<=';   
NOT_EQUAL   : '<>' | '!=';

GREATER     : '>';
LESS        : '<';

SEMI        : ';';
COMMA       : ',';
LPAREN      : '(';
RPAREN      : ')';
DOT         : '.';

// Bitwise Operators 
BIT_OR      : '|';
BIT_AND     : '&';
BIT_XOR     : '^';
BIT_NOT     : '~';


//Identifiers (Standard Identifier must come last in its group)

IDENTIFIER
    : [a-zA-Z_] [a-zA-Z0-9_]*
    ;


// User Variables

USER_VAR
    : '@' IDENTIFIER
    | '@@' IDENTIFIER
    ;


//Comments 

LINE_COMMENT
    : '--' ~[\r\n]* -> skip
    ;

COMMENT
    : '/*' ( COMMENT | . )*? '*/' -> skip
    ;


// Whitespace 

WS
    : [ \t\r\n]+ -> skip
    ;


// Fragments

fragment DIGIT               : [0-9];
fragment HEX_DIGIT           : [0-9a-fA-F];
fragment NEWLINE             : '\r'? '\n';
fragment BACKSLASH           : '\\';
fragment SQUOTE              : '\'';
fragment E                   : [eE]; 

fragment NON_QUOTE_BACKSLASH : ~[\\'\r\n];
fragment ESCAPED_SQUOTE      : '\'' '\'';
fragment ESC_BACKSLASH       : '\\' '\\';
fragment IDENTIFIER_BODY     : [a-zA-Z_] [a-zA-Z0-9_]*; 



// Case insensitive keyword helpers

fragment A : [aA];
fragment B : [bB];
fragment C : [cC];
fragment D : [dD];
fragment F : [fF];
fragment G : [gG];
fragment H : [hH];
fragment I : [iI];
fragment J : [jJ];
fragment K : [kK];
fragment L : [lL];
fragment M : [mM];
fragment N : [nN];
fragment O : [oO];
fragment P : [pP];
fragment Q : [qQ];
fragment R : [rR];
fragment S : [sS];
fragment T : [tT];
fragment U : [uU];
fragment V : [vV];
fragment W : [wW];
fragment X : [xX];
fragment Y : [yY];
fragment Z : [zZ];