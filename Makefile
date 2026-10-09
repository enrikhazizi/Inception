COMPOSE_FILE := srcs/docker-compose.yml
COMPOSE := docker-compose -f $(COMPOSE_FILE)

all:
	mkdir -p /home/$(USER)/data/db
	mkdir -p /home/$(USER)/data/wordpress
	$(COMPOSE) up --build --force-recreate
down:
	$(COMPOSE) down --remove-orphans

clean: down 
	docker image prune -a

fclean: clean
	docker system prune --volumes 

re: fclean
	$(COMPOSE) up --build --force-recreate

.PHONY: all down clean fclean re
