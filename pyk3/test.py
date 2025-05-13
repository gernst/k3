#!/usr/bin/env pytest

import os
import pytest

from .parse import parse

REGRESSION = "../examples/regression/"
SV_BENCHMARKS = "../examples/sv-benchmarks/"


def find(path, result):
    if os.path.isdir(path):
        for entry in os.listdir(path):
            find(path + "/" + entry, result)
    elif path.endswith(".smt2"):
        result.append(path)

    return result


@pytest.mark.parametrize("path", find(REGRESSION, []))
def test_regression(path):
    try_parse(path)

@pytest.mark.parametrize("path", find(SV_BENCHMARKS, []))
def test_regression(path):
    try_parse(path)

def try_parse(path):
    print(path)
    with open(path) as file:
        cmds = parse(file.read())
        for cmd in cmds:
            print(cmd)
