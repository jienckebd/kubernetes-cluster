#!/usr/bin/env bash

# gcloud beta container --project "bdbd-310322" clusters create "sys" --zone "us-east4-c" --no-enable-basic-auth --cluster-version "1.20.9-gke.701" --release-channel "regular" --machine-type "e2-standard-4" --image-type "COS_CONTAINERD" --disk-type "pd-balanced" --disk-size "100" --metadata disable-legacy-endpoints=true --service-account "sys-admin@bdbd-310322.iam.gserviceaccount.com" --max-pods-per-node "110" --preemptible --num-nodes "3" --logging=SYSTEM,WORKLOAD --monitoring=SYSTEM --enable-ip-alias --network "projects/bdbd-310322/global/networks/default" --subnetwork "projects/bdbd-310322/regions/us-east4/subnetworks/default" --no-enable-intra-node-visibility --default-max-pods-per-node "110" --enable-autoscaling --min-nodes "0" --max-nodes "5" --no-enable-master-authorized-networks --addons HorizontalPodAutoscaling,HttpLoadBalancing,GcePersistentDiskCsiDriver --enable-autoupgrade --enable-autorepair --max-surge-upgrade 1 --max-unavailable-upgrade 0 --enable-shielded-nodes --node-locations "us-east4-c"

# gcloud beta container --project "bdbd-310322" clusters create "bd" --zone "us-east4-c" --no-enable-basic-auth --cluster-version "1.21.4-gke.301" --release-channel "rapid" --machine-type "e2-standard-4" --image-type "COS_CONTAINERD" --disk-type "pd-balanced" --disk-size "100" --metadata disable-legacy-endpoints=true --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --max-pods-per-node "110" --preemptible --num-nodes "3" --logging=SYSTEM,WORKLOAD --monitoring=SYSTEM --enable-private-nodes --master-ipv4-cidr "172.16.0.0/28" --enable-ip-alias --network "projects/bdbd-310322/global/networks/sys1" --subnetwork "projects/bdbd-310322/regions/us-east4/subnetworks/subnet-us-east-192" --no-enable-intra-node-visibility --default-max-pods-per-node "110" --enable-autoscaling --min-nodes "3" --max-nodes "5" --no-enable-master-authorized-networks --addons HorizontalPodAutoscaling,HttpLoadBalancing,GcePersistentDiskCsiDriver --enable-autoupgrade --enable-autorepair --max-surge-upgrade 1 --max-unavailable-upgrade 0 --enable-shielded-nodes --node-locations "us-east4-c"

kubectl create secret generic ssh-config -n default --from-file=/Users/bry/sys/etc/k8s/ssh-config
kubectl create secret tls "tls-sys" -n default --cert=/etc/letsencrypt/live/sysf.one/fullchain.pem --key=/etc/letsencrypt/live/sysf.one/privkey.pem

kubectl create namespace env-admin
kubectl get secret tls-sys --namespace=default -o yaml | sed 's/namespace: .*/namespace: env-admin/' | kubectl apply --namespace=env-admin -f -
kubectl create secret generic config-grafana -n env-admin --from-file=/Users/bry/sys/etc/grafana.ini 
kubectl get secret tls-sys --namespace=default -o yaml | sed 's/namespace: .*/namespace: env-admin/' | sed 's/name: tls-sys/name: grafana.admin.sys.sysf.one-tls/' | kubectl apply --namespace=env-admin -f -

kubectl create namespace env-prd
kubectl get secret mariadb --namespace=default -o yaml | sed 's/namespace: .*/namespace: env-prd/' | kubectl apply --namespace=env-prd -f -

kubectl create namespace env-k10
kubectl get secret tls-sys --namespace=default -o yaml | sed 's/namespace: .*/namespace: env-k10/' | kubectl apply --namespace=env-k10 -f -
kubectl apply -f /Users/bry/sys/etc/k10-oidc-auth.yml

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
# kubectl create secret generic preemptible-killer-secrets -n env-admin --from-file=/Users/bry/sys/etc/gcloud/sa/preemptible-killer.json

# cd ../k8s
# kubectl apply -k ./
# cd -

# cd ../k8s/estafette-gke-preemptible-killer
# kubectl apply -k ./
# cd -

# kubectl annotate storageclass nfs k10.kasten.io/forcegenericbackup="true"
