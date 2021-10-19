#!/usr/bin/env bash

docker exec -it bd_appserver_1 bash -c "env > /app/files-private/tmp/appserver-env"
docker exec -it bd_appserver_nginx_1 bash -c "env | sed \"s/DNS.11 /DNS.11/\" > /app/files-private/tmp/appserver_nginx-env"
docker exec -it bd_database_1 bash -c "env > /app/files-private/tmp/database-env"
docker exec -it bd_solr_1 bash -c "env > /app/files-private/tmp/solr-env"
docker exec -it bd_redis_1 bash -c "env > /app/files-private/tmp/redis-env"

#kubectl delete secret appserver-env
#kubectl delete secret appserver-override-env
#kubectl delete secret appserver-nginx-env
#kubectl delete secret solr-env
#kubectl delete secret database-env
#kubectl delete secret redis-env

kubectl create secret generic appserver-env --from-env-file=/Users/bry/sys/platform/bd/stateful/files/tmp/appserver-env --dry-run -o yaml \
    | kubectl apply -f -
kubectl create secret generic appserver-override-env --from-env-file=/Users/bry/sys/platform/bd/stateful/files/tmp/appserver-override-env --dry-run -o yaml \
    | kubectl apply -f -
kubectl create secret generic appserver-nginx-env --from-env-file=/Users/bry/sys/platform/bd/stateful/files/tmp/appserver_nginx-env --dry-run -o yaml \
    | kubectl apply -f -
kubectl create secret generic database-env --from-env-file=/Users/bry/sys/platform/bd/stateful/files/tmp/database-env --dry-run -o yaml \
    | kubectl apply -f -
kubectl create secret generic solr-env --from-env-file=/Users/bry/sys/platform/bd/stateful/files/tmp/solr-env --dry-run -o yaml \
    | kubectl apply -f -
kubectl create secret generic redis-env --from-env-file=/Users/bry/sys/platform/bd/stateful/files/tmp/redis-env --dry-run -o yaml \
    | kubectl apply -f -

kubectl get secret appserver-env -o yaml > /Users/bry/sys/platform/bd/var/k8s/etc/env/appserver.yml
kubectl get secret appserver-override-env -o yaml > /Users/bry/sys/platform/bd/var/k8s/etc/env/appserver-override.yml
kubectl get secret appserver-nginx-env -o yaml > /Users/bry/sys/platform/bd/var/k8s/etc/env/appserver-nginx.yml
kubectl get secret database-env -o yaml > /Users/bry/sys/platform/bd/var/k8s/etc/env/database.yml
kubectl get secret solr-env -o yaml > /Users/bry/sys/platform/bd/var/k8s/etc/env/solr.yml
kubectl get secret redis-env -o yaml > /Users/bry/sys/platform/bd/var/k8s/etc/env/redis.yml
