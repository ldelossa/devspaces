FEDORA_VERSION_ID = 36
CONTAINER_NAME=ldelossa/ebpf-compiler
CONTAINER_VERSION = 0.0.2
CONTAINER_TAG = $(CONTAINER_NAME):$(CONTAINER_VERSION)
CONTAINER_INSTANCE=ebpf-compiler-$(RANDOM)
USER = $(shell whoami)
UID = $(shell id -u)
GID = $(shell id -g)
MNT_PATH ?= $($HOME)
SYS_PATH=/sys

.PHONY: ebpf-compiler run

define build_if_required
	$(shell docker inspect ldelossa/ebpf-compiler:$(CONTAINER_VERSION) > /dev/null)
	$(if $(filter .SHELLSTATUS, 0),,make ebpf-compiler)
endef

ebpf-compiler:
	docker build --build-arg version_id=$(FEDORA_VERSION_ID) -t $(CONTAINER_TAG) .

run:
	$(build_if_required)
	container_instance=ebpf-compiler-$RANDOM
	docker run -it --privileged --rm \
		-v $(SYS_PATH):$(SYS_PATH) \
		-v /etc/group:/etc/group:ro \
		-v /etc/passwd:/etc/passwd:ro \
		-v /etc/shadow:/etc/shadow:ro \
		-v /home/$(USER):/home/$(USER) \
		--workdir /home/$(USER) \
		--user $(UID):$(GID) \
		 $(CONTAINER_TAG) 
