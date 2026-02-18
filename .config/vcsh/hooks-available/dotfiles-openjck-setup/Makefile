.PHONY: format lint

format:
	uv run isort .
	uv run black .

lint:
	uv run isort --check .
	uv run black --check .
	uv run pyright .
	uv run flake8 .
