#!/usr/bin/env python3

import ply.lex as lex
import ply.yacc as yacc

tokens = (
    "LPAREN",
    "RPAREN",
    "NUMERAL",
    "DECIMAL",
    "HEXADECIMAL",
    "BINARY",
    "STRING",
    "KEYWORD",
    "SYMBOL",
    "QSYMBOL",
)

t_LPAREN = r"\("
t_RPAREN = r"\)"

t_NUMERAL = r"0|[1-9][0-9]*"
t_DECIMAL = r"(0|[1-9][0-9]*)\.[0-9]+"
t_HEXADECIMAL = r"\#x[0-9a-fA-F]+"
t_BINARY = r"\#b[01]+"
t_STRING = r"\".*\""

t_KEYWORD = r":[a-zA-Z][a-zA-Z0-9]*"
t_SYMBOL = r"([a-zA-Z~!@$%&*_+=<>.?/]|-|^])([a-zA-Z0-9~!@$%&*_+=<>.?/]|-|^])*"
t_QSYMBOL = r"\|[^\|]*\|"

t_ignore = " \t\n\r"


def p_expr_constant(p):
    """expr : NUMERAL
    | DECIMAL
    | HEXADECIMAL
    | BINARY
    | STRING"""
    p[0] = p[1]


def p_expr_symbol(p):
    """expr : KEYWORD
    | SYMBOL
    | QSYMBOL"""
    p[0] = p[1]


def p_expr_compound(p):
    "expr : LPAREN exprs RPAREN"
    p[0] = tuple(p[2])


def p_exprs_first(p):
    "exprs :"
    p[0] = []


def p_exprs_more(p):
    "exprs : exprs expr"
    p[1].append(p[2])
    p[0] = p[1]


def t_error(t):
    raise ValueError("Illegal character '%s'" % t.value[0])


def p_error(p):
    print("Syntax error in input!")


def lexer():
    return lex.lex()


def parser():
    return yacc.yacc(start="exprs")
