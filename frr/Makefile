include ../lib/defines

FEDORA_VERSION_ID = 36
CONTAINER_NAME=frr
CONTAINER_VERSION = 0.0.1

.PHONY $(CONTAINER_NAME):
	docker build --build-arg version_id=$(FEDORA_VERSION_ID) -t $(CONTAINER_TAG) .

