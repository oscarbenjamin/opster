.. -*- mode: rst -*-

==================
 Positional tests
==================

This is the cram test suite for Opster's handling of positional arguments.
This particular test suite is for scripts written with the Python 2 format
(not using keyword-only arguments for options).

First we need to setup::

  $ source "$TESTDIR/setup.sh"

No arguments and 1 option
-------------------------

First we test a simple script that has no arguments and a single option::

  $ run scripts/pos_noargs_1opt_py2.py --help
  pos_noargs_1opt_py2.py [OPTIONS]
  
  Help for pos_noargs_1opt_py2.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help

  $ run scripts/pos_noargs_1opt_py2.py
  Running pos_noargs_1opt_py2.py
  option = False

  $ run scripts/pos_noargs_1opt_py2.py --option
  Running pos_noargs_1opt_py2.py
  option = True

  $ run scripts/pos_noargs_1opt_py2.py arg
  pos_noargs_1opt_py2.py: invalid arguments
  
  pos_noargs_1opt_py2.py [OPTIONS]
  
  Help for pos_noargs_1opt_py2.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help

  $ run scripts/pos_noargs_1opt_py2.py --option arg
  pos_noargs_1opt_py2.py: invalid arguments
  
  pos_noargs_1opt_py2.py [OPTIONS]
  
  Help for pos_noargs_1opt_py2.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help

  $ run scripts/pos_noargs_1opt_py2.py arg --option
  pos_noargs_1opt_py2.py: invalid arguments
  
  pos_noargs_1opt_py2.py [OPTIONS]
  
  Help for pos_noargs_1opt_py2.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help

  $ run scripts/pos_noargs_1opt_py2.py arg --help
  pos_noargs_1opt_py2.py [OPTIONS]
  
  Help for pos_noargs_1opt_py2.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help


Required arguments and options
------------------------------

Now we try a script that has 2 required arguments and 1 option::

  $ run scripts/pos_2args_1opt_py2.py --help
  pos_2args_1opt_py2.py [OPTIONS] ARG1 ARG2
  
  Help for pos_2args_1opt_py2.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help

Run with the appropriate 2 arguments::

  $ run scripts/pos_2args_1opt_py2.py val1 val2
  Running pos_2args_1opt_py2.py
  arg1 = val1
  arg2 = val2
  option = False

  $ run scripts/pos_2args_1opt_py2.py --option val1 val2
  Running pos_2args_1opt_py2.py
  arg1 = val1
  arg2 = val2
  option = True

Now lets try the wrong number of positional arguments::

  $ run scripts/pos_2args_1opt_py2.py --option val1
  pos_2args_1opt_py2.py: invalid arguments
  
  pos_2args_1opt_py2.py [OPTIONS] ARG1 ARG2
  
  Help for pos_2args_1opt_py2.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help

  $ run scripts/pos_2args_1opt_py2.py --option val1 val2 val3
  pos_2args_1opt_py2.py: invalid arguments
  
  pos_2args_1opt_py2.py [OPTIONS] ARG1 ARG2
  
  Help for pos_2args_1opt_py2.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help

  $ run scripts/pos_2args_1opt_py2.py val1
  pos_2args_1opt_py2.py: invalid arguments
  
  pos_2args_1opt_py2.py [OPTIONS] ARG1 ARG2
  
  Help for pos_2args_1opt_py2.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help

  $ run scripts/pos_2args_1opt_py2.py val1 val2 val3
  pos_2args_1opt_py2.py: invalid arguments
  
  pos_2args_1opt_py2.py [OPTIONS] ARG1 ARG2
  
  Help for pos_2args_1opt_py2.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help

