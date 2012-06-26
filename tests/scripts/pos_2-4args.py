# Opster script with 2 required arguments and 2 optional positional arguments
import opster

@opster.command()
def main(arg1, arg2, arg3='default3', arg4='default4'):
    '''Help for pos_2-4args.py'''
    print('Running pos_2-4args.py')
    print('arg1 = {0}'.format(arg1))
    print('arg2 = {0}'.format(arg2))
    print('arg3 = {0}'.format(arg3))
    print('arg4 = {0}'.format(arg4))

main.command()
