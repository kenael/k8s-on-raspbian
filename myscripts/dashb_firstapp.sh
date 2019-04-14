#!/usr/bin/env bash
set +e
source $(dirname $0)/lib/functions.sh
kubeconfig
echo "Create Roles and User"
$KUBECTL apply -f clusterrole.yml
# ./createdashboarduser.sh
echo "Deploy First APP and Dashboard"
$KUBECTL create --save-config -f kubernetes-dashboard-arm-head.yml
$KUBECTL create --save-config -f function_test.yml
