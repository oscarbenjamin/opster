# Simplest possible usage of opster.
import opster

@opster.command()
def main():
    '''Help for pos_noargs.py'''
    print('Running pos_noargs.py')

main.command()


