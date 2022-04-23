#!/usr/bin/env bash

# set -e

gcloud container clusters create sysf \
--no-enable-basic-auth \
--no-enable-master-authorized-networks \
--enable-ip-alias \
--enable-private-nodes \
--image-type "UBUNTU_CONTAINERD" \
--machine-type "c2-standard-4" \
--disk-type "pd-balanced" \
--disk-size "50" \
--preemptible \
--max-pods-per-node "100" \
--num-nodes "5" \
--master-ipv4-cidr 172.16.0.0/28 \
--network "projects/sysf-12/global/networks/sysf" \
--subnetwork "projects/sysf-12/regions/us-east4/subnetworks/us-east4-192" \
--node-labels owner=sysf,zonal=true \
--metadata disable-legacy-endpoints=true \
--enable-stackdriver-kubernetes \
--scopes "https://www.googleapis.com/auth/cloud-platform" \
--addons HorizontalPodAutoscaling,HttpLoadBalancing \
--enable-autoupgrade \
--enable-autorepair \
--labels owner=sysf,zonal=true \
--zone us-east4-a --project sysf-12 \
--system-config-from-file=/Users/bry/sys/etc/k8s/node-system.yml

# gcloud container clusters create sysf2 \
# --no-enable-basic-auth \
# --no-enable-master-authorized-networks \
# --enable-ip-alias \
# --image-type "UBUNTU_CONTAINERD" \
# --machine-type "e2-standard-4" \
# --disk-type "pd-balanced" \
# --disk-size "50" \k
# --preemptible \
# --max-pods-per-node "100" \
# --num-nodes "3" \
# --node-labels owner=sysf,zonal=true \
# --metadata disable-legacy-endpoints=true \
# --enable-stackdriver-kubernetes \
# --scopes "https://www.googleapis.com/auth/cloud-platform" \
# --addons HorizontalPodAutoscaling,HttpLoadBalancing \
# --enable-autoupgrade \
# --enable-autorepair \
# --labels owner=sysf,zonal=true \
# --zone us-east4-a --project sysf-12 \
# --logging="" \
# --monitoring="" \
# --system-config-from-file=/Users/bry/sys/etc/k8s/node-system.yml

kubectl patch storageclass standard \
    -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"false"}}}'

kubectl create secret generic -n default sys-env-var-config-prd --from-env-file=/Users/bry/sys/etc/k8s/env/prd.env
kubectl create secret generic -n default sys-env-var-config-stg --from-env-file=/Users/bry/sys/etc/k8s/env/stg.env
kubectl create secret generic -n default sys-env-var-config-dev --from-env-file=/Users/bry/sys/etc/k8s/env/dev.env
kubectl create secret generic -n default sys-env-var-config-ide --from-env-file=/Users/bry/sys/etc/k8s/env/ide.env
kubectl create secret generic -n default sys-env-var-config-cid --from-env-file=/Users/bry/sys/etc/k8s/env/cid.env

kubectl create secret generic ssh-config -n default --from-file=/Users/bry/sys/etc/k8s/ssh-config

kubectl create namespace admin
kubectl create secret generic config-grafana -n admin --from-file=/Users/bry/sys/etc/k8s/grafana.ini
kubectl create configmap elasticsearch-output -n admin --from-file=/Users/bry/sys/etc/k8s/configmap/elasticsearch-output/fluentd.conf
kubectl create configmap fluentd-forwarder -n admin --from-file=/Users/bry/sys/etc/k8s/configmap/fluentd-forwarder/fluentd.conf

kubectl create namespace gitlab
kubectl create secret generic -n gitlab google-application-credentials --from-file=gcs-application-credentials-file=/Users/bry/sys/etc/gcloud/sa/gitlab-runner.json

cd /Users/bry/sys/kubernetes/cluster/sysf/k8s
kubectl apply -k ./
cd -

cd /Users/bry/sys/kubernetes/cluster/sysf
helmfile --environment=rook-ceph apply
cd -

# kubectl create namespace env-prd
# kubectl get secret mariadb --namespace=default -o yaml | sed 's/namespace: .*/namespace: env-prd/' | kubectl apply --namespace=env-prd -f -

# export project_id="bdbd-310322"
# gcloud iam --project=$project_id service-accounts create preemptible-killer \
#     --display-name preemptible-killer
# gcloud iam --project=$project_id roles create preemptible_killer \
#     --project $project_id \
#     --title preemptible-killer \
#     --description "Delete compute instances" \
#     --permissions compute.instances.delete
# export service_account_email=$(gcloud iam --project=$project_id service-accounts list --filter preemptible-killer --format 'value([email])')
# gcloud projects add-iam-policy-binding $project_id \
#     --member=serviceAccount:${service_account_email} \
#     --role=projects/${project_id}/roles/preemptible_killer
# gcloud iam --project=$project_id service-accounts keys create \
#     --iam-account $service_account_email \
#     /Users/bry/sys/kubernetes/sc/k8s/estafette-gke-preemptible-killer/google_service_account.json

# kubectl -n kube-system create serviceaccount tiller
# kubectl create secret generic preemptible-killer-secrets -n admin --from-file=/Users/bry/sys/etc/gcloud/sa/preemptible-killer.json

# cd ../k8s
# kubectl apply -k ./
# cd -

# cd ../k8s/estafette-gke-preemptible-killer
# kubectl apply -k ./
# cd -
