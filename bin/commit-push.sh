#!/usr/bin/env bash

#set -e

path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
path_root="${path}/../"

cd "${path_root}"


docker exec -it bd_appserver_1 bash -c "tar --exclude "/app" --exclude "/user" -czvf /app/backup.appserver.tar.gz /"
mv backup.appserver.tar.gz ~/sys/tmp/lando-kube-bridge
docker import ~/sys/tmp/lando-kube-bridge/backup.appserver.tar.gz gcr.io/bdbd-310322/kube_appserver
docker push gcr.io/bdbd-310322/kube_appserver


#docker exec -it bd_appserver_nginx_1 bash -c "tar --exclude "/app" --exclude "/user" -czvf /app/backup.appserver_nginx.tar.gz /"
#mv backup.appserver_nginx.tar.gz ~/sys/tmp/lando-kube-bridge
#docker import ~/sys/tmp/lando-kube-bridge/backup.appserver_nginx.tar.gz gcr.io/bdbd-310322/kube_appserver_nginx
#docker push gcr.io/bdbd-310322/kube_appserver_nginx


#docker exec -it bd_database_1 bash -c "tar --exclude "/app" --exclude "/user" --exclude "/proc" --exclude "/sys" --exclude "/bitnami/mariadb" --exclude "/opt/bitnami/mariadb/tmp" -czvf /app/backup.database.tar.gz /"
#mv backup.database.tar.gz ~/sys/tmp/lando-kube-bridge
#docker import ~/sys/tmp/lando-kube-bridge/backup.database.tar.gz gcr.io/bdbd-310322/kube_database
#docker push gcr.io/bdbd-310322/kube_database


#docker import ~/sys/tmp/lando-kube-bridge/backup.solr.tar.gz gcr.io/bdbd-310322/kube_solr
#docker push gcr.io/bdbd-310322/kube_solr
#docker exec -it bd_solr_1 bash -c "tar --exclude "/app" --exclude "/user" --exclude "/var/solr/data" -czvf /app/backup.solr.tar.gz /"
#mv backup.solr.tar.gz ~/sys/tmp/lando-kube-bridge


#docker exec -it bd_redis_1 bash -c "tar --exclude "/app" --exclude "/user" --exclude "/proc" --exclude "/sys" --exclude "/data" -czvf /app/backup.redis.tar.gz /"
#mv backup.redis.tar.gz ~/sys/tmp/lando-kube-bridge
#docker import ~/sys/tmp/lando-kube-bridge/backup.redis.tar.gz gcr.io/bdbd-310322/kube_redis
#docker push gcr.io/bdbd-310322/kube_redis
