

al [A-Za-z]
dt [0-9]

%%
[\t \n]
"true"  return TR;
"false"  return FL;
"if"   return IF;
"else"  return ELSE;
"while"  return WHILE;
{al}({al}|{dt})* return ID;
{dt}+  { return NUM;}
"<="    return LE;
"<"     return LT;
">="    return GE;
">"     return GT;
"=="    return EQ;
"!="    return NE;
"&&"    return AND;
"||"    return OR;
"!"     return NOT;


.  return yytext[0];  


%%
