from dataclasses import dataclass

class Stmt:
    pass

@dataclass
class Return(Stmt):
    pass

@dataclass
class Assume(Stmt):
    arg: Expr

class Parser:
    def statement(self, scope, sexpr):
        match data:
            case ("sequence", *stmts):
                stmts_ = [self.statement(scope, stmt) for stmt in stmts]
                return Sequence(stmts_)

            case ("assume", arg):
                arg_ = expression(self, scope, arg)
                return Assume(arg_)

            case ("return"):
                return Return()
