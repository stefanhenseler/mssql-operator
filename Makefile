# Makefile for the Docker image synax/mssql-operator

REPOSITORY='synax'
CONTAINER_NAME='mssql-operator'
VERSION='0.1.$(TRAVIS_BUILD_NUMBER)'
BUILD_TEMP_DIR='.build'

all: build docker-build docker-publish

build:
	[ -d $(BUILD_TEMP_DIR) ] || mkdir -p $(BUILD_TEMP_DIR)

	GOOS=linux CGO_ENABLED=0 go build -gcflags "-N -l" -o $(BUILD_TEMP_DIR)/$(CONTAINER_NAME)

docker-build: 
	docker build -t $(REPOSITORY)/$(CONTAINER_NAME):$(VERSION) .
	docker tag $(REPOSITORY)/$(CONTAINER_NAME):$(VERSION) $(REPOSITORY)/$(CONTAINER_NAME):latest

docker-publish: 
	docker login -u $(DOCKER_USERNAME) -p $(DOCKER_PASSWORD)
	docker push $(REPOSITORY)/$(CONTAINER_NAME):$(VERSION)