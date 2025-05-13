#!/usr/bin/env pytest

import os

from .parse import parse

REGRESSION = "../examples/regression/"
SV_BENCHMARKS = "../examples/sv-benchmarks/"


def test_regressions():
    try_parse_recursive(REGRESSION)

def tes_sv_benchmarks():
    try_parse_recursive(SV_BENCHMARKS)


def try_parse_recursive(path):
    if os.path.isdir(path):
        for entry in os.listdir(path):
            try_parse_recursive(path + "/" + entry)
    elif path.endswith(".smt2"):
        try_parse(path)

def try_parse(path):
    with open(path) as file:
        cmds = parse(file.read())
        for cmd in cmds:
            print(cmd)
