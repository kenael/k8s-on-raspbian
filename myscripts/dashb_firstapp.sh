#!/usr/bin/env bash
set -e
KUBECONFIG="${KUBECONFIG:-XX}"
if [ ! -d ~/.kube ] || [ "${KUBECONFIG}" != "XX" ]; then
  echo "look Howto to set configuration for kubectl" >&2
  echo "Work with export or $HOME/.kube"
  exit
fi
echo "Create Roles and User"
kubectl apply -f clusterrole.yml
./createdashboarduser.sh
echo "Deploy First APP and Dashboard"
kubectl create --save-config -f kubernetes-dashboard-arm-head.yml
kubectl create --save-config -f function_test.yml
