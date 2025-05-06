from dataclasses import dataclass

import pysmt

from sexpr import *
from syntax import *

def parse(cmds):
    parser = Parser()
    cmds_ = [parser.command(cmd) for cmd in cmds]
    return cmds_

class Parser:
    def __init__(self):
        self.environment = pysmt.environment.Environment()
        self.type_manager = self.environment.type_manager
        self.formula_manager = self.environment.formula_manager

        self.sorts = dict()
        self.globals = dict()

    def type(self, sexpr):
        match sexpr:
            case Symbol("Bool"):
                return self.type_manager.BOOL()

            case Symbol("Int"):
                return self.type_manager.INT()

            case Symbol("Real"):
                return self.type_manager.REAL()

            case Symbol("String"):
                return self.type_manager.STRING()

            case (Symbol("_"), Symbol("BitVec"), Numeric(bits)):
                return self.type_manager.BVType(bits)

            case (Symbol("Array"), dom, ran):
                dom_ = type(dom)
                ran_ = type(ran)
                return self.type_manager.ArrayType(dom_, ran_)

            case (Symbol(name), *args):
                assert name in self.sorts
                args_ = [self.type(arg) for arg in args]
                decl_ = self.sorts[name]
                return self.type_manager.get_type_instance(decl_, *args_)

    def expression(self, scope, sexpr):
        match sexpr:
            case Symbol("true"):
                pass

            case Symbol(name) if name in scope:
                return scope[name]

            case _:
                raise ValueError("Not an expression: " + str(sexpr))

    def statement(self, scope, sexpr):
        match sexpr:
            case ("sequence", *statements):
                statements_ = [
                    self.statement(scope, statement) for statement in statements
                ]
                return Sequence(statements_)

            case ("assume", arg):
                arg_ = expression(self, scope, arg)
                return Assume(arg_)

            case ("return",):
                return Return()

            case _:
                raise ValueError("Not a statement: " + str(sexpr))

    def command(self, sexpr):
        match sexpr:
            case (Symbol("declare-sort"), Symbol(name), Numeral(arity)):
                assert name not in self.sorts
                decl_ = self.type_manager.Type(name, int(arity))
                self.sorts[name] = decl_
                return pysmt.smtlib.script.SmtLibCommand("declare-sort", [decl_])

            case (Symbol("assert"), expr):
                expr_ = self.expression({}, expr)
                print(expr_)

            case (Symbol("declare-var"), Symbol(name), sort):
                assert name not in self.globals
                sort_ = self.type(sort)
                var_ = self.formula_manager.Symbol(name, sort_)
                self.globals[name] = var_
                return DeclareVar(var_)

            case (Symbol("declare-proc", Symbol(name), inputs, outputs, locals)):

                pass

            case _:
                raise ValueError("Not a command: " + str(sexpr))
