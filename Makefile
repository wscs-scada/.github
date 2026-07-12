.DEFAULT_GOAL := help
.PHONY: help install run lint format format-check typecheck test check clean

help:  ## List available targets
	@grep -E '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) | awk 'BEGIN{FS=":.*?## "}{printf "  %-14s %s\n", $$1, $$2}'

install:  ## Install formatters and git hooks
	npm install
	pre-commit install --install-hooks

run:  ## No runtime (shared CI configuration)
	@echo "Shared CI configuration repository; nothing to run."

lint:  ## Lint YAML (yamllint)
	uvx yamllint .

format:  ## Auto-format YAML/JSON/Markdown
	npx prettier --write .

format-check:  ## Verify formatting
	npx prettier --check .

typecheck:  ## Not applicable
	@echo "typecheck: not applicable for CI configuration."

test:  ## Structural validation (strict yamllint)
	uvx yamllint -s .

check: lint format-check typecheck test  ## Run all gates (lint+format-check+typecheck+test)

clean:  ## Remove installed tooling
	rm -rf node_modules
