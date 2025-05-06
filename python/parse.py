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

    def formal(self, name, sort):
        sort_ = self.type(sort)
        var_ = self.formula_manager.Symbol(name, sort_)
        return var_

    def formals(self, sexpr):
        return [self.formal(sym.name, sort) for sym, sort in sexpr]

    def formula(self, scope, sexpr):
        term_ = self.term(scope, sexpr)
        assert term_.get_type().is_bool_type()
        return term_

    def assign(self, scope, name, rhs):
        var_ = scope[name]
        rhs_ = self.term(scope, rhs)
        assert var_.get_type() == rhs_.get_type()
        return (var_, rhs_)

    def term(self, scope, sexpr):
        match sexpr:
            case Numeral(value):
                return self.formula_manager.Int(int(value))

            case Symbol("true"):
                return self.formula_manager.TRUE()

            case Symbol(name) if name in scope:
                return scope[name]

            case _:
                raise ValueError("Not an term: " + str(sexpr))
    
    def statement(self, scope, sexpr):
        match sexpr:
            case (Symbol("!"), body, *attributes):
                body_ = self.statement(scope, body)
                body_.attributes += attributes
                return body_

            case (Symbol("return"),):
                return Return()

            case (Symbol("break"),):
                return Break()

            case (Symbol("continue"),):
                return Continue()

            case (Symbol("assume"), arg):
                arg_ = self.formula(scope, arg)
                return Assume(arg_)

            case (Symbol("assign"), pairs):
                pairs_ = [ self.assign(scope, sym.name, rhs) for sym, rhs in pairs ]
                return Assign(pairs_)

            case (Symbol("havoc"), vars):
                vars_ = [ scope[sym.name] for sym in vars ]
                return Havoc(vars_)

            case (Symbol("label"), Symbol(name)):
                return Label(name)

            case (Symbol("goto"), Symbol(name)):
                return Goto(name)

            case (Symbol("if"), condition, iftrue):
                condition_ = self.formula(scope, condition)
                iftrue_ = self.statement(scope, iftrue)
                return If(condition_, iftrue_)

            case (Symbol("if"), condition, iftrue, iffalse):
                condition_ = self.formula(scope, condition)
                iftrue_ = self.statement(scope, iftrue)
                iffalse_ = self.statement(scope, iffalse)
                return If(condition_, iftrue_, iffalse)

            case (Symbol("while"), condition, body):
                condition_ = self.formula(scope, condition)
                body_ = self.statement(scope, body)
                return While(condition_, body_)

            case (Symbol("sequence"), *statements):
                statements_ = [
                    self.statement(scope, statement) for statement in statements
                ]
                return Sequence(statements_)

            case (Symbol("choice"), *statements):
                statements_ = [
                    self.statement(scope, statement) for statement in statements
                ]
                return Choice(statements_)

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
                expr_ = self.formula({}, expr)
                print(expr_)

            case (Symbol("declare-var"), Symbol(name), sort):
                assert name not in self.globals
                sort_ = self.type(sort)
                var_ = self.formula_manager.Symbol(name, sort_)
                self.globals[name] = var_
                return DeclareVar(var_)

            case (Symbol("define-proc"), Symbol(name), inputs, outputs, locals, body):
                formals = inputs + outputs + locals
                names_ = [sym.name for sym, sort in formals]
                assert len(names_) == len(set(names_))

                inputs_ = self.formals(inputs)
                outputs_ = self.formals(outputs)
                locals_ = self.formals(locals)
                vars_ = inputs_ + outputs_ + locals_

                scope_ = self.globals | dict(zip(names_, vars_))
                body_ = self.statement(scope_, body)

                proc_ = Procedure(name, inputs_, outputs_, locals_, body_)
                return DeclareProc(proc_)

            case _:
                raise ValueError("Not a command: " + str(sexpr))
