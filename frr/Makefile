include ../lib/defines

FEDORA_VERSION_ID = 36
CONTAINER_NAME = frr
CONTAINER_VERSION = 0.0.6

.PHONY: run

$(CONTAINER_NAME):
	$(LIB_BUILD_CONTAINER)

.SILENT:
run:
	$(LIB_BUILD_IF_REQUIRED)
	# allow fail, you'll just attach next to the running container.
	-docker run -d --privileged \
		-v $(SYS_PATH):$(SYS_PATH) \
		-v /etc/group:/etc/group:ro \
		-v /etc/passwd:/etc/passwd:ro \
		-v /etc/shadow:/etc/shadow:ro \
		-v $(HOME_PATH):$(HOME_PATH) \
		--user $(UID):$(GID) \
		--name $(CONTAINER_NAME) \
		 $(CONTAINER_TAG) 
	docker exec -it -w $(HOME_PATH)/git/c/frr $(CONTAINER_NAME) zsh

