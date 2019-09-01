#!/bin/sh

# configure kubectl if the user did not mount a kubeconfig file
if [ ! -f /kubeconfig ]; then
  echo ${KUBERNETES_CONFIGURATION:?} | base64 -d > /kubeconfig
fi

export KUBECONFIG="/kubeconfig"

exec "$@"

