# linter-py
[![Build Status](https://travis-ci.org/Horta/linter-py.svg?branch=master)](https://travis-ci.org/Horta/linter-py)
[![Package version!](https://img.shields.io/apm/v/linter-py.svg?style=flat)](https://atom.io/packages/linter-py)

This package will lint your opened Python files in Atom, using [Pylint](http://www.pylint.org/).
It is a fork of [linter-pylint](https://atom.io/packages/linter-pylint) to handle relative imports in Python.

## Installation

1. Install [Pylint](http://www.pylint.org/#install).
2. From command line: `apm install linter-py`

## Configuration

* **Executable** Path to your Pylint executable. This is useful if you have different versions of Pylint for Python 2
  and 3 or if you are using a virtualenv. Use `%p` for the current project (no trailing /).
* **Message Format** Format for Pylint messages where `%m` is the message, `%i` is the numeric message ID (e.g. W0613)
  and `%s` is the human-readable message ID (e.g. unused-argument).
* **Python Path** Paths to be added to the `PYTHONPATH` environment variable. Use `%p` for the current project
  directory (e.g. `%p/vendor`) or `%f` for the directory of the current
  file location.
* **Rc File** Path to pylintrc file. Use `%p` for the current project directory or `%f` for the directory of the current
  file location.
* **Working Directory** Directory Pylint is run from. Use `%p` for the current project directory or `%f` for the
  directory of the current file.
* `%p` will fallback to the current file's directory (equivilent to `%f`) if no project directory can be determined.

## Issues

Please, create an issue on GitHub whenever something goes wrong.
I will do my best to resolve it as quick as possible.

## Why another Python linter for Atom?

The main reason of this package is to properly check relative imports in Python code. This feature is not supported by linter-pylint and a fix to it would require a massive change of its code (or a hacky patch to Pylint for linter-pylint's own sake).
