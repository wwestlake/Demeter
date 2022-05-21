
%{
  #include <iostream>
  #include <sstream>
  #include "parser.hpp"
  #include "../include/lex_utilities.h"

  using namespace std;
  extern int dmtr_lex();


%}

FLOAT     [0-9]+\.{1}[0-9]+([e|E]{1}[+|-]?[0-9]+)?
INT       [0-9][0-9]
HEX_INT   [0x|0X]{1}[0-9A-Fa-f]+
OCT_INT   [0o|0O]{1}[0-7]+ 
BIN_INT   [0b|0B]{1}[0-1]+
IDENT     [a-zA-Z_]{1}[a-zA-Z0-9_]+

%option prefix="dmtr_"
%option noyywrap


%%

[ \t\n]           ;
{FLOAT}         { dmtr_lval.floatval = parse_number<double>(yytext);  return FLOAT; }
{INT}           { dmtr_lval.intval = parse_number<int>(yytext);      return INT; }

{IDENT}         { dmtr_lval.ident = yytext; return IDENT; }
"+"             { return PLUS; }
"-"             { return MINUS; }
"/"             { return DIVIDE; }
"*"             { return MULTIPLY; }
"("             { return OPAREN; }
")"             { return CPAREN; }
"="             { return EQUALS; }
":"             { return COLON; }
"int"
"float"
"char"

%%


