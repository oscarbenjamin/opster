.. -*- mode: rst -*-

==================
 Positional tests
==================

This is the cram test suite for Opster's handling of positional arguments.

First we need to setup::

  $ . "$TESTDIR/setup.sh"

No arguments
------------

First we test a simple Opster script that accepts no arguments or options::

  $ run scripts/pos_noargs.py -h
  pos_noargs.py
  
  Help for pos_noargs.py
  
  options:
  
   -h --help  display help

  $ run scripts/pos_noargs.py --help
  pos_noargs.py
  
  Help for pos_noargs.py
  
  options:
  
   -h --help  display help

  $ run scripts/pos_noargs.py
  Running pos_noargs.py

  $ run scripts/pos_noargs.py arg
  pos_noargs.py: invalid arguments
  
  pos_noargs.py
  
  Help for pos_noargs.py
  
  options:
  
   -h --help  display help

  $ run scripts/pos_noargs.py -w
  error: option -w not recognized
  
  pos_noargs.py
  
  Help for pos_noargs.py
  
  options:
  
   -h --help  display help

  $ run scripts/pos_noargs.py --wrong-option
  error: option --wrong-option not recognized
  
  pos_noargs.py
  
  Help for pos_noargs.py
  
  options:
  
   -h --help  display help

And the corresponding script defined using the ```options=``` syntax::

  $ run scripts/pos_noargs_opts.py -h
  pos_noargs_opts.py
  
  Help for pos_noargs_opts.py
  
  options:
  
   -h --help  display help

  $ run scripts/pos_noargs_opts.py --help
  pos_noargs_opts.py
  
  Help for pos_noargs_opts.py
  
  options:
  
   -h --help  display help

  $ run scripts/pos_noargs_opts.py
  Running pos_noargs_opts.py

  $ run scripts/pos_noargs_opts.py arg
  pos_noargs_opts.py: invalid arguments
  
  pos_noargs_opts.py
  
  Help for pos_noargs_opts.py
  
  options:
  
   -h --help  display help

  $ run scripts/pos_noargs_opts.py -w
  error: option -w not recognized
  
  pos_noargs_opts.py
  
  Help for pos_noargs_opts.py
  
  options:
  
   -h --help  display help

  $ run scripts/pos_noargs_opts.py --wrong-option
  error: option --wrong-option not recognized
  
  pos_noargs_opts.py
  
  Help for pos_noargs_opts.py
  
  options:
  
   -h --help  display help


No arguments and 1 option
-------------------------

Now we test a simple script that has no arguments and a single option::

  $ run scripts/pos_noargs_1opt_opts.py --help
  pos_noargs_1opt_opts.py [OPTIONS]
  
  Help for pos_noargs_1opt_opts.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help

  $ run scripts/pos_noargs_1opt_opts.py
  Running pos_noargs_1opt_opts.py
  option = False

  $ run scripts/pos_noargs_1opt_opts.py --option
  Running pos_noargs_1opt_opts.py
  option = True

  $ run scripts/pos_noargs_1opt_opts.py arg
  pos_noargs_1opt_opts.py: invalid arguments
  
  pos_noargs_1opt_opts.py [OPTIONS]
  
  Help for pos_noargs_1opt_opts.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help

  $ run scripts/pos_noargs_1opt_opts.py --option arg
  pos_noargs_1opt_opts.py: invalid arguments
  
  pos_noargs_1opt_opts.py [OPTIONS]
  
  Help for pos_noargs_1opt_opts.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help

  $ run scripts/pos_noargs_1opt_opts.py arg --option
  pos_noargs_1opt_opts.py: invalid arguments
  
  pos_noargs_1opt_opts.py [OPTIONS]
  
  Help for pos_noargs_1opt_opts.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help

  $ run scripts/pos_noargs_1opt_opts.py arg --help
  pos_noargs_1opt_opts.py [OPTIONS]
  
  Help for pos_noargs_1opt_opts.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help


Required arguments and no options
-----------------------------------

