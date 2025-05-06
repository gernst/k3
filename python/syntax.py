from dataclasses import dataclass

import pysmt

class Command:
    pass

@dataclass
class DeclareVar(Command):
    var: pysmt.fnode.FNode