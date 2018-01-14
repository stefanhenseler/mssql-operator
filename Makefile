# Makefile for the Docker image synax/mssql-operator

REPOSITORY='synax'
CONTAINER_NAME='microservice'
VERSION='0.1'

all: build docker-build docker-publish

build: 
	GOOS=linux CGO_ENABLED=0 go build -gcflags "-N -l" -o $(CONTAINER_NAME)

docker-build: 
	docker build -t $(REPOSITORY)/$(CONTAINER_NAME):$(VERSION) .

docker-publish: 
	docker push $(REPOSITORY)/$(CONTAINER_NAME):$(VERSION)