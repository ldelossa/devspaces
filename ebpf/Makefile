include ../lib/defines

CONTAINER_NAME = ebpf
CONTAINER_VERSION = 0.0.1
WORKING_DIR = $(HOME_PATH)/git/ebpf

.PHONY: $(CONTAINER_NAME) run

$(CONTAINER_NAME):
	$(LIB_BUILD_CONTAINER)

.SILENT:
run:
	$(LIB_BUILD_IF_REQUIRED)
	# allow fail, you'll just attach next to the running container.
	-$(RUNTIME) run -d --privileged \
		-l devspace \
		-v $(SYS_PATH):$(SYS_PATH) \
		-v /etc/group:/etc/group:ro \
		-v /etc/passwd:/etc/passwd:ro \
		-v /etc/shadow:/etc/shadow:ro \
		-v $(HOME_PATH):$(HOME_PATH) \
		--user $(UID):$(GID) \
		--name $(CONTAINER_NAME) \
		 $(CONTAINER_TAG) 2> /dev/null
	$(RUNTIME) exec -it -w $(WORKING_DIR) $(CONTAINER_NAME) zsh
