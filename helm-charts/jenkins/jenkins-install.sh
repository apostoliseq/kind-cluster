#!/bin/bash

HELM_CHARTS_HOME=/home/$USER/workspace/kind-cluster/helm-charts
JENKINS_HOME=$HELM_CHARTS_HOME/jenkins

NAMESPACE="jenkins"

JENKINS_ADMIN_SECRET="jenkins-admin-secret"
JENKINS_ENV_FILE="$JENKINS_HOME/jenkins.env"

NEXUS_ADMIN_SECRET="nexus-admin-secret"
NEXUS_ENV_FILE="$JENKINS_HOME/nexus.env"

if ! kubectl get namespace $NAMESPACE >/dev/null 2>&1; then
    kubectl create namespace $NAMESPACE
fi

# Check if secret exists
if ! kubectl get secret $JENKINS_ADMIN_SECRET -n $NAMESPACE >/dev/null 2>&1; then
    echo "Creating jenkins-admin secret..."
    
    kubectl create secret generic $JENKINS_ADMIN_SECRET \
        --from-env-file=$JENKINS_ENV_FILE \
        --namespace $NAMESPACE
else
    echo "Secret $JENKINS_ADMIN_SECRET already exists"
fi

if ! kubectl get secret $NEXUS_ADMIN_SECRET -n $NAMESPACE >/dev/null 2>&1; then
    echo "Creating nexus-admin secret..."
    
    kubectl create secret generic $NEXUS_ADMIN_SECRET \
        --from-env-file=$NEXUS_ENV_FILE \
        --namespace $NAMESPACE
else
    echo "Secret $NEXUS_ADMIN_SECRET already exists"
fi

helm upgrade --install jenkins \
    $JENKINS_HOME/helm-chart/ \
    --namespace $NAMESPACE \
    --create-namespace \
    --values $JENKINS_HOME/helm-chart/values.yaml \
    --values $JENKINS_HOME/helm-chart/values-override.yaml \
    --atomic \
    --cleanup-on-fail \
    --timeout 5m \
    --debug