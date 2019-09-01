#!/bin/sh

# configure kubectl
mkdir -p /root/.kube

if [ "${K8S_SECRET_KUBERNETES_CONFIGURATION}" != "" ]; then
  KUBERNETES_CONFIGURATION=${K8S_SECRET_KUBERNETES_CONFIGURATION}
fi


echo ${KUBERNETES_CONFIGURATION} | base64 -d > /root/.kube/config

exec "$@"

