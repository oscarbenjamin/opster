.PHONY: help docs arch test

SHELL ?= /bin/sh
CRAM = cram --shell="$(SHELL)" --preserve-env --verbose
PYTHON3 = python3
BUILD_DIR = `pwd`/build/lib
COVERAGE_FILE = `pwd`/.coveragerc
CRAM3 = PYTHON="$(PYTHON3)" OPSTER_DIR="$(BUILD_DIR)" $(CRAM)

help:
	@echo "Use \`make <target>\` with one of targets:"
	@echo "  docs  build docs"
	@echo "  open  open docs"
	@echo "  arch  update archlinux pkgbuild"
	@echo "  test  run tests"

docs:
	cd docs && make

open:
	cd docs && make open

doctest:
	cd docs && make doctest
	cd docs && $(CRAM) --indent=4 positional.rst

arch:
	python contrib/updatepkg.py

test:
	python opster.py
	$(CRAM) tests/*.2.rst tests/*.23.rst tests/opster.t

test2to3:
	"$(PYTHON3)" setup.py build
	2to3 --doctests_only --write "$(BUILD_DIR)"/opster.py
	"$(PYTHON3)" "$(BUILD_DIR)"/opster.py
	$(CRAM3) tests/*.2.rst tests/*.23.rst tests/*.3.rst tests/opster.t tests/py3k.t

coverage:
	coverage erase
	COVERAGE_PROCESS_START=$(COVERAGE_FILE) make test
	coverage combine
	coverage report

upload:
	python setup.py sdist upload
