%{
#include <iostream>
#include <string>
#include <vector>
#include "../include/ast.h"

using namespace std;

extern int yylex();
extern int yyparse();

typedef struct yy_buffer_state * YY_BUFFER_STATE;
extern YY_BUFFER_STATE cmd_scan_string(const char * str); // it does not work.
extern YY_BUFFER_STATE cmd_scan_buffer(char *, size_t);
extern void cmd_delete_buffer(YY_BUFFER_STATE buffer);
extern void cmd_switch_to_buffer(YY_BUFFER_STATE buffer);



int cmderror(const char * p)
{
    cerr << p << endl;
    return 0;
}



%}

%define api.prefix {cmd}


%union {
    int intval;
    double floatval;
    char* ident;
};

%token<floatval> FLOAT
%token<intval>   INT

%token<ident> IDENT

%token T_PLUS T_MINUS T_DIVIDE T_MULTIPLY T_OPAREN T_CPAREN T_QUIT T_INFO T_GO

%type<floatval> float_expr
%type<intval> int_expr


%left T_PLUS T_MINUS
%left T_MULTIPLY T_DIVIDE

%%

program:                
    line            
    | program line 
    ;

line:
    ;



%%

int eval(std::string line)
{
    YY_BUFFER_STATE buffer = cmd_scan_string(line.c_str());
    cmd_switch_to_buffer(buffer);
    int rv = cmdparse();

    return rv;
}

void clean_up()
{
}

