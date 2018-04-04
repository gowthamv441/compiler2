al [A-Za-z]
dt [0-9]

%%
[\t \n]
{al}({al}|{dt})* return ID;
{dt}+  { return NUM;}
.  return yytext[0];  


%%
