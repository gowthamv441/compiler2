al [A-Za-z]
dt [0-9]

%%

[\t \n]       
for             return FOR;
do             return DO; 
while          return WHILE;
{dt}+    return NUM;
{al}({al}|{dt})* return ID;
"<="         {printf("%s",yytext);return LE;}
">="         {printf("%s",yytext);return GE;}
"=="         {printf("%s",yytext);return EQ;}
"!="          {printf("%s",yytext);return NE;}
"||"            {printf("%s",yytext);return OR;}
"&&"         {printf("%s",yytext);return AND;}
"{"          return yytext[0];
"}"          return yytext[0];
"("          return yytext[0];
")"          return yytext[0];
";"          return yytext[0];
.                {return yytext[0];}
