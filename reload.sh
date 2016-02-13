#!/bin/bash

echo "Please enter container name. Running:"
echo $(docker ps --format="{{.Names}}" | tr '\n' ' ')
read NAME
echo ""

docker kill --signal HUP $NAME
