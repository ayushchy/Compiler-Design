%{
#include<stdio.h>
%}
%%

 


[ /t] ;

 

[ + | - | * | / | % | = ] { printf("\n%s is a arithmatic operator",yytext); }

 

[; | ,] { printf("\n%s is a separator",yytext); }

 


if |
for |
while |
goto |
do |
switch |
case |
break |
continue |
void |
include       { printf("\n%s is a keyword",yytext); }

 

"$" { return 0;}

 

[0-9]+  { printf("\n %s is a constant",yytext); }

 

[a-zA-Z_][a-zA-Z0-9_]* { printf("\n%s is an identifier",yytext); }

 

 

[.|\n] ECHO;
%%
main()
{
yylex();
}
int yywrap()
{
return 0;
}
