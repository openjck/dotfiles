.PHONY: format test lint

python = dotfiles-openjck-setup

format:
	isort $(python)
	black $(python)

test: lint

lint:
	isort --check $(python)
	black --check $(python)
	flake8 --max-line-length 88 $(python) # black uses 88 as the max line length.
