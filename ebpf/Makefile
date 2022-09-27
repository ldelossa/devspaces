include ../lib/defines

CONTAINER_NAME = ebpf
CONTAINER_VERSION = 0.0.5

.PHONY: $(CONTAINER_NAME) run

$(CONTAINER_NAME):
	$(LIB_BUILD_CONTAINER)

.SILENT:
run:
	$(BUILD_IF_REQUIRED)
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
	docker exec -it -w $(HOME_PATH)/git/ebpf $(CONTAINER_NAME) zsh
