from sexpr import *


class Type:
    pass


@dataclass
class Sort(Type):
    name: Symbol
    arguments: list[Type]


class Expression:
    pass


@dataclass
class Application(Expression):
    function: Symbol
    arguments: list[Expression]


@dataclass
class Forall(Expression):
    binding: dict[str, Type]
    body: Expression


@dataclass
class Exists(Expression):
    binding: dict[str, Type]
    body: Expression


class Statement:
    pass


@dataclass
class Return(Statement):
    pass


@dataclass
class Assume(Statement):
    arg: Expression
