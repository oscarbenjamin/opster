# Script with no arguments and one option, using kwonly syntax
import opster

@opster.command()
def main(*,
         option=('o', False, 'Help for --option')):
    '''Help for pos_noargs_1opt_py3.py'''
    print('Running pos_noargs_1opt_py3.py')
    print('option = {0}'.format(option))

main.command()


