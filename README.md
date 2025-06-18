# kind-cluster

kind create cluster --image kindest/node:v1.32.5 --config ~/workspace/kind-cluster/kind-config.yaml

helm uninstall jenkins -n jenkins
helm install jenkins ~/workspace/kind-cluster/helm-charts/jenkins/ -n jenkins --create-namespace -f ~/workspace/kind-cluster/my-helm-charts/jenkins/values.yaml

## Get your 'admin' user password by running:
kubectl exec --namespace jenkins -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password && echo