#!make
MAKEFLAGS += --silent
include .env
$(eval export $(shell sed -ne 's/ *#.*$//; /./ s/=.*$$// p' .env))

define COMPOSE_CMD
	docker-compose -p ${PROJECT} \
	--project-directory=. \
	-f ./docker/docker-compose.yml
endef

# Setups the Actual Node Project (NPM)
npm:
	npm install
# Setups the Actual Node Project (Yarn)
yarn:
	yarn install
# Starts with PM2
start:
	pm2 start ecosystem.config.js ${NODE_ENV}
# Stops with PM2
stop:
	pm2 stop ecosystem.config.js
# Build Project Image
build:
	docker build -t ${PROJECT}:latest -f ./docker/Dockerfile .
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
# Deploy to Development Environment 
pm2deploy:
	pm2 deploy ecosystem.config.js ${NODE_ENV}
# Setup Development Environment 
pm2setup:
	pm2 deploy ecosystem.config.js ${NODE_ENV} setup
# Setup Development Environment 
pm2update:
	pm2 deploy ecosystem.config.js ${NODE_ENV} update
.PHONY: npm
.PHONY: start
.PHONY: stop
.PHONY: build
.PHONY: up
.PHONY: down
.PHONY: logs
.PHONY: console
.PHONY: yarn
.PHONY: pm2deploy
.PHONY: pm2setup
.PHONY: pm2update
