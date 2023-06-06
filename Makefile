include ./lib/defines

.PHONY: rebuild

DEVSPACES = "ebpf" "frr" "waybar" "desktop-devel"

help:
	@echo 'help:'
	@echo '	make rebuild - remove and rebuild all devspace images'

rebuild: 
	# kill all devspace containers
	-$(RUNTIME) ps -f "label=devspace" -q | xargs $(RUNTIME) stop
	-$(RUNTIME) ps -f "label=devspace" -q | xargs $(RUNTIME) rm
	# remove all the devspace images
	-$(RUNTIME) images devspace/* -q | xargs $(RUNTIME) rmi --force
	# rebuild home which is base for all other devspace images
	(cd ./home/; make)
	# rebuild all devspaces
	make devspaces

.ONESHELL:
devspaces:
	declare -a spaces=(${DEVSPACES}); 
	for s in $${spaces[@]}; do 
		(cd ~/git/devspaces/$$s; make)
	done

