up:
	docker compose -f ./srcs/docker-compose.yml up -d

all: up

build-up:
	docker compose -f ./srcs/docker-compose.yml up --build -d

down:
	docker compose -f ./srcs/docker-compose.yml down

rebuild: down build-up

restart: down up

clean:
	docker system prune -f