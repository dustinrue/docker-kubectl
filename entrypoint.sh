#!/bin/sh

# configure kubectl
mkdir -p /root/.kube
if [ "${K8S_SECRET_KUBERNETES_CONFIGURATION}" != "" ]; then
  echo ${KUBERNETES_CONFIGURATION} | base64 -d > /root/.kube/config
else
  echo ${KUBERNETES_CONFIGURATION} | base64 -d > /root/.kube/config
fi

exec "$@"

