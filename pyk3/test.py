#!/usr/bin/env pytest

import os

from .parse import parse

REGRESSION = "../examples/regression/"


def test_regressions():
    for path in os.listdir(REGRESSION):
        if path.endswith(".smt2"):
            try_parse(REGRESSION + path)


def try_parse(path):
    with open(path) as file:
        cmds = parse(file.read())
        for cmd in cmds:
            print(cmd)
