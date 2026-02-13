.PHONY: run format test lint

MAIN = dotfiles-openjck-setup

run:
	./dotfiles-openjck-setup

format:
	uv run isort $(MAIN)
	uv run black $(MAIN)

test: lint

lint:
	uv run pyright $(MAIN)
	uv run isort --check $(MAIN)
	uv run black --check $(MAIN)
	uv run flake8 --max-line-length 88 $(MAIN) # black uses 88 as the max line length.
