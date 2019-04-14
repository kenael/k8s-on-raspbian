#!/bin/bash
set +e
source $(dirname $0)/lib/functions.sh
kubeconfig

if [[ "$(uname -m)" != "armv7l"  ]]; then
  echo "This script work only, on Rpi with Kubernetes-Master installation!" >&2
  exit
fi
echo "Install Waeve Network"
test -f network.yml && kubectl apply -f network.yml
