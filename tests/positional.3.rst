.. -*- mode: rst -*-

==================
 Positional tests
==================

This is the cram test suite for Opster's handling of positional arguments.
This particular set of tests is for scripts written in the Python 3
keyword-only argument style. These tests can only be run with Python 3.

First we need to setup::

  $ . "$TESTDIR/setup.sh"

No arguments and 1 option
-------------------------

First we test a simple script that has no arguments and a single option::

  $ run scripts/pos_noargs_1opt_py3.py --help
  pos_noargs_1opt_py3.py [OPTIONS]
  
  Help for pos_noargs_1opt_py3.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help

  $ run scripts/pos_noargs_1opt_py3.py
  Running pos_noargs_1opt_py3.py
  option = False

  $ run scripts/pos_noargs_1opt_py3.py --option
  Running pos_noargs_1opt_py3.py
  option = True

  $ run scripts/pos_noargs_1opt_py3.py arg
  pos_noargs_1opt_py3.py: invalid arguments
  
  pos_noargs_1opt_py3.py [OPTIONS]
  
  Help for pos_noargs_1opt_py3.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help

  $ run scripts/pos_noargs_1opt_py3.py --option arg
  pos_noargs_1opt_py3.py: invalid arguments
  
  pos_noargs_1opt_py3.py [OPTIONS]
  
  Help for pos_noargs_1opt_py3.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help

  $ run scripts/pos_noargs_1opt_py3.py arg --option
  pos_noargs_1opt_py3.py: invalid arguments
  
  pos_noargs_1opt_py3.py [OPTIONS]
  
  Help for pos_noargs_1opt_py3.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help

  $ run scripts/pos_noargs_1opt_py3.py arg --help
  pos_noargs_1opt_py3.py [OPTIONS]
  
  Help for pos_noargs_1opt_py3.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help


Required arguments and options
------------------------------

Now we try a script that has 2 required arguments and 1 option::

  $ run scripts/pos_2args_1opt_py3.py --help
  pos_2args_1opt_py3.py [OPTIONS] ARG1 ARG2
  
  Help for pos_2args_1opt_py2.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help

Run with the appropriate 2 arguments::

  $ run scripts/pos_2args_1opt_py3.py val1 val2
  Running pos_2args_1opt_py2.py
  arg1 = val1
  arg2 = val2
  option = False

  $ run scripts/pos_2args_1opt_py3.py --option val1 val2
  Running pos_2args_1opt_py2.py
  arg1 = val1
  arg2 = val2
  option = True

Now lets try the wrong number of positional arguments::

  $ run scripts/pos_2args_1opt_py3.py --option val1
  pos_2args_1opt_py3.py: invalid arguments
  
  pos_2args_1opt_py3.py [OPTIONS] ARG1 ARG2
  
  Help for pos_2args_1opt_py2.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help

  $ run scripts/pos_2args_1opt_py3.py --option val1 val2 val3
  pos_2args_1opt_py3.py: invalid arguments
  
  pos_2args_1opt_py3.py [OPTIONS] ARG1 ARG2
  
  Help for pos_2args_1opt_py2.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help

  $ run scripts/pos_2args_1opt_py3.py val1
  pos_2args_1opt_py3.py: invalid arguments
  
  pos_2args_1opt_py3.py [OPTIONS] ARG1 ARG2
  
  Help for pos_2args_1opt_py2.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help

  $ run scripts/pos_2args_1opt_py3.py val1 val2 val3
  pos_2args_1opt_py3.py: invalid arguments
  
  pos_2args_1opt_py3.py [OPTIONS] ARG1 ARG2
  
  Help for pos_2args_1opt_py2.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help


Required and optional positional arguments and options
------------------------------------------------------

Now a script that has both required and optional positional arguments as well
as options::

  $ run scripts/pos_2-4args_1opt_py3.py --help
  pos_2-4args_1opt_py3.py [OPTIONS] ARG1 ARG2 [ARG3] [ARG4]
  
  Help for pos_2-4args_1opt_py3.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help

  $ run scripts/pos_2-4args_1opt_py3.py val1 val2
  Running pos_2-4args_1opt_py3.py
  arg1 = val1
  arg2 = val2
  arg3 = default3
  arg4 = default4
  option = False

  $ run scripts/pos_2-4args_1opt_py3.py val1 val2 --option
  Running pos_2-4args_1opt_py3.py
  arg1 = val1
  arg2 = val2
  arg3 = default3
  arg4 = default4
  option = True

  $ run scripts/pos_2-4args_1opt_py3.py val1 val2 val3
  Running pos_2-4args_1opt_py3.py
  arg1 = val1
  arg2 = val2
  arg3 = val3
  arg4 = default4
  option = False

  $ run scripts/pos_2-4args_1opt_py3.py val1 val2 val3 --option
  Running pos_2-4args_1opt_py3.py
  arg1 = val1
  arg2 = val2
  arg3 = val3
  arg4 = default4
  option = True

  $ run scripts/pos_2-4args_1opt_py3.py val1 val2 val3 val4
  Running pos_2-4args_1opt_py3.py
  arg1 = val1
  arg2 = val2
  arg3 = val3
  arg4 = val4
  option = False

  $ run scripts/pos_2-4args_1opt_py3.py val1 val2 val3 val4 --option
  Running pos_2-4args_1opt_py3.py
  arg1 = val1
  arg2 = val2
  arg3 = val3
  arg4 = val4
  option = True

  $ run scripts/pos_2-4args_1opt_py3.py val1
  pos_2-4args_1opt_py3.py: invalid arguments
  
  pos_2-4args_1opt_py3.py [OPTIONS] ARG1 ARG2 [ARG3] [ARG4]
  
  Help for pos_2-4args_1opt_py3.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help

  $ run scripts/pos_2-4args_1opt_py3.py val1 val2 val3 val4 val5
  pos_2-4args_1opt_py3.py: invalid arguments
  
  pos_2-4args_1opt_py3.py [OPTIONS] ARG1 ARG2 [ARG3] [ARG4]
  
  Help for pos_2-4args_1opt_py3.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help


