.DEFAULT_GOAL := help

.PHONY: help
help: ## Show this help message
	@printf "\033[33mUsage:\033[0m\n  make [target] [arg=\"val\"...]\n\n\033[33mTargets:\033[0m\n"
	@grep -E '^[-a-zA-Z0-9_\.\/]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[32m%-15s\033[0m %s\n", $$1, $$2}'

.PHONY: init
init: ## Creates the .env file
	@echo "Creating the .env file..."
	@cp app/.env.dist app/.env

.PHONY: build
build: ## Builds the docker container
	@echo "Building the docker container..."
	@docker compose build

.PHONY: run
run: ## Starts the docker container
	@echo "Starting the docker container..."
	@docker compose up -d

.PHONY: stop
stop: ## Stops the docker container
	@echo "Stopping the docker container..."
	@docker compose stop

.PHONY: down
down: ## Stops and removes the docker container
	@echo "Stopping and removing the docker container..."
	@docker compose down

.PHONY: sh
sh: ## Starts a shell in the docker container
	@echo "Starting a shell in the docker container..."
	@docker compose exec tensorflow-jupyter sh

.PHONY: venv
venv: ## Create a venv for IDE intellisense
	@echo "Creating a virtual environment..."
	@if [ "$(OS)" == "Windows_NT" ]; then \
		make windows_venv; \
	else \
		make linux_venv; \
	fi
	@echo "Installing the requirements..."
	pip install -r requirements.txt

windows_venv:
	@python -m venv venv
	@echo "Activating the virtual environment..."
	@venv/Scripts/activate

linux_venv:
	@python3 -m venv venv
	@echo "Activating the virtual environment..."
	@source venv/bin/activate
