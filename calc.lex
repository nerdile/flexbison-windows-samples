/* MOF file parser */

%option noyywrap

%{
    #include "heading.h"
    #include "bison.hpp"
    int yyerror(char *s);
%}

digit [0-9]
int_const {digit}+

%%

{int_const}     { yylval.int_val = atoi(yytext); return INTEGER_LITERAL; }
"+"             { yylval.op_val = new std::string(yytext); return PLUS; }
"*"             { yylval.op_val = new std::string(yytext); return MULT; }

[ \t]*          {}
[\n]            { yylineno++; }

.               { std::cerr << "SCANNER "; yyerror(""); exit(1); }
