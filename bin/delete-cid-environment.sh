#!/usr/bin/env bash

current_namespace=$(kubectl config view --minify --output 'jsonpath={..namespace}'; echo)

kubectl get ns | grep env- | awk '$1 {print$1}' | while read ns; do
  kubectl config set-context --current --namespace=$ns
  helm ls --all --short | xargs -L1 helm delete
  kubectl delete pods --all --force
  kubectl delete pvc --all --force
  kubectl delete ns $ns --force
done

kubectl config set-context --current --namespace=$current_namespace
