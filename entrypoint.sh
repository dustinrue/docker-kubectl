#!/bin/sh

# configure kubectl
mkdir -p /root/.kube
echo ${KUBERNETES_CONFIGURATION} | base64 -d > /root/.kube/config

exec "$@"

