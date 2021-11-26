#!/usr/bin/env bash

kubectl create ns kasten-io
kubectl apply -f /Users/bry/sys/etc/k10/k10-dr-secret.yaml
helm install k10 kasten/k10 --namespace=kasten-io
sleep 120
kubectl --namespace kasten-io port-forward service/gateway 8080:8000

exit 0

helm install k10-restore kasten/k10restore --namespace=kasten-io \
  --set sourceClusterID=c899451b-8042-4156-ad20-90aa0d173fb8 \
  --set profile.name=gce
