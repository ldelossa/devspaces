include ../lib/defines

FEDORA_VERSION_ID = 36
CONTAINER_NAME = ebpf
CONTAINER_VERSION = 0.0.3

.PHONY: $(CONTAINER_NAME) run

$(CONTAINER_NAME):
	docker build --build-arg version_id=$(FEDORA_VERSION_ID) -t $(CONTAINER_TAG) .
	docker tag $(CONTAINER_TAG) $(REPO_CONTAINER_NAME)

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
		--entrypoint "sleep" \
		 $(CONTAINER_TAG) \
		 "infinity" 2>/dev/null
	docker exec -it -w $(HOME_PATH)/git/ebpf $(CONTAINER_NAME) zsh
