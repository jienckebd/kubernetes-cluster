#!/usr/bin/env bash

cd /Users/bry/sys/kubernetes/sc

helmfile --environment=admin destroy
kubectl delete pods --all --force -n env-admin
kubectl delete pvc --all -n env-admin

# helmfile --environment=k10 destroy
# kubectl delete pods --all --force -n env-k10
# kubectl delete pvc --all -n env-k10

# helmfile --environment=dev destroy
# kubectl delete pods --all --force -n env-dev
# kubectl delete pvc --all -n env-dev

# helmfile --environment=stg destroy
# kubectl delete pods --all --force -n env-stg
# kubectl delete pvc --all -n env-stg

# helmfile --environment=prd destroy
# kubectl delete pods --all --force -n env-prd
# kubectl delete pvc --all -n env-prd

# export SYS_HELM_NAMESPACE_SUFFIX=ide1
# helmfile --environment=ide destroy
# kubectl delete pods --all --force -n env-ide1
# kubectl delete pvc --all -n env-ide1
# export SYS_HELM_NAMESPACE_SUFFIX=""

bash /Users/bry/sys/kubernetes/sc/bin/delete-released-pv.sh
bash /Users/bry/sys/kubernetes/sc/bin/delete-gcloud-unused-disk.sh
