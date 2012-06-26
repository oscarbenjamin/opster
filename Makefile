.PHONY: help docs arch test

SHELL ?= /bin/sh
CRAM = cram --shell="$(SHELL)" --preserve-env
PYTHON3 = python3
BUILD_DIR = `pwd`/build/lib
COVERAGE_FILE = `pwd`/.coveragerc

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
	$(CRAM) tests/opster.t
	$(CRAM) tests/*.2.rst
	$(CRAM) tests/*.23.rst

test2to3:
	"$(PYTHON3)" setup.py build
	2to3 --doctests_only --write "$(BUILD_DIR)"/opster.py
	"$(PYTHON3)" "$(BUILD_DIR)"/opster.py
	PYTHON="$(PYTHON3)" OPSTER_DIR="$(BUILD_DIR)" $(CRAM) tests/opster.t
	PYTHON="$(PYTHON3)" OPSTER_DIR="$(BUILD_DIR)" $(CRAM) tests/py3k.t
	PYTHON="$(PYTHON3)" OPSTER_DIR="$(BUILD_DIR)" $(CRAM) tests/*.23.rst
	PYTHON="$(PYTHON3)" OPSTER_DIR="$(BUILD_DIR)" $(CRAM) tests/*.3.rst

coverage:
	coverage erase
	COVERAGE_PROCESS_START=$(COVERAGE_FILE) make test
	coverage combine
	coverage report

upload:
	python setup.py sdist upload
