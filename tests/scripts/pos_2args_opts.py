# Opster script with 2 required arguments and no options
import opster

@opster.command(options=[])
def main(arg1, arg2):
    '''Help for pos_2args_opts.py'''
    print('Running pos_2args_opts.py')
    print('arg1 = {0}'.format(arg1))
    print('arg2 = {0}'.format(arg2))

main.command()
