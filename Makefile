up:
	docker compose -f ./srcs/docker-compose.yml up -d
build-up:
	docker compose -f ./srcs/docker-compose.yml up --build -d
down:
	docker compose -f ./srcs/docker-compose.yml down
re: down up