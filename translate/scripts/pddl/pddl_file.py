#! /usr/bin/env python

try:
    # Python 3.x
    import builtins
except ImportError:
    # Python 2.x
    import __builtin__ as builtins

import sys
import os.path
import re

from . import parser

from . import tasks


def open(task_filename, domain_filename):
    domain_pddl = parser.parse_nested_list(domain_filename)
    task_pddl = parser.parse_nested_list(task_filename)
    return tasks.Task.parse(domain_pddl, task_pddl)

if __name__ == "__main__":
    open().dump()
