#!/bin/sh

# configure kubectl if the user did not mount a kubeconfig file
if [ ! -f /kubeconfig ]; then
  echo ${KUBERNETES_CONFIGURATION:?} | base64 -d > /kubeconfig
fi

mkdir -p /root/.kube
cp /kubeconfig /root/.kube/config

exec "$@"

