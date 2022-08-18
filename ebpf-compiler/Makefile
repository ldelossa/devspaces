FEDORA_VERSION_ID = 36
CONTAINER_NAME=ldelossa/ebpf-compiler
CONTAINER_VERSION = 0.0.2
CONTAINER_TAG = $(CONTAINER_NAME):$(CONTAINER_VERSION)
CONTAINER_INSTANCE=ebpf-compiler-$(RANDOM)
UID = $(shell id -u)
MNT_PATH=/var/run/user/$(UID)
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
	mkdir -p $(MNT_PATH)/$(CONTAINER_INSTANCE)
	docker run -it --privileged --rm -v $(MNT_PATH):/mnt -v $(SYS_PATH):$(SYS_PATH) $(CONTAINER_TAG) 
	rm -rf $(MNT_PATH)

