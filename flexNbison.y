%{  
#include<stdio.h>  
#include<stdlib.h>  //declaration section
%}
%token num alpha INC DEC END  //token is reserved word(like int)
%left '+''-'  //+,_ at same level
%left '*''/'  //
%right '^'   // exponentian
%nonassoc UMINUS  
%% //translation rules
S : E END {printf("\n Accepted\n");exit(0);} //END Root(Start symbol
;

E: E'+'E   
  |E'-'E   
  |E'*'E   
  |E'/'E  
  |E'^'E  
  |'('E')'   
  |'-'E %prec UMINUS  //-E is having same precedence as UMINUS
  |alpha  
  |num  
  |alpha INC  
  |alpha DEC   
;  
%%

int yywrap()
{
return 0;
}
int main()  
{   
 yyparse();  //built in routine to invoke parser 
 return 0;  
}  
yyerror(char *s)  
{  
  printf("\nError");  
}


myfile.l

%{  
#include "myfile.tab.h"  
%}  
%%  
"++" {return INC;}  
"--" {return DEC;}  
[0-9]+ {return num;}  
[a-zA-Z]+ {return alpha;}  
[ \t\n]+     {;} 
"$" { return END; }
.  {return yytext[0];}  
 %%
