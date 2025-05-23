from dataclasses import dataclass


class Statement:
    # keywords are stored without leading :
    attributes = dict()


@dataclass
class Return(Statement):
    pass


@dataclass
class Break(Statement):
    pass


@dataclass
class Continue(Statement):
    pass


@dataclass
class Assume(Statement):
    formula: object


@dataclass
class Assign(Statement):
    pairs: list[tuple[object, object]]


@dataclass
class Havoc(Statement):
    vars: list[object]


@dataclass
class Label(Statement):
    name: str


@dataclass
class Goto(Statement):
    name: str


@dataclass
class Call(Statement):
    name: str
    inputs: list[object]
    outputs: list[object]


@dataclass
class If(Statement):
    condition: object
    iftrue: Statement
    iffalse: Statement


@dataclass
class While(Statement):
    condition: object
    body: Statement


def Skip():
    return Sequence([])


@dataclass
class Sequence(Statement):
    statements: list[Statement]


@dataclass
class Choice(Statement):
    statements: list[Statement]


@dataclass
class Procedure:
    name: str
    inputs: list[object]
    outputs: list[object]
    locals: list[object]
    body: Statement


class Command:
    pass


@dataclass
class DeclareVar(Command):
    var: object


@dataclass
class DeclareProc(Command):
    proc: Procedure


@dataclass
class AnnotateTag(Command):
    tag: str
    attributes: dict


@dataclass
class VerifyCall(Command):
    name: str
    inputs: list[object]


@dataclass
class GetProof(Command):
    pass


@dataclass
class GetCounterexample(Command):
    pass
