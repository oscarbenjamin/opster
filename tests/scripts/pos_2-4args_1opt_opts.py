# Opster script with 2 required arguments and 2 optional positional arguments
# and one option, using the options= format
import opster

opts = [('o', 'option', False, 'Help for --option')]

@opster.command(options=opts)
def main(arg1, arg2, arg3='default3', arg4='default4', **opts):
    '''Help for pos_2-4args_1opt_opts.py'''
    print('Running pos_2-4args_1opt_opts.py')
    print('arg1 = {0}'.format(arg1))
    print('arg2 = {0}'.format(arg2))
    print('arg3 = {0}'.format(arg3))
    print('arg4 = {0}'.format(arg4))
    print('option = {0}'.format(opts['option']))

main.command()
