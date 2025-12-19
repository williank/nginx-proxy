.PHONY: help build up down logs restart clean ps

COMPOSE=docker compose
BASE_FILE=.docker/docker-compose.yaml
OVERRIDE_FILE=.docker/docker-compose.custom.yaml

help:
	@echo "Comandos disponíveis:"
	@echo "  make build    - Build das imagens"
	@echo "  make up       - Sobe os containers"
	@echo "  make down     - Derruba os containers"
	@echo "  make restart  - Reinicia os containers"
	@echo "  make logs     - Logs em tempo real"
	@echo "  make ps       - Lista containers"
	@echo "  make clean    - Remove containers e volumes"

build:
	docker build -t nginxproxy/nginx-proxy:custom -f .docker/Dockerfile .

up:
	docker compose -f $(BASE_FILE) up -d

down:
	docker compose -f $(BASE_FILE) down

restart: down up

logs:
	docker compose -f $(BASE_FILE) logs -f

ps:
	docker compose -f $(BASE_FILE) ps

clean:
	docker compose -f $(BASE_FILE) down -v
