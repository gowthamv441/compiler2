%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
extern char * yytext;
void tablep();
void display();
void display2();
char temp[100][100];
int i=0;
int j;
char dotemp[1000][1000];
int ido=0;
char dotemp1[100][100];
int ido1=0;
%}
%token ID NUM FOR LE GE EQ NE OR AND DO WHILE 


%%

START     : S {printf("Input accepted\n"); exit(0);} ;    
    
S         : ST | ST2 ;

ST2        : DO '{' B2 '}' WHILE  '('  EE  ')'  ';' 	{display(); display2();display();printf("}");} ;
B2      : B2 B2  
           | E1 ';'  {strcpy(dotemp[ido],";");ido++;}
           | S
           |
           ;
EE     : EE '<'{strcpy(dotemp1[ido1],"<");ido1++;} EE
         | EE '>' {strcpy(dotemp1[ido1],">");ido1++;} EE
         | EE LE {strcpy(dotemp1[ido1],"<=");ido1++;} EE
         | EE GE {strcpy(dotemp1[ido1],"<=");ido1++;} EE
         | EE EQ {strcpy(dotemp1[ido1],"==");ido1++;} EE
         | EE NE {strcpy(dotemp1[ido1],"!=");ido1++;} EE
         | EE OR {strcpy(dotemp1[ido1],"||");ido1++;} EE
         | EE AND {strcpy(dotemp1[ido1],"&&");ido1++;} EE
         | ID  {strcpy(dotemp1[ido1],yytext);ido1++;}
         | NUM {strcpy(dotemp1[ido1],yytext);ido1++;}
         ;             


E1        :E1 '='  {strcpy(dotemp[ido],yytext);ido++;}  E1 
          | E1  '+'  L1 
          | E1 '-' L2
          | E1 '*' {strcpy(dotemp[ido],yytext);ido++;} E1
          | E1 '/' {strcpy(dotemp[ido],yytext);ido++;}  E1
          | E1 '<' {strcpy(dotemp[ido],yytext);ido++;}  E1
          | E1 '>' {strcpy(dotemp[ido],yytext);ido++;} E1
          | E1 LE {strcpy(dotemp[ido],yytext);ido++;} E1
          | E1 GE {strcpy(dotemp[ido],yytext);ido++;} E1
          | E1 EQ {strcpy(dotemp[ido],yytext);ido++;} E1
          | E1 NE {strcpy(dotemp[ido],yytext);ido++;} E1
          | E1 OR {strcpy(dotemp[ido],yytext);ido++;} E1
          | E1 AND {strcpy(dotemp[ido],yytext);ido++;} E1
          | ID  {strcpy(dotemp[ido],yytext);ido++;}
          | NUM {strcpy(dotemp[ido],yytext);ido++;} 
          ;
L1        : NUM { strcpy(dotemp[ido],"+");ido++;    strcpy(dotemp[ido],yytext);ido++;}
          | '+' { strcpy(dotemp[ido],"+");ido++;    strcpy(dotemp[ido],yytext);ido++;}
          ;
L2        : NUM { strcpy(dotemp[ido],"-");ido++;    strcpy(dotemp[ido],yytext);ido++;}
          | '-' { strcpy(dotemp[ido],"-");ido++;    strcpy(dotemp[ido],yytext);ido++;}
          ;           
           
           
           
           

ST       : FOR '(' E ';' { printf(";\nWHILE ( "); } E2 {printf(")\n");}  ';' {printf("{\n");}  E3 ')' DD
           ;
DD    : '{' BO '}' { tablep();  printf(";\n}\n");}
           | E';' {printf(";\n");   tablep(); printf(";\n}\n");  }
           | ST
           |
           ;
BO  : BO BO
           | E ';' {printf(" ; \n");}        
           | ST
           |             
           ;        

E3        :E3 '=' {strcpy(temp[i],yytext);i++;} E3 
          | E3  '+'  L3 
          | E3 '-' L4
          | E3 '*' {strcpy(temp[i],yytext);i++;} E3
          | E3 '/' {strcpy(temp[i],yytext);i++;} E3
          | ID  {strcpy(temp[i],yytext);i++;}
          | NUM {strcpy(temp[i],yytext);i++;}
          ;
L3        : NUM {strcpy(temp[i],"+");i++;  strcpy(temp[i],yytext);i++;}
          | '+' {strcpy(temp[i],"+");i++;  strcpy(temp[i],yytext);i++;}
          ;
L4        : NUM {strcpy(temp[i],"-");i++;  strcpy(temp[i],yytext);i++;}
          | '-' {strcpy(temp[i],"-");i++;   strcpy(temp[i],yytext);i++;}
          ;


        
        

E        :E '=' {printf("%s",yytext);} E 
          | E  '+'  L1 
          | E '-' L2
          | E '*' {printf("%s",yytext);} E
          | E '/' {printf("%s",yytext);} E
          | E '<' {printf("%s",yytext);} E
          | E '>' {printf("%s",yytext);} E
          | E LE E
          | E GE E
          | E EQ E
          | E NE E
          | E OR E
          | E AND E
          | ID  {printf("%s",yytext);}
          | NUM {printf("%s",yytext);}
          ;
L1        : NUM {printf("+%s",yytext);}
          | '+' {printf("+%s",yytext);}
          ;
L2        : NUM {printf("-%s",yytext);}
          | '-' {printf("-%s",yytext);}
          ;
E2     : E2 '<'{printf("%s",yytext);} E2
         | E2 '>' {printf("%s",yytext);} E2
         | E2 LE E2
         | E2 GE E2
         | E2 EQ E2
         | E2 NE E2
         | E2 OR E2
         | E2 AND E2
         | ID  {printf("%s",yytext);}
         | NUM {printf("%s",yytext);}
         ;    
%%

#include "lex.yy.c"
main() {
    //printf("Enter the expression:\n");
    yyparse();
}
void tablep()
{
  for(j=i-3;j<i;j++)
    printf("%s",temp[j]);
  i=i-3;
} 
void display()
{
  printf("\n");
   for(j=0;j<ido;j++)
   {
     printf("%s ",dotemp[j]);
     if(strcmp(dotemp[j],";")==0)
       printf("\n");
    }
  
}
void display2()
{
   printf("WHILE(");
   for(j=0;j<ido1;j++)
     printf("%s",dotemp1[j]);
   printf(")\n{\n");

}     
      

