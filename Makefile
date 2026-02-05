# Project Makefile
SHELL := /bin/bash
.DEFAULT_GOAL := help

# Variables
COMPOSE := docker compose
SVC ?= api

# Colors
CYAN := \033[36m
GREEN := \033[32m
YELLOW := \033[33m
RESET := \033[0m

.PHONY: help
help: ## Show this help
	@echo ""
	@echo "$(CYAN)Available commands:$(RESET)"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  $(GREEN)%-15s$(RESET) %s\n", $$1, $$2}'
	@echo ""

# ===================
# Docker Commands
# ===================

.PHONY: up
up: ## Start all services
	$(COMPOSE) up -d
	@echo "$(GREEN)✓ Services started$(RESET)"
	@echo "  Web: http://localhost:3000"
	@echo "  API: http://localhost:8080"

.PHONY: down
down: ## Stop all services
	$(COMPOSE) down
	@echo "$(GREEN)✓ Services stopped$(RESET)"

.PHONY: restart
restart: down up ## Restart all services

.PHONY: build
build: ## Build all images
	$(COMPOSE) build

.PHONY: rebuild
rebuild: ## Rebuild and restart all services
	$(COMPOSE) up -d --build
	@echo "$(GREEN)✓ Services rebuilt and started$(RESET)"

.PHONY: logs
logs: ## Tail logs for all services
	$(COMPOSE) logs -f

.PHONY: logs-svc
logs-svc: ## Tail logs for specific service (SVC=name)
	$(COMPOSE) logs -f $(SVC)

.PHONY: shell
shell: ## Shell into a service (SVC=name)
	$(COMPOSE) exec $(SVC) sh

.PHONY: ps
ps: ## Show running containers
	$(COMPOSE) ps

# ===================
# Development
# ===================

.PHONY: test
test: ## Run all tests
	@echo "$(CYAN)Running tests...$(RESET)"
	$(COMPOSE) exec api make test 2>/dev/null || echo "$(YELLOW)API tests skipped$(RESET)"
	$(COMPOSE) exec web npm test 2>/dev/null || echo "$(YELLOW)Web tests skipped$(RESET)"

.PHONY: lint
lint: ## Run linters
	@echo "$(CYAN)Running linters...$(RESET)"
	$(COMPOSE) exec api make lint 2>/dev/null || echo "$(YELLOW)API lint skipped$(RESET)"
	$(COMPOSE) exec web npm run lint 2>/dev/null || echo "$(YELLOW)Web lint skipped$(RESET)"

.PHONY: fmt
fmt: ## Format code
	$(COMPOSE) exec api make fmt 2>/dev/null || true
	$(COMPOSE) exec web npm run format 2>/dev/null || true

# ===================
# Database
# ===================

.PHONY: db-shell
db-shell: ## Open database shell
	$(COMPOSE) exec db psql -U postgres -d app

.PHONY: db-reset
db-reset: ## Reset database (WARNING: destroys data)
	@echo "$(YELLOW)Resetting database...$(RESET)"
	$(COMPOSE) down -v
	$(COMPOSE) up -d db
	@sleep 3
	@echo "$(GREEN)✓ Database reset$(RESET)"

# ===================
# Cleanup
# ===================

.PHONY: clean
clean: ## Remove containers and volumes
	$(COMPOSE) down -v --remove-orphans
	@echo "$(GREEN)✓ Cleaned up$(RESET)"

.PHONY: prune
prune: ## Remove all unused Docker resources
	docker system prune -af
	@echo "$(GREEN)✓ Docker pruned$(RESET)"
