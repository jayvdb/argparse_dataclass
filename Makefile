.PHONY: all
all:
	@echo "Please choose a target"

.PHONY: clean
clean:
	rm -rf dist
	rm -rf build
	rm -rf .tox
	rm -rf *.egg-info

.PHONY: readme
readme:
	python -c "import argparse_dataclass; print(argparse_dataclass.__doc__.strip())" > README.rst

.PHONY: test
test:
	python -m doctest argparse_dataclass.py

.PHONY: build
build: test readme
	rm -rf dist build
	python setup.py sdist
	python setup.py bdist_wheel

.PHONY: black
black:
	black *.py

.PHONY: publish
publish: clean readme build
	twine upload dist/*
