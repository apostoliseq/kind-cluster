#!/bin/bash

JENKINS_HOME=~/workspace/kind-cluster/jenkins

helm upgrade --install jenkins \
    $JENKINS_HOME/helm-chart/ \
    --values $JENKINS_HOME/values.yaml \
    --atomic \
    --cleanup-on-fail \
    --timeout 10m