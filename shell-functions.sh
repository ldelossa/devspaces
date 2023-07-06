#!/bin/bash 

p="$HOME/git/devspaces"

function devspace() {
    if [[ "$1" = "ps" ]]; then
        devspace-ps
        return
    fi

    if [[ "$1" = "list" ]]; then
        devspace-list
        return
    fi

    if [[ "$1" = "stop" ]]; then
        devspace-stop "$2"
        return
    fi

    if [[ "$1" = "rm" ]]; then
        devspace-rm "$2"
        return
    fi

    if [[ -z "$1" ]]; then
        echo "devspace ps
devspace list
devspace stop
devspace rm
devspace {dev container name}
        "
        return
    fi

    WORKING_DIR=$(pwd) make -C "$p"/"$1" run
}

function devspace-ps() {
    docker ps -a --filter=label=devspace --format "table {{.Names}}\t{{.Status}}"
}

function devspace-stop() {
    docker stop "$1"
}

function devspace-rm() {
    docker rm "$1"
}

function devspace-list() {
    cd $p
    for d in $(/bin/ls); do
        if [[ -e $d/Dockerfile ]]; then
            echo "$d"
        fi
    done
}


