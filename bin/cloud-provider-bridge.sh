#!/usr/bin/env bash

# exit 0

# set -e

kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/master/client/config/crd/snapshot.storage.k8s.io_volumesnapshotclasses.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/master/client/config/crd/snapshot.storage.k8s.io_volumesnapshotcontents.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/master/client/config/crd/snapshot.storage.k8s.io_volumesnapshots.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/master/deploy/kubernetes/snapshot-controller/rbac-snapshot-controller.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/master/deploy/kubernetes/snapshot-controller/setup-snapshot-controller.yaml

kubectl apply -f https://raw.githubusercontent.com/nginxinc/kubernetes-ingress/main/deployments/common/crds/k8s.nginx.org_globalconfigurations.yaml
kubectl apply -f https://raw.githubusercontent.com/nginxinc/kubernetes-ingress/main/deployments/common/crds/k8s.nginx.org_transportservers.yaml
kubectl apply -f https://raw.githubusercontent.com/nginxinc/kubernetes-ingress/main/deployments/common/crds/k8s.nginx.org_virtualserverroutes.yaml
kubectl apply -f https://raw.githubusercontent.com/nginxinc/kubernetes-ingress/main/deployments/common/crds/k8s.nginx.org_virtualservers.yaml
kubectl apply -f https://raw.githubusercontent.com/nginxinc/kubernetes-ingress/main/deployments/common/crds/k8s.nginx.org_policies.yaml

kubectl apply -f /Users/bry/sys/ref/bitnami-helm-charts/bitnami/kubeapps/crds/apprepository-crd.yaml

kubectl apply -f /Users/bry/sys/project/bitnami-charts/bitnami/kube-prometheus/crds

# gcloud beta container --project "sysf-12" clusters create "sysf" --zone "us-east4-a" --no-enable-basic-auth --cluster-version "1.22.11-gke.400" --release-channel "regular" --machine-type "c2-standard-4" --image-type "UBUNTU_CONTAINERD" --disk-type "pd-balanced" --disk-size "50" --metadata disable-legacy-endpoints=true --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --max-pods-per-node "110" --spot --num-nodes "5" --enable-private-nodes --master-ipv4-cidr "172.16.0.0/28" --enable-ip-alias --network "projects/sysf-12/global/networks/sysf" --subnetwork "projects/sysf-12/regions/us-east4/subnetworks/us-east4-192" --no-enable-intra-node-visibility --default-max-pods-per-node "110" --enable-autoscaling --min-nodes "5" --max-nodes "8" --no-enable-master-authorized-networks --addons HorizontalPodAutoscaling,HttpLoadBalancing,GcePersistentDiskCsiDriver --enable-autoupgrade --enable-autorepair --max-surge-upgrade 1 --max-unavailable-upgrade 0 --maintenance-window-start "2022-09-01T05:00:00Z" --maintenance-window-end "2022-09-01T09:00:00Z" --maintenance-window-recurrence "FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR,SA,SU" --enable-vertical-pod-autoscaling --enable-shielded-nodes --node-locations "us-east4-a"

# gcloud container clusters create sysf \
# --no-enable-basic-auth \
# --no-enable-master-authorized-networks \
# --enable-ip-alias \
# --enable-private-nodes \
# --image-type "UBUNTU_CONTAINERD" \
# --machine-type "c2-standard-4" \
# --disk-type "pd-balanced" \
# --disk-size "50" \
# --preemptible \
# --max-pods-per-node "100" \
# --num-nodes "5" \
# --master-ipv4-cidr 172.16.0.0/28 \
# --network "projects/sysf-12/global/networks/sysf" \
# --subnetwork "projects/sysf-12/regions/us-east4/subnetworks/us-east4-192" \
# --node-labels owner=sysf,zonal=true \
# --metadata disable-legacy-endpoints=true \
# --enable-stackdriver-kubernetes \
# --scopes "https://www.googleapis.com/auth/cloud-platform" \
# --addons HorizontalPodAutoscaling,HttpLoadBalancing \
# --enable-autoupgrade \
# --enable-autorepair \
# --labels owner=sysf,zonal=true \
# --zone us-east4-a --project sysf-12 \
# --system-config-from-file=/Users/bry/sys/etc/k8s/node-system.yml

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

# kubectl patch storageclass efs-sc \
#     -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'

# kubectl patch storageclass ceph-block \
#     -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"false"}}}'
# kubectl patch storageclass efs-sc \
#     -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'

# kubectl label ns kube-system namespace-node-affinity=enabled
# # kubectl annotate --overwrite ns kube-system scheduler.alpha.kubernetes.io/node-selector='k8s.sysf.one/nodegroup=persistent'

# kubectl label ns kube-node-lease namespace-node-affinity=enabled
# # kubectl annotate --overwrite ns kube-node-lease scheduler.alpha.kubernetes.io/node-selector='k8s.sysf.one/nodegroup=persistent'

