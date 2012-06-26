# Simplest possible usage of opster.
import opster

@opster.command(options=[])
def main():
    '''Help for pos_noargs_opts.py'''
    print('Running pos_noargs_opts.py')

main.command()
