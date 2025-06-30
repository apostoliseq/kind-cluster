add rbac
update plugin

helm uninstall jenkins -n jenkins
kubectl apply -f ~/workspace/kind-cluster/jenkins/kubernetes/namespace.yaml
helm install jenkins ~/workspace/kind-cluster/jenkins/helm-chart/ -n jenkins -f ~/workspace/kind-cluster/jenkins/kubernetes/values.yaml
kubectl apply -f ~/workspace/kind-cluster/jenkins/kubernetes/rbac.yaml

## Get your 'admin' user password by running:
kubectl exec --namespace jenkins -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password && echo