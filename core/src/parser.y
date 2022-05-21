%{
#include <iostream>
#include <string>
#include <vector>
#include "../include/ast.h"

using namespace std;

extern int yylex();
extern int yyparse();

typedef struct yy_buffer_state * YY_BUFFER_STATE;
extern YY_BUFFER_STATE dmtr__scan_string(const char * str); // it does not work.
extern YY_BUFFER_STATE dmtr__scan_buffer(char *, size_t);
extern void dmtr__delete_buffer(YY_BUFFER_STATE buffer);
extern void dmtr__switch_to_buffer(YY_BUFFER_STATE buffer);



int dmtr_error(const char * p)
{
    cerr << p << endl;
    return 0;
}



%}

%define api.prefix {dmtr_}


%union {
    int intval;
    double floatval;
    char* ident;
};

%token<floatval> FLOAT
%token<intval>   INT

%token<ident> IDENT

%token PLUS MINUS UMINUS DIVIDE MULTIPLY OPAREN CPAREN EQUALS COLON

%type<floatval> float_expr
%type<intval> int_expr


%left T_PLUS T_MINUS
%left T_MULTIPLY T_DIVIDE
%left UMINUS

%%

program:                
    stmt            
    | program stmt  
    ;

stmt:
    decl
    | int_expr
    | float_expr
    ;

decl:
    IDENT EQUALS expr
    | IDENT COLON IDENT EQUALS expr       
    ;


expr:
    int_expr
    | float_expr
    ;

int_expr:
    INT
    | IDENT
    | OPAREN int_expr CPAREN
    | int_expr PLUS int_expr
    | int_expr MINUS int_expr
    | int_expr DIVIDE int_expr
    | int_expr MULTIPLY int_expr
    | MINUS int_expr %prec UMINUS
    ;

float_expr:
    FLOAT
    | IDENT
    | OPAREN float_expr CPAREN
    | float_expr PLUS float_expr
    | float_expr MINUS float_expr
    | float_expr DIVIDE float_expr
    | float_expr MULTIPLY float_expr
    | MINUS float_expr %prec UMINUS
    ;


%%

int eval(std::string program)
{
    YY_BUFFER_STATE buffer = dmtr__scan_string(program.c_str());
    dmtr__switch_to_buffer(buffer);
    int rv = dmtr_parse();

    return rv;
}

void clean_up()
{
}

