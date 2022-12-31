#!/usr/bin/env bash

set -e

# velero schedule create admin--1h --schedule="@every 1h" --include-cluster-resources=true --include-namespaces admin --ttl 24h0m0s && sleep 600
# velero schedule create env-prd--1h --schedule="@every 1h" --include-namespaces env-prd --ttl 24h0m0s && sleep 600
# velero schedule create env-ide1--1h --schedule="@every 1h" --include-namespaces env-ide1 --ttl 24h0m0s && sleep 600

velero schedule create default--24h --schedule="@every 24h" --include-cluster-resources=true --include-namespaces default --ttl 720h0m0s && sleep 600
velero schedule create admin--24h --schedule="@every 24h" --include-namespaces admin --ttl 720h0m0s && sleep 600
velero schedule create gitlab--24h --schedule="@every 24h" --include-namespaces gitlab --ttl 720h0m0s && sleep 600
# velero schedule create env-ide1--24h --schedule="@every 24h" --include-namespaces env-ide1 --ttl 720h0m0s && sleep 600

velero schedule create default--720h --schedule="@every 720h" --include-cluster-resources=true --include-namespaces default --ttl 8760h0m0s && sleep 600
velero schedule create admin--720h --schedule="@every 720h" --include-namespaces admin --ttl 8760h0m0s && sleep 600
velero schedule create gitlab--720h --schedule="@every 720h" --include-namespaces gitlab --ttl 8760h0m0s && sleep 600
# velero schedule create env-ide1--720h --schedule="@every 720h" --include-namespaces env-ide1 --ttl 8760h0m0s && sleep 600
