from dataclasses import dataclass

import fractions
import functools
import pysmt
import pysmt.environment
import pysmt.smtlib.script
import pysmt.operators

from .sexpr import *
from .syntax import *


def parse(text):
    parser = Parser()
    cmds = read(text)
    cmds_ = [parser.command(cmd) for cmd in cmds]
    return cmds_


class Parser:
    def __init__(self):
        self.environment = pysmt.environment.Environment()
        self.type_manager = self.environment.type_manager
        self.formula_manager = self.environment.formula_manager

        self.sorts = dict()
        self.globals = dict()

        self.constants = set()
        self.functions = dict()

        self.procedures = dict()

        # adapted from pysmt.smtlib.parser.SmtLibParser
        self.builtin = {
            "true": self.environment.formula_manager.TRUE,
            "false": self.environment.formula_manager.FALSE,
            "+": self.formula_manager.Plus,
            "-": self.Minus,
            "*": self.formula_manager.Times,
            # "/": self.formula_manager.Div, # wrong spelling!!
            "div": self.formula_manager.Div,
            # "mod": lambda left, right: self.formula_manager.create_node(node_type=pysmt.operators.MODULUS, args=(left, right)),
            "pow": self.formula_manager.Pow,
            ">": self.formula_manager.GT,
            "<": self.formula_manager.LT,
            ">=": self.formula_manager.GE,
            "<=": self.formula_manager.LE,
            "=": self.formula_manager.EqualsOrIff,
            "not": self.formula_manager.Not,
            "and": self.formula_manager.And,
            "or": self.formula_manager.Or,
            "xor": self.formula_manager.Xor,
            "=>": self.formula_manager.Implies,
            # '<->':self.formula_manager.Iff,
            "ite": self.formula_manager.Ite,
            "distinct": self.formula_manager.AllDifferent,
            "to_real": self.formula_manager.ToReal,
            # Bitvectors
            "concat": self.formula_manager.BVConcat,
            "bvnot": self.formula_manager.BVNot,
            "bvand": self.formula_manager.BVAnd,
            "bvor": self.formula_manager.BVOr,
            "bvneg": self.formula_manager.BVNeg,
            "bvadd": self.formula_manager.BVAdd,
            "bvmul": self.formula_manager.BVMul,
            "bvudiv": self.formula_manager.BVUDiv,
            "bvurem": self.formula_manager.BVURem,
            "bvshl": self.formula_manager.BVLShl,
            "bvlshr": self.formula_manager.BVLShr,
            "bvsub": self.formula_manager.BVSub,
            "bvult": self.formula_manager.BVULT,
            "bvxor": self.formula_manager.BVXor,
            "bvnand": self.formula_manager.BVNand,
            "bvnor": self.formula_manager.BVNor,
            "bvxnor": self.formula_manager.BVXnor,
            "bvcomp": self.formula_manager.BVComp,
            "bvsdiv": self.formula_manager.BVSDiv,
            "bvsrem": self.formula_manager.BVSRem,
            "bvsmod": self.formula_manager.BVSMod,
            "bvashr": self.formula_manager.BVAShr,
            "bvule": self.formula_manager.BVULE,
            "bvugt": self.formula_manager.BVUGT,
            "bvuge": self.formula_manager.BVUGE,
            "bvslt": self.formula_manager.BVSLT,
            "bvsle": self.formula_manager.BVSLE,
            "bvsgt": self.formula_manager.BVSGT,
            "bvsge": self.formula_manager.BVSGE,
            # Strings
            "str.len": self.formula_manager.StrLength,
            "str.++": self.formula_manager.StrConcat,
            "str.at": self.formula_manager.StrCharAt,
            "str.contains": self.formula_manager.StrContains,
            "str.indexof": self.formula_manager.StrIndexOf,
            "str.replace": self.formula_manager.StrReplace,
            "str.substr": self.formula_manager.StrSubstr,
            "str.prefixof": self.formula_manager.StrPrefixOf,
            "str.suffixof": self.formula_manager.StrSuffixOf,
            "str.to.int": self.formula_manager.StrToInt,
            "int.to.str": self.formula_manager.IntToStr,
            "bv2nat": self.formula_manager.BVToNatural,
            # Arrays
            "select": self.formula_manager.Select,
            "store": self.formula_manager.Store,
        }

    def Minus(self, *args):
        if len(args) == 1:
            return self.formula_manager.Minus(self.formula_manager.Int(0), args[0])
        else:
            return functools.reduce(self.formula_manager.Minus, args)

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

            case Symbol(name):
                assert name in self.sorts
                decl_ = self.sorts[name]
                return self.type_manager.get_type_instance(decl_)

            case (Symbol(name), *args):
                assert name in self.sorts
                args_ = [self.type(arg) for arg in args]
                decl_ = self.sorts[name]
                return self.type_manager.get_type_instance(decl_, *args_)

            case _:
                raise ValueError("Not a type: " + str(sexpr))

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

            case Decimal(value):
                return self.formula_manager.Real(fractions.Fraction(value))

            case Symbol(name) if name in scope:
                return scope[name]

            case Symbol(name) if name in self.constants:
                fun_ = self.functions[name]
                return fun_

            case (Symbol(name), *args) if name in self.functions:
                fun_ = self.functions[name]
                args_ = [self.term(scope, arg) for arg in args]
                return self.formula_manager.Function(fun_, args_)

            case Symbol(name) if name in self.builtin:
                return self.builtin[name]()

            case (Symbol(name), *args) if name in self.builtin:
                args_ = [self.term(scope, arg) for arg in args]
                return self.builtin[name](*args_)

            case (Symbol("forall"), vars, body):
                vars_ = self.formals(vars)
                scope_ = scope | dict(vars_)
                body_ = self.term(scope_, body)
                return self.formula_manager.ForAll(vars_, body_)

            case (Symbol("exists"), vars, body):
                vars_ = self.formals(vars)
                scope_ = scope | dict(vars_)
                body_ = self.term(scope_, body)
                return self.formula_manager.Exists(vars_, body_)

            case _:
                raise ValueError("Not a term: " + str(sexpr))

    def attributes(self, *stuff):
        match stuff:
            case []:
                return []
            case [Keyword(name)]:
                return [(name, None)]
            case [Keyword(name), Keyword(_) as next, *rest]:
                return [(name, None)] + self.attributes(next, *rest)
            case [Keyword(name), arg, *rest]:
                return [(name, arg)] + self.attributes(*rest)
            case _:
                raise ValueError("Invalid attributes: " + str(stuff))

    def statement(self, scope, sexpr):
        match sexpr:
            case (Symbol("!"), body, *stuff):
                body_ = self.statement(scope, body)
                stuff_ = dict(self.attributes(*stuff))
                # assert set(body_.attributes.keys()) & set(stuff_.keys()) == {}, "dict is not the correct representation, as attribute keywords can re-occur!"
                body_.attributes |= stuff_
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
                pairs_ = [self.assign(scope, sym.name, rhs) for sym, rhs in pairs]
                return Assign(pairs_)

            case (Symbol("havoc"), vars):
                vars_ = [scope[sym.name] for sym in vars]
                return Havoc(vars_)

            case (Symbol("label"), Symbol(name)):
                return Label(name)

            case (Symbol("goto"), Symbol(name)):
                return Goto(name)

            case (Symbol("call"), Symbol(name), inputs, outputs):
                inputs_ = [self.term(scope, input) for input in inputs]
                outputs_ = [scope[sym.name] for sym in outputs]
                return Call(name, inputs_, outputs_)

            case (Symbol("if"), condition, iftrue):
                condition_ = self.formula(scope, condition)
                iftrue_ = self.statement(scope, iftrue)
                return If(condition_, iftrue_, Skip())

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

            case (Symbol("assert"), condition):
                # condition_ = self.formula(scope, condition)
                statement_ = Skip()
                statement_.attributes["assert"] = condition
                return statement_

            case _:
                raise ValueError("Not a statement: " + str(sexpr))

    def declare_sort(self, decl):
        match decl:
            case (Symbol(name), Numeral(arity)):
                assert name not in self.sorts
                decl_ = self.type_manager.Type(name, int(arity))
                self.sorts[name] = decl_
                return decl_

            case _:
                raise ValueError("Not a type declaration: " + str(decl))

    def declare_fun(self, *decl):
        match decl:
            case (Symbol(name), args, sort):
                assert name not in self.functions
                args_ = [self.type(arg) for arg in args]
                sort_ = self.type(sort)

                if args_:
                    type_ = self.type_manager.FunctionType(sort_, args_)
                    fun_ = self.formula_manager.Symbol(name, type_)
                    self.functions[name] = fun_
                else:
                    fun_ = self.formula_manager.Symbol(name, sort_)
                    self.constants |= name
                    self.functions[name] = fun_  # keep this!

                return fun_

            case _:
                raise ValueError("Not a function declaration: " + str(decl))

    def command(self, sexpr):
        match sexpr:
            case (Symbol("declare-sort"), *decl):
                decl_ = self.declare_sort(decl)
                return pysmt.smtlib.script.SmtLibCommand("declare-sort", [decl_])

            case (Symbol("declare-datatypes"), decls, datatypes):
                # PySMT does not have data types, emulate with sort declarations and uninterpreted functions
                decls_ = [self.declare_sort(decl) for decl in decls]    
                raise ValueError("Data type declarations currently unsupported: " + str(decls))                

            case (Symbol("declare-const"), sym, sort):
                decl_ = self.declare_fun(sym, [], sort)
                return pysmt.smtlib.script.SmtLibCommand("declare-const", [decl_])

            case (Symbol("declare-fun"), sym, args, sort):
                decl_ = self.declare_fun(sym, args, sort)
                return pysmt.smtlib.script.SmtLibCommand("declare-fun", [decl_])

            case (Symbol("declare-var"), Symbol(name), sort):
                assert name not in self.globals
                sort_ = self.type(sort)
                var_ = self.formula_manager.Symbol(name, sort_)
                self.globals[name] = var_
                return DeclareVar(var_)

            case (Symbol("assert"), expr):
                expr_ = self.formula({}, expr)
                return pysmt.smtlib.script.SmtLibCommand("assert", [expr_])

            case (Symbol("define-proc"), Symbol(name), inputs, outputs, locals, body):
                assert name not in self.procedures

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
                self.procedures[name] = proc_

                return DeclareProc(proc_)

            case (Symbol("annotate-tag"), tag, *stuff):
                x = self.attributes(*stuff)
                annotation = dict(x)
                return AnnotateTag(tag, annotation)

            case (Symbol("verify-call"), Symbol(name), inputs):
                inputs_ = [self.term(self.globals, arg) for arg in inputs]
                return VerifyCall(name, inputs_)

            case (Symbol("get-proof"),):
                return GetProof()

            case (Symbol("get-counterexample"),):
                return GetCounterexample()

            case _:
                raise ValueError("Not a command: " + str(sexpr))
