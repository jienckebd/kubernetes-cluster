#!/usr/bin/env bash

set -e

# velero schedule create admin--1h --schedule="@every 1h" --include-namespaces admin --include-cluster-resources true --snapshot-volumes=true --default-volumes-to-restic --ttl 24h0m0s && sleep 600
# velero schedule create env-prd--1h --schedule="@every 1h" --include-namespaces env-prd --snapshot-volumes=true --default-volumes-to-restic --ttl 24h0m0s && sleep 600
# velero schedule create env-ide1--1h --schedule="@every 1h" --include-namespaces env-ide1 --snapshot-volumes=true --default-volumes-to-restic --ttl 24h0m0s && sleep 600

velero schedule create admin--24h --schedule="@every 24h" --include-namespaces admin --include-cluster-resources true --snapshot-volumes=true --default-volumes-to-restic --ttl 720h0m0s && sleep 600
velero schedule create env-prd--24h --schedule="@every 24h" --include-namespaces env-prd --snapshot-volumes=true --default-volumes-to-restic --ttl 720h0m0s && sleep 600
# velero schedule create env-ide1--24h --schedule="@every 24h" --include-namespaces env-ide1 --snapshot-volumes=true --default-volumes-to-restic --ttl 720h0m0s && sleep 600

velero schedule create admin--720h --schedule="@every 720h" --include-namespaces admin --include-cluster-resources true --snapshot-volumes=true --default-volumes-to-restic --ttl 8760h0m0s && sleep 600
velero schedule create env-prd--720h --schedule="@every 720h" --include-namespaces env-prd --snapshot-volumes=true --default-volumes-to-restic --ttl 8760h0m0s && sleep 600
# velero schedule create env-ide1--720h --schedule="@every 720h" --include-namespaces env-ide1 --snapshot-volumes=true --default-volumes-to-restic --ttl 8760h0m0s && sleep 600
