#!/bin/bash

# Get the Current Branch Name with "feature/", "custom/", or "bugfix/" stripped out
BRANCH=`git symbolic-ref --short HEAD | sed 's/\feature\///g' | sed 's/\custom\///g' | sed 's/\bugfix\///g'`

if [ "$BRANCH" == "master" ]; then
    DOCKER_TAG=""
else
    DOCKER_TAG=${BRANCH}
fi

echo "Building tomcatbase"
docker build --no-cache=true --tag craftercms/tomcatbase:${DOCKER_TAG} ./tomcatbase

echo "Building Development Full Stack Image"
docker build --no-cache=true --tag craftercms/dev-full:${DOCKER_TAG} ./dev-full

echo "Building Production Authoring Image"
docker build --no-cache=true --tag craftercms/prod-authoring:${DOCKER_TAG} ./prod-authoring

echo "Building Production Delivery Image"
docker build --no-cache=true --tag craftercms/prod-delivery:${DOCKER_TAG} ./prod-delivery
