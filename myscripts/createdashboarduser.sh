echo "This command will create a service account for a dashboard in the default namespace"
kubectl create serviceaccount dashboard -n default
echo "Add the cluster binding rules to your dashboard account"
kubectl create clusterrolebinding dashboard-admin -n default --clusterrole=cluster-admin --serviceaccount=default:dashboard
echo "Copy the secret token required for your dashboard login using the below command"
kubectl get secret $(kubectl get serviceaccount dashboard -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" | base64 --decode > DashbUserToken.txt
echo
echo "Token store in DashbUserToken.txt or copy follow Output"
cat DashbUserToken.txt
