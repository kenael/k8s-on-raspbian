#!/bin/bash
set -e
if [[ "$(uname -m)" != "armv7l"  ]]; then
  echo "This script work only, on Rpi with Kubernetes-Master installation!" >&2
  exit
fi
KUBECONFIG="${KUBECONFIG:-XX}"
if [ ! -d ~/.kube ] || [ "${KUBECONFIG}" != "XX" ]; then
  echo "look Howto to set configuration for kubectl" >&2
  echo "Work with export or $HOME/.kube"
  exit
fi
echo "Install Waeve Network"
test -f network.yml && kubectl apply -f network.yml
