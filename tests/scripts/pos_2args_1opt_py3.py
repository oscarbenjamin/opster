# Opster script with 2 required arguments and 1 option using kwonly format
import opster

@opster.command()
def main(arg1, arg2, *,
         option=('o', False, 'Help for --option')):
    '''Help for pos_2args_1opt_py2.py'''
    print('Running pos_2args_1opt_py2.py')
    print('arg1 = {0}'.format(arg1))
    print('arg2 = {0}'.format(arg2))
    print('option = {0}'.format(option))

main.command()
