# Makefile for the Docker image synax/mssql-operator

REPOSITORY='synax'
CONTAINER_NAME='mssql-operator'
VERSION='0.1.$(TRAVIS_BUILD_NUMBER)'

all: build docker-build docker-publish

build: 
	GOOS=linux CGO_ENABLED=0 go build -gcflags "-N -l" -o $(CONTAINER_NAME)

docker-build: 
	docker build -t $(REPOSITORY)/$(CONTAINER_NAME):$(VERSION) .

docker-publish: 
	docker login -u $(DOCKER_USERNAME) -p $(DOCKER_PASSWORD)
	docker push $(REPOSITORY)/$(CONTAINER_NAME):$(VERSION)