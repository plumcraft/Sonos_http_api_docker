REPOSITORY ?= plumcraft/sonos_http_api
VERSION    ?= 1.0
BUILD_ID   ?= 0
IP_ADDR	   := $(shell ifconfig eno1 | grep 'inet addr:' | cut -d: -f2 | awk '{print $1}')

default: build

build:
	docker build -t $(REPOSITORY):$(VERSION)-$(BUILD_ID) .
	docker tag $(REPOSITORY):$(VERSION)-$(BUILD_ID) $(REPOSITORY):latest

run: 
	docker run --name Sonos_http_api -d \
	  --net=host \
	  $(REPOSITORY):latest

push:
	docker push $(REPOSITORY):$(VERSION)-$(BUILD_ID) 
	docker push $(REPOSITORY):latest

