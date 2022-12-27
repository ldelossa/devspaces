include ../lib/defines

FEDORA_VERSION_ID = 36
CONTAINER_NAME = home
CONTAINER_VERSION = 0.0.1

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
		 $(CONTAINER_TAG) 
	$(RUNTIME) exec -it -w $(HOME_PATH) $(CONTAINER_NAME) zsh
