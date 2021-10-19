#!/usr/bin/env bash

path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
path_root="${path}/../"

cd "${path_root}"

path_backup="${path_root}/var/k8s/backup"

kubectl get po,deployment,rc,rs,ds,no,job -n sys -o yaml > "${path_backup}/sys.yml"
kubectl get po,deployment,rc,rs,ds,no,job --all-namespaces -o yaml > "${path_backup}/all.yml"
