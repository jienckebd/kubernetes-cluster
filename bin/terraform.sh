#!/usr/bin/env bash

bash ~/sys/terraform/cluster/google/bin/init.sh
gcloud container clusters get-credentials sysf --zone us-east4-a --project sysf-12

kubectl patch storageclass standard \
    -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"false"}}}'
kubectl patch storageclass gp2 \
    -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'

kubectl create ns gitlab
kubectl apply -f /Users/bry/sys/etc/k8s/secret/gitlab-sso-oidc.yaml

cd /Users/bry/sys/kubernetes/cluster/sysf
helmfile --no-color --environment=gitlab apply
