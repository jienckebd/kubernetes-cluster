#!/usr/bin/env bash

set -e

path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
path_root="${path}/../"

cd "${path_root}"

path_debug="${path_root}/var/k8s/debug"

mkdir -p "${path_debug}"
docker inspect bd_appserver_1 > "${path_debug}/appserver.json"
docker inspect bd_appserver_nginx_1 > "${path_debug}/appserver_nginx.json"
docker inspect bd_database_1 > "${path_debug}/database.json"
docker inspect bd_solr_1 > "${path_debug}/solr.json"
docker inspect bd_redis_1 > "${path_debug}/redis.json"
