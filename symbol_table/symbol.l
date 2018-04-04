al [A-Za-z]
dt [0-9]

%%

[\t \n]
"int"  return INT;
"float" return FLOAT;
"double" return DOUBLE;
"char"   return CHAR;
{dt}+    return NUM;
{al}({al}|{dt})* return ID;
.                return yytext[0];
