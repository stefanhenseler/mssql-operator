# Makefile for the Docker image synax/mssql-operator
REPOSITORY=synax
CONTAINER_NAME=mssql-operator
VERSION=0.1.$(TRAVIS_BUILD_NUMBER)
BUILD_TEMP_DIR=.build

all: build publish

build:
	docker build -t $(REPOSITORY)/$(CONTAINER_NAME):$(VERSION) .
	docker tag $(REPOSITORY)/$(CONTAINER_NAME):$(VERSION) $(REPOSITORY)/$(CONTAINER_NAME):latest
.PHONY: build

publish: 
	docker login -u $(DOCKER_USERNAME) -p $(DOCKER_PASSWORD)
	docker push $(REPOSITORY)/$(CONTAINER_NAME):latest
.PHONY: publish