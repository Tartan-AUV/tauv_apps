
# builds the docker container
.PHONY: build
build:
	docker-compose build

# Builds and starts the docker container in the background
.PHONY: up
up: kill 
	docker-compose up -d

# Kills the docker container
.PHONY: kill
kill:
	docker-compose kill && docker-compose rm 

# Attaches a shell to the docker container
.PHONY: attach
attach:
	docker-compose exec tauvservice /bin/bash

.PHONY: rm
rm:
	docker-compose rm

# Same as up, but also recreates the docker-compose config. (reloads the yaml, basically)
.PHONY: recreate-up
recreate-up: build
	docker-compose up -d --force-recreate
