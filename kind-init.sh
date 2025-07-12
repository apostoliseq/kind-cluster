#!/bin/bash

# https://hub.docker.com/r/kindest/node/tags
KIND_IMAGE_TAG=1.32.5
KIND_IMAGE=kindest/node:v$KIND_IMAGE_TAG
CONFIG_HOME=/home/$USER/workspace/kind-cluster/kind-config.yaml

kind create cluster --image $KIND_IMAGE --config $CONFIG_HOME