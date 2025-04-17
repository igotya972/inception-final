COMPOSE_FILE = srcs/docker-compose.yml
ENV_FILE = srcs/.env
VOL_WWW = $(HOME)/data/wordpress
VOL_DB = $(HOME)/data/mariadb

GREEN = \033[0;32m
YELLOW = \033[0;33m
RED = \033[0;31m
RESET = \033[0m

all: prepare up

prepare:
	@echo "$(GREEN)Préparation des volumes...$(RESET)"
	@mkdir -p $(VOL_DB) $(VOL_WWW)
	@chmod 755 $(VOL_WWW)
	@chmod 755 $(VOL_DB)

up:
	@echo "$(GREEN)Construction et démarrage...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) up -d --build nginx mariadb wordpress

down:
	@docker compose -f $(COMPOSE_FILE) down

clean: down
	@docker compose -f $(COMPOSE_FILE) down -v

fclean: clean
	@docker system prune -af
	@echo "$(YELLOW)Suppression des volumes avec sudo...$(RESET)"
	@sudo rm -rf $(VOL_DB) $(VOL_WWW)

restart: down up

logs:
	@docker compose -f $(COMPOSE_FILE) logs -f

re: fclean all

status:
	@docker compose -f $(COMPOSE_FILE) ps

nginx:
	@docker compose -f $(COMPOSE_FILE) up -d --build nginx

mariadb:
	@docker compose -f $(COMPOSE_FILE) up -d --build mariadb

wordpress:
	@docker compose -f $(COMPOSE_FILE) up -d --build wordpress

adminer:
	@docker compose -f $(COMPOSE_FILE) up -d --build adminer

bonus:
	@echo "$(GREEN)Construction et démarrage des bonus...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) up -d --build adminer

.PHONY: all prepare up down clean fclean restart logs re status nginx mariadb wordpress adminer bonus