#!/bin/bash

JENKINS_HOME=~/workspace/kind-cluster/jenkins
JENKINS_KUBERNETES=~/workspace/kind-cluster/jenkins/kubernetes

kubectl apply -f $JENKINS_KUBERNETES/namespace.yaml
helm install jenkins $JENKINS_HOME/helm-chart/ -n jenkins -f $JENKINS_KUBERNETES/values.yaml
kubectl apply -f $JENKINS_KUBERNETES/rbac.yaml