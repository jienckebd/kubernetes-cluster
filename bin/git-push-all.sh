#!/usr/bin/env bash

alias cs="git add -A; git commit -m WIP; git push origin master"
shopt -s expand_aliases

cd /Users/bry/sys/docker/image/gcloud-sdk
cs

cd /Users/bry/sys/docker/image/helmfile
cs

cd /Users/bry/sys/docker/image/kubectl
cs

cd /Users/bry/sys/docker/image/nginx
cs

cd /Users/bry/sys/docker/image/php-fpm
cs

cd /Users/bry/sys/docker/image/satis
cs


cd /Users/bry/sys/helm/chart/cluster-storage-connector
cs

cd /Users/bry/sys/helm/chart/nginx-php-fpm
cs


cd /Users/bry/sys/kubernetes/cluster/sysf
cs


cd /Users/bry/sys/platform/sysf
cs


cd /Users/bry/sys/terraform/cluster/google
cs
