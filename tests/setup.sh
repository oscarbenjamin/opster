#bash
#
# This file should be sourced from the cram test files.

# PYTHON env var can be used to choose the version of Python used.
# This is needed to run with python3 in some cases.
if [ -z "$PYTHON" ]; then
    PYTHON="python"
fi

# OPSTER_DIR can be used to choose the directory containing the Opster module.
# This is needed when running with python3, to test the 2to3-built module.
if [ -z "$OPSTER_DIR" ]; then
    OPSTER_DIR="$TESTDIR/.."
fi
export PYTHONPATH="$OPSTER_DIR"

# Used to accumulate coverage stats
export COVERAGE_FILE="$TESTDIR/coverage.db"

# Define a function as a shorthand for running a script
run() {
    scriptname=$1; shift
    "$PYTHON" "$TESTDIR/$scriptname" "$@"
}
