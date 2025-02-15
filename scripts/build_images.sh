#!/bin/bash

REGISTRY=${1:-"k3d-registry.localhost:5000"}
TAG=${2:-"latest"}

docker image build -f ./packages/grid/backend/backend.dockerfile --target backend -t $REGISTRY/openmined/grid-backend:$TAG ./packages
docker image build -f ./packages/grid/frontend/frontend.dockerfile --target grid-ui-development -t $REGISTRY/openmined/grid-frontend:$TAG ./packages/grid/frontend
docker image build -f ./packages/grid/seaweedfs/seaweedfs.dockerfile --build-arg SEAWEEDFS_VERSION=3.59 -t $REGISTRY/openmined/grid-seaweedfs:$TAG ./packages/grid/seaweedfs
