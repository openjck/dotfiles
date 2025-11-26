.PHONY: format test lint

python = dotfiles-openjck-setup

format:
	poetry run isort $(python)
	poetry run black $(python)

test: lint

lint:
	poetry run isort --check $(python)
	poetry run black --check $(python)
	poetry run flake8 --max-line-length 88 $(python) # black uses 88 as the max line length.
