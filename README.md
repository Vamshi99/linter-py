# linter-py
[![Build Status](https://travis-ci.org/Horta/linter-py.svg?branch=master)](https://travis-ci.org/Ho/linter-py)
[![Package version!](https://img.shields.io/apm/v/linter-py.svg?style=flat)](https://atom.io/packages/linter-py)

This package will lint your opened Python-files in Atom, using [pylint](http://www.pylint.org/).

## Installation

* Install [pylint](http://www.pylint.org/#install).
* `$ apm install linter-py`

## Configuration
* **Executable** Path to your pylint executable. This is useful if you have different versions of pylint for Python 2
  and 3 or if you are using a virtualenv. Use `%p` for the current project (no trailing /).
* **Message Format** Format for Pylint messages where `%m` is the message, `%i` is the numeric message ID (e.g. W0613)
  and `%s` is the human-readable message ID (e.g. unused-argument).
* **Python Path** Paths to be added to the `PYTHONPATH` environment variable. Use `%p` for the current project
  directory (e.g. `%p/vendor`) or `%f` for the directory of the current
  file location.
* **Rc File** Path to pylintrc file. Use `%p` for the current project directory or `%f` for the directory of the current
  file location.
* **Working Directory** Directory pylint is run from. Use `%p` for the current project directory or `%f` for the
  directory of the current file.
* `%p` will fallback to the current file's directory (equivilent to `%f`) if no project directory can be determined.

## Other available linters
There are other linters available - take a look at the linters [mainpage](https://github.com/AtomLinter/Linter).