Now we test a script with 2 required positional arguments and no options::

  $ run scripts/pos_2args.py --help
  pos_2args.py ARG1 ARG2
  
  Help for pos_2args.py
  
  options:
  
   -h --help  display help

  $ run scripts/pos_2args.py val1 val2
  Running pos_2args.py
  arg1 = val1
  arg2 = val2

  $ run scripts/pos_2args.py a b c d e --help
  pos_2args.py ARG1 ARG2
  
  Help for pos_2args.py
  
  options:
  
   -h --help  display help

  $ run scripts/pos_2args.py
  pos_2args.py: invalid arguments
  
  pos_2args.py ARG1 ARG2
  
  Help for pos_2args.py
  
  options:
  
   -h --help  display help

  $ run scripts/pos_2args.py val1
  pos_2args.py: invalid arguments
  
  pos_2args.py ARG1 ARG2
  
  Help for pos_2args.py
  
  options:
  
   -h --help  display help

  $ run scripts/pos_2args.py val1 val2 val3
  pos_2args.py: invalid arguments
  
  pos_2args.py ARG1 ARG2
  
  Help for pos_2args.py
  
  options:
  
   -h --help  display help

And the corresponding script defined using the ```options=``` syntax::

  $ run scripts/pos_2args_opts.py --help
  pos_2args_opts.py ARG1 ARG2
  
  Help for pos_2args_opts.py
  
  options:
  
   -h --help  display help

  $ run scripts/pos_2args_opts.py val1 val2
  Running pos_2args_opts.py
  arg1 = val1
  arg2 = val2

  $ run scripts/pos_2args_opts.py a b c d e --help
  pos_2args_opts.py ARG1 ARG2
  
  Help for pos_2args_opts.py
  
  options:
  
   -h --help  display help

  $ run scripts/pos_2args_opts.py
  pos_2args_opts.py: invalid arguments
  
  pos_2args_opts.py ARG1 ARG2
  
  Help for pos_2args_opts.py
  
  options:
  
   -h --help  display help

  $ run scripts/pos_2args_opts.py val1
  pos_2args_opts.py: invalid arguments
  
  pos_2args_opts.py ARG1 ARG2
  
  Help for pos_2args_opts.py
  
  options:
  
   -h --help  display help

  $ run scripts/pos_2args_opts.py val1 val2 val3
  pos_2args_opts.py: invalid arguments
  
  pos_2args_opts.py ARG1 ARG2
  
  Help for pos_2args_opts.py
  
  options:
  
   -h --help  display help


Required arguments and options
------------------------------

Now we try a script that has 2 required arguments and 1 option::

  $ run scripts/pos_2args_1opt_opts.py --help
  pos_2args_1opt_opts.py [OPTIONS] ARG1 ARG2
  
  Help for pos_2args_1opt_py2.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help

Run with the appropriate 2 arguments::

  $ run scripts/pos_2args_1opt_opts.py val1 val2
  Running pos_2args_1opt_py2.py
  arg1 = val1
  arg2 = val2
  option = False

  $ run scripts/pos_2args_1opt_opts.py --option val1 val2
  Running pos_2args_1opt_py2.py
  arg1 = val1
  arg2 = val2
  option = True

Now lets try the wrong number of positional arguments::

  $ run scripts/pos_2args_1opt_opts.py --option val1
  pos_2args_1opt_opts.py: invalid arguments
  
  pos_2args_1opt_opts.py [OPTIONS] ARG1 ARG2
  
  Help for pos_2args_1opt_py2.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help

  $ run scripts/pos_2args_1opt_opts.py --option val1 val2 val3
  pos_2args_1opt_opts.py: invalid arguments
  
  pos_2args_1opt_opts.py [OPTIONS] ARG1 ARG2
  
  Help for pos_2args_1opt_py2.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help

  $ run scripts/pos_2args_1opt_opts.py val1
  pos_2args_1opt_opts.py: invalid arguments
  
  pos_2args_1opt_opts.py [OPTIONS] ARG1 ARG2
  
  Help for pos_2args_1opt_py2.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help

  $ run scripts/pos_2args_1opt_opts.py val1 val2 val3
  pos_2args_1opt_opts.py: invalid arguments
  
  pos_2args_1opt_opts.py [OPTIONS] ARG1 ARG2
  
  Help for pos_2args_1opt_py2.py
  
  options:
  
   -o --option  Help for --option
   -h --help    display help

