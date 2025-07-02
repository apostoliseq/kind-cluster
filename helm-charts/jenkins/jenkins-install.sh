#!/bin/bash

HELM_CHARTS_HOME=~/workspace/kind-cluster/helm-charts
JENKINS_HOME=$HELM_CHARTS_HOME/jenkins

helm upgrade --install jenkins \
    $JENKINS_HOME/helm-chart/ \
    --namespace jenkins \
    --values $JENKINS_HOME/helm-chart/values.yaml \
    --atomic \
    --cleanup-on-fail \
    --timeout 10m