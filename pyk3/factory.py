class Factory:
    def bool(self):
        return self.sort("Bool")

    def int(self):
        return self.sort("Int")

    def real(self):
        return self.sort("Real")

    def str(self):
        return self.sort("String")

    def array(self, dom, ran):
        return self.sort("Array", dom, ran)

    def bitvec(self, bits):
        pass

    def sort(self, name, *args):
        pass


    def numeral(self, value):
        pass

    def decimal(self, value):
        pass

    def apply(self, name, *args):
        pass

    def forall(self, bound, body):
        pass

    def exists(self, bound, body):
        pass


    def declare_sort(self, name, arity):
        pass

    def define_sort(self, name, args, typ):
        pass

    def declare_fun(self, name, args, res):
        pass

    def define_fun(self, name, args, res, body):
        pass