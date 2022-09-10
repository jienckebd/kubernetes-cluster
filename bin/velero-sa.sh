#!/bin/bash

BUCKET="sysf-12--velero--1"
SERVICE_ACCOUNT_EMAIL=velero1@sysf-12.iam.gserviceaccount.com

ROLE_PERMISSIONS=(
    compute.disks.get
    compute.disks.create
    compute.disks.createSnapshot
    compute.snapshots.get
    compute.snapshots.create
    compute.snapshots.useReadOnly
    compute.snapshots.delete
    compute.zones.get
    storage.objects.create
    storage.objects.delete
    storage.objects.get
    storage.objects.list
)

gcloud iam roles create velero.server1 \
    --project $PROJECT_ID \
    --title "Velero Server 1" \
    --permissions "$(IFS=","; echo "${ROLE_PERMISSIONS[*]}")"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member serviceAccount:$SERVICE_ACCOUNT_EMAIL \
    --role projects/$PROJECT_ID/roles/velero.server1

gsutil iam ch serviceAccount:$SERVICE_ACCOUNT_EMAIL:objectAdmin gs://${BUCKET}


velero install \
    --provider gcp \
    --plugins velero/velero-plugin-for-gcp:v1.4.1 \
    --bucket sysf-12--velero--1 \
    --secret-file ~/sys/etc/gcloud/sa/credentials-velero1 \
    --features=EnableCSI \
    --restic-pod-cpu-request=50m \
    --restic-pod-mem-request=128Mi \
    --velero-pod-cpu-request=50m \
    --velero-pod-mem-request=128Mi
