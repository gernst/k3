import pysmt
import pysmt.environment
import pysmt.smtlib.script

class Factory(factory.Factory):
    def __init__(self):
        self.environment = pysmt.environment.Environment()
        self.type_manager = self.environment.type_manager
        self.formula_manager = self.environment.formula_manager

    def bool(self):
        return self.type_manager.BOOL()

    def int(self):
        return self.type_manager.INT()

    def real(self):
        return self.type_manager.REAL()

    def str(self):
        return self.type_manager.STRING()

    def array(self, dom, ran):
        return self.type_manager.ArrayType(dom_, ran_)

    def bitvec(self, bits):
        return self.type_manager.BVType(bits)

    def sort(self, name, *args):
        decl = self.type_manager.Type(name, len(args))
        return self.type_manager.get_type_instance(decl, *args)


    def numeral(self, value):
        return self.formula_manager.Int(value)

    def decimal(self, value):
        return self.formula_manager.Real(value)

    def apply(self, name, *args):
        pass

    def forall(self, vars, body):
        return self.formula_manager.ForAll(vars, body)

    def exists(self, vars, body):
        return self.formula_manager.Exists(vars, body)

    def declare_sort(self, name, arity):
        sort = self.type_manager.Type(name, arity)
        return sort

    def declare_fun(self, name, args, res):
        if args:
            type = self.type_manager.FunctionType(res, args)
            fun = self.formula_manager.Symbol(name, type)
            return fun
        else:
            fun = self.formula_manager.Symbol(name, res)
            return fun
