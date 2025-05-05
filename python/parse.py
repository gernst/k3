from dataclasses import dataclass

from sexpr import *
from smtlib import *


class Parser:
    def type(self, sexpr):
        match sexpr:
            case Symbol(name):
                return Sort(Symbol(name), [])

            case (Symbol(name), *args):
                args_ = [self.type(arg) for arg in args]
                return Sort(Symbol(name), args_)

    def expression(self, scope, sexpr):
        match sexpr:
            case Literal():
                return sexpr

            case Symbol(name):
                return scope[name]

            case ("forall", binding, body):
                binding = [(name, self.type(typ)) for (name, typ) in binding]
                scope_ = dict(binding_)
                body_ = self.expression(scope + scope_, body)
                return Forall(binding_, body_)

            case ("exists", binding, body):
                binding = [(name, self.type(typ)) for (name, typ) in binding]
                scope_ = dict(binding_)
                body_ = self.expression(scope + scope_, body)
                return Exists(binding_, body_)

            case (Symbol(name), *args):
                args_ = [self.expression(scope, arg) for arg in args]
                return Application(Symbol(name), args_)

            case _:
                raise ValueError("Not an expression: " + sexpr)

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

            case "return":
                return Return()

            case _:
                raise ValueError("Not a statement: " + sexpr)
