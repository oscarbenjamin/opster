# Opster script with 2 required arguments and 1 option using opts format
import opster

opts = [('o', 'option', False, 'Help for --option')]

@opster.command(options=opts)
def main(arg1, arg2, **opts):
    '''Help for pos_2args_1opt_py2.py'''
    print('Running pos_2args_1opt_py2.py')
    print('arg1 = {0}'.format(arg1))
    print('arg2 = {0}'.format(arg2))
    print('option = {0}'.format(opts['option']))

main.command()
