from dataclasses import dataclass

import ply.lex as lex
import ply.yacc as yacc


class Token:
    # TODO: add file and line number information here
    pass


class Literal(Token):
    pass


@dataclass
class Numeral(Literal):
    value: str


@dataclass
class Decimal(Literal):
    value: str


@dataclass
class Hexadecimal(Literal):
    value: str


@dataclass
class Binary(Literal):
    value: str


@dataclass
class String(Literal):
    value: str


@dataclass
class Symbol(Token):
    name: str


@dataclass
class Keyword(Token):
    name: str


tokens = (
    "COMMENT",
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

t_COMMENT = r";[^\n]+\n"

t_LPAREN = r"\("
t_RPAREN = r"\)"

t_NUMERAL = r"0|[1-9][0-9]*"
t_DECIMAL = r"(0|[1-9][0-9]*)\.[0-9]+"
t_HEXADECIMAL = r"\#x[0-9a-fA-F]+"
t_BINARY = r"\#b[01]+"
t_STRING = r"\".*\""

t_KEYWORD = r":[a-zA-Z][a-zA-Z0-9]*"
t_SYMBOL = r"([a-zA-Z~!@$%&*_+=<>.?/\^]|-)([a-zA-Z0-9~!@$%&*_+=<>.?/\^]|-)*"
t_QSYMBOL = r"\|[^\|]*\|"

t_ignore = " \t\n\r"


def p_expr_numeral(p):
    "expr : NUMERAL"
    p[0] = Numeral(p[1])


def p_expr_decimal(p):
    "expr : DECIMAL"
    p[0] = Decimal(p[1])


def p_expr_hexadecimal(p):
    "expr : HEXADECIMAL"
    p[0] = Hexadecimal(p[1])


def p_expr_binary(p):
    "expr : BINARY"
    p[0] = Binary(p[1])


def p_expr_string(p):
    "expr : STRING"
    p[0] = String(p[1])


def p_expr_keyword(p):
    "expr : KEYWORD"
    p[0] = Keyword(p[1][1:])


def p_expr_symbol(p):
    "expr : SYMBOL"
    p[0] = Symbol(p[1])


def p_expr_qsymbol(p):
    "expr : QSYMBOL"
    p[0] = Symbol(p[1][1:-1])


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


def p_exprs_comment(p):
    "exprs : exprs COMMENT"
    p[0] = p[1]


def t_error(t):
    raise ValueError("Illegal character '%s'" % t.value[0])


def p_error(p):
    print("Syntax error in input!")


def read(text):
    parser = yacc.yacc(start="exprs")
    return parser.parse(text, lexer=lex.lex())
