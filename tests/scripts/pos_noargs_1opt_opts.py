# Simplest possible usage of opster.
import opster

opts = [('o', 'option', False, 'Help for --option')]

@opster.command(options=opts)
def main(**opts):
    '''Help for pos_noargs_1opt_opts.py'''
    print('Running pos_noargs_1opt_opts.py')
    print('option = {0}'.format(opts['option']))

main.command()


