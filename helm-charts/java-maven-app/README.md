# push to nexus
sudo vi /etc/docker/daemon.json
sudo systemctl restart docker
docker build -t 192.168.138.154:5000/repository/docker-hosted/java-maven-app:1.0 .
docker login 192.168.138.154:5000
docker push 192.168.138.154:5000/repository/docker-hosted/java-maven-app:1.0

# secret.yaml
dockerconfigjson: $(cat ~/.docker/config.json |base64 -w 0)


helm install java-maven-app-release ~/workspace/kind-cluster/helm-charts/java-maven-app --create-namespace

helm uninstall java-maven-app-release --namespace apps