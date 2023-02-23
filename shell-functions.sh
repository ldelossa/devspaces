#!/bin/bash 

p="$HOME/git/devspaces"

function devspace() {
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
        echo "
devspace list
devspace stop
devspace rm
devspace {dev container name}
        "
        return
    fi


    cd "$p"/"$1" || return
    make run
}

function devspace-list() {
    docker ps -a --filter=label=devspace --format "table {{.Names}}\t{{.Status}}"
}

function devspace-stop() {
    docker stop "$1"
}

function devspace-rm() {
    docker rm "$1"
}


