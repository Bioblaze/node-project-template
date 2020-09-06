#!make
MAKEFLAGS += --silent
include .env
export $(shell sed 's/=.*//' .env)

define COMPOSE_CMD
	docker-compose -p ${PROJECT} \
	--project-directory=. \
	-f ./docker-compose.yml
endef

# Setups the Actual Node Project (NPM)
npm:
	npm install
# Setups the Actual Node Project (Yarn)
yarn:
	yarn install
# Starts with PM2
start:
	pm2 start ecosystem.config.js
# Stops with PM2
stop:
	pm2 stop ecosystem.config.js
# Build Project Image
build:
	docker build -t ${PROJECT}:latest .
# Launches the Container with Docker Compose
up:
	${COMPOSE_CMD} up -d ${SERVICE}
# Pulls Logs for Container with Docker Compose
logs:
	${COMPOSE_CMD} logs -f ${SERVICE}
# Brings the Service down with Docker Compose
down:
	${COMPOSE_CMD} down --remove-orphans
# Drops you into Shell of the Docker Container of the Service
console:
	${COMPOSE_CMD} exec ${SERVICE} /bin/bash

.PHONY: npm
.PHONY: start
.PHONY: stop
.PHONY: build
.PHONY: up
.PHONY: down
.PHONY: logs
.PHONY: console
.PHONY: yarn