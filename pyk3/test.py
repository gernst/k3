import sys

import pysmt.smtlib.parser
import sexpr
import parse

with open("test.smt2") as file:
    cmds = sexpr.parse(file.read())
    cmds = parse.parse(cmds)
    for cmd in cmds:
        print(cmd)