# kubectl label ns kube-public namespace-node-affinity=enabled
# # kubectl annotate --overwrite ns kube-public scheduler.alpha.kubernetes.io/node-selector='k8s.sysf.one/nodegroup=persistent'

# kubectl label ns default namespace-node-affinity=enabled
# kubectl annotate --overwrite ns default scheduler.alpha.kubernetes.io/node-selector='k8s.sysf.one/nodegroup=persistent'

kubectl create secret generic -n default sys-env-var-config-prd --from-env-file=/Users/bry/sys/etc/k8s/env/prd.env &&
kubectl create secret generic -n default sys-env-var-config-stg --from-env-file=/Users/bry/sys/etc/k8s/env/stg.env &&
kubectl create secret generic -n default sys-env-var-config-dev --from-env-file=/Users/bry/sys/etc/k8s/env/dev.env &&
kubectl create secret generic -n default sys-env-var-config-ide --from-env-file=/Users/bry/sys/etc/k8s/env/ide.env &&
kubectl create secret generic -n default sys-env-var-config-cid --from-env-file=/Users/bry/sys/etc/k8s/env/cid.env

kubectl create namespace admin
# kubectl label ns admin namespace-node-affinity=enabled
# kubectl annotate --overwrite ns admin scheduler.alpha.kubernetes.io/node-selector='k8s.sysf.one/nodegroup=ephemeral'
kubectl create secret generic config-grafana -n admin --from-file=/Users/bry/sys/etc/k8s/grafana.ini
kubectl create configmap elasticsearch-output -n admin --from-file=/Users/bry/sys/etc/k8s/configmap/elasticsearch-output/fluentd.conf
kubectl create configmap fluentd-forwarder -n admin --from-file=/Users/bry/sys/etc/k8s/configmap/fluentd-forwarder/fluentd.conf

kubectl create namespace gitlab
# kubectl label ns gitlab namespace-node-affinity=enabled
# kubectl annotate --overwrite ns gitlab scheduler.alpha.kubernetes.io/node-selector='k8s.sysf.one/nodegroup=ephemeral'
kubectl apply -f /Users/bry/sys/etc/k8s/secret/gitlab-sso-oidc.yaml

kubectl create namespace gitlab-runner
# kubectl label ns gitlab-runner namespace-node-affinity=enabled
# kubectl annotate --overwrite ns gitlab-runner scheduler.alpha.kubernetes.io/node-selector='k8s.sysf.one/nodegroup=ephemeral'

kubectl create namespace gitlab-agent
# kubectl label ns gitlab-agent namespace-node-affinity=enabled
# kubectl annotate --overwrite ns gitlab-agent scheduler.alpha.kubernetes.io/node-selector='k8s.sysf.one/nodegroup=ephemeral'

kubectl create namespace ops
# kubectl label ns ops namespace-node-affinity=enabled
# kubectl annotate --overwrite ns ops scheduler.alpha.kubernetes.io/node-selector='k8s.sysf.one/nodegroup=ephemeral'

# kubectl create namespace rook-ceph
# kubectl label ns rook-ceph namespace-node-affinity=enabled
# kubectl annotate --overwrite ns rook-ceph scheduler.alpha.kubernetes.io/node-selector='k8s.sysf.one/nodegroup=persistent'

kubectl create namespace velero
# kubectl label ns velero namespace-node-affinity=enabled
# kubectl annotate --overwrite ns velero scheduler.alpha.kubernetes.io/node-selector='k8s.sysf.one/nodegroup=persistent'

cd /Users/bry/sys/etc/k8s/secret
kubectl apply -k ./
cd -

# cd /Users/bry/sys/kubernetes/cluster/sysf/k8s
# kubectl apply -k ./
# cd -

kubectl create secret generic clouddns \
--from-file=/Users/bry/sys/etc/k8s/clouddns.key.json \
--namespace=admin

kubectl patch storageclass gp2 \
    -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"false"}}}'

kubectl patch storageclass efs-sc \
    -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'

# kubectl apply -f /Users/bry/sys/kubernetes/cluster/sysf/k8s/namespace-node-affinity.yml

# cd /Users/bry/sys/project/namespace-node-affinity/deployments/base
# kubectl apply -k ./
# cd -

exit 0

# kubectl create -f /Users/bry/sys/project/external-snapshotter/client/config/crd/snapshot.storage.k8s.io_volumesnapshotclasses.yaml
# kubectl create -f /Users/bry/sys/project/external-snapshotter/client/config/crd/snapshot.storage.k8s.io_volumesnapshotcontents.yaml
# kubectl create -f /Users/bry/sys/project/external-snapshotter/client/config/crd/snapshot.storage.k8s.io_volumesnapshots.yaml

# cd /Users/bry/sys/kubernetes/cluster/sysf
# helmfile --no-color --environment=rook-ceph apply
# cd -

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
