#!/bin/bash

DIR=$(dirname $(realpath $0))
. $DIR/docker-shell/shared-functions.sh

VAR=IMAGE POSSIBLE_NAME="sftp" docker_enter_image_name
VAR=WWW_USER PLACEHOLDER="www" DESC="sftp user name" docker_enter_value
VAR=WWW_PASSWORD DESC="sftp password" docker_enter_password

ARGUMENTS="--build-arg WWW_USER=$WWW_USER --build-arg WWW_PASSWORD=$WWW_PASSWORD" SENSITIVE_DATA="$WWW_PASSWORD" docker_build
