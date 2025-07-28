#!/bin/bash

HELM_CHARTS_HOME=/home/$USER/workspace/kind-cluster/helm-charts
JENKINS_HOME=$HELM_CHARTS_HOME/jenkins

helm upgrade --install jenkins \
    $JENKINS_HOME/helm-chart/ \
    --namespace jenkins \
    --create-namespace \
    --values $JENKINS_HOME/helm-chart/values.yaml \
    --values $JENKINS_HOME/helm-chart/values-override.yaml \
    --atomic \
    --cleanup-on-fail \
    --timeout 10m \
    --debug