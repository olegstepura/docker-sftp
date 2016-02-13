#!/bin/bash

DIR=$(dirname $(realpath $0))
. $DIR/docker-shell/shared-functions.sh

VAR=IMAGE docker_select_image
VAR=CONTAINER_NAME docker_enter_container_name
VAR=LOCALPATH DESC="sftp user root" PLACEHOLDER="/docker/www/$(date +"%Y-%M")/" docker_enter_dir
VAR=SSH_PORT DESC="SSH" PLACEHOLDER="22" docker_enter_port

ARGUMENTS="--restart=always --publish $SSH_PORT:22 --volume $LOCALPATH:/srv/www/" docker_run
