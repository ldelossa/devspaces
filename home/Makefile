FEDORA_VERSION_ID = 36
CONTAINER_REPO=ldelossa
CONTAINER_NAME=home
CONTAINER_VERSION = 0.0.1
CONTAINER_TAG = $(CONTAINER_REPO)/$(CONTAINER_NAME):$(CONTAINER_VERSION)
CONTAINER_INSTANCE=$(CONTAINER_NAME)-$(RANDOM)
UID = $(shell id -u)
MNT_PATH=/var/run/user/$(UID)
SYS_PATH=/sys

define build_if_required
	$(shell docker inspect $(CONTAINER_TAG) > /dev/null)
	$(if $(filter .SHELLSTATUS, 0),,make $(CONTAINER_NAME))
endef

.PHONY $(CONTAINER_NAME):
	docker build --build-arg version_id=$(FEDORA_VERSION_ID) -t $(CONTAINER_TAG) .

