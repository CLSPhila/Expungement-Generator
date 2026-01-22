
SHELL := /bin/bash

ifneq (,$(wildcard ./.env))
    include .env
    export
endif

.PHONY: docker
docker:
	docker build -f Dockerfile --platform=linux/amd64 --tag ${REPOSITORY}/${IMAGENAME}:${TAG} . 
	docker build -f db_dockerfile --platform=linux/amd64 --tag ${REPOSITORY}/${IMAGENAME}_db:${TAG} .

.PHONY: push
push:
	docker push ${REPOSITORY}/${IMAGENAME}:${TAG}
	docker push ${REPOSITORY}/${IMAGENAME}_db:${TAG}

.PHONY: build-push
build-push: 
	docker push ${REPOSITORY}/${IMAGENAME}:${TAG}
	docker push ${REPOSITORY}/${IMAGENAME}_db:${TAG}
