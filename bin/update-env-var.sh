#!/usr/bin/env bash

kubectl delete secret -n default sys-env-var-config-prd
kubectl delete secret -n default sys-env-var-config-stg
kubectl delete secret -n default sys-env-var-config-dev
kubectl delete secret -n default sys-env-var-config-ide
kubectl delete secret -n default sys-env-var-config-cid

kubectl delete secret -n default sys-env-var-config -n env-prd
kubectl delete secret -n default sys-env-var-config -n env-stg
kubectl delete secret -n default sys-env-var-config -n env-dev
kubectl delete secret -n default sys-env-var-config -n env-ide1

kubectl create secret generic -n default sys-env-var-config-prd --from-env-file=/Users/bry/sys/etc/k8s/env/prd.env
kubectl create secret generic -n default sys-env-var-config-stg --from-env-file=/Users/bry/sys/etc/k8s/env/stg.env
kubectl create secret generic -n default sys-env-var-config-dev --from-env-file=/Users/bry/sys/etc/k8s/env/dev.env
kubectl create secret generic -n default sys-env-var-config-ide --from-env-file=/Users/bry/sys/etc/k8s/env/ide.env
kubectl create secret generic -n default sys-env-var-config-cid --from-env-file=/Users/bry/sys/etc/k8s/env/cid.env

kubectl get secret sys-env-var-config-prd --namespace=default -o yaml | sed 's/namespace: default/namespace: env-prd/' | sed 's/name: sys-env-var-config-prd/name: sys-env-var-config/' | kubectl apply --namespace=env-prd -f -
kubectl get secret sys-env-var-config-stg --namespace=default -o yaml | sed 's/namespace: default/namespace: env-stg/' | sed 's/name: sys-env-var-config-stg/name: sys-env-var-config/' | kubectl apply --namespace=env-stg -f -
kubectl get secret sys-env-var-config-dev --namespace=default -o yaml | sed 's/namespace: default/namespace: env-dev/' | sed 's/name: sys-env-var-config-dev/name: sys-env-var-config/' | kubectl apply --namespace=env-dev -f -
kubectl get secret sys-env-var-config-ide --namespace=default -o yaml | sed 's/namespace: default/namespace: env-ide1/' | sed 's/name: sys-env-var-config-ide/name: sys-env-var-config/' | kubectl apply --namespace=env-ide1 -f -
