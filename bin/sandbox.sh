#!/usr/bin/env bash

gcloud compute addresses create sys-env-stg --region=us-east4
gcloud compute addresses create sys-env-dev --region=us-east4
gcloud compute addresses create sys-env-ide1 --region=us-east4
exit 0

kubectl delete customresourcedefinition backendconfigs.cloud.google.com
kubectl delete customresourcedefinition capacityrequests.internal.autoscaling.k8s.io
kubectl delete customresourcedefinition frontendconfigs.networking.gke.io
kubectl delete customresourcedefinition managedcertificates.networking.gke.io
# kubectl delete customresourcedefinition servicenetworkendpointgroups.networking.gke.io --force
kubectl delete customresourcedefinition storagestates.migration.k8s.io --force
kubectl delete customresourcedefinition storageversionmigrations.migration.k8s.io
kubectl delete customresourcedefinition updateinfos.nodemanagement.gke.io
kubectl delete customresourcedefinition volumesnapshotclasses.snapshot.storage.k8s.io
#kubectl delete customresourcedefinition volumesnapshotcontents.snapshot.storage.k8s.io
kubectl delete customresourcedefinition volumesnapshots.snapshot.storage.k8s.io
exit 0
#helm install kibana bitnami/kibana --set elasticsearch.enabled=false --set elasticsearch.hosts[0]=elasticsearch-coordinating-only.log.svc.cluster.local --set elasticsearch.port=9200 --set service.type=LoadBalancer

exit 0

kubectl create namespace kubernetes-dashboard
sleep 8
kubectl get secret tls-sys --namespace=default -o yaml | sed 's/namespace: .*/namespace: kubernetes-dashboard/' | sed 's/name: tls-sys/name: kubernetes-dashboard-certs/' | kubectl apply --namespace=kubernetes-dashboard -f -

kubectl patch pvc web-nginx-php-fpm-pvc -n env-dev -p '{"metadata":{"finalizers":null}}'

kubectl get secret ssh-config --namespace=default -o yaml | sed 's/namespace: .*/namespace: test4/' | kubectl apply --namespace=test4 -f -


gcloud compute addresses create sys-env-prd --region=us-east4
gcloud compute addresses create sys-env-stg --region=us-east4
gcloud compute addresses create sys-env-dev --region=us-east4
gcloud compute addresses create sys-env-ide1 --region=us-east4

gcloud compute addresses create sys-k8s --region=us-east4
gcloud compute addresses create sys-k8s-redis --region=us-east4
gcloud compute addresses create sys-k8s-solr --region=us-east4
gcloud compute addresses create sys-k8s-mariadb --region=us-east4
gcloud compute addresses create sys-k8s-kasten --region=us-east4
gcloud compute addresses create sys-k8s-elastic-kibana --region=us-east4
gcloud compute addresses create sys-k8s-metrics --region=us-east4
gcloud compute addresses create sys-k8s-metrics-php-fpm --region=us-east4
gcloud compute addresses create sys-k8s-keycloak --region=us-east4
gcloud compute addresses create sys-kubeapps --region=us-east4
gcloud compute addresses create sys-ingress-controller-admin --region=us-east4

gcloud dns --project=bdbd-310322 record-sets transaction start --zone=tef

gcloud dns --project=bdbd-310322 record-sets transaction add jcTWDyXYSFkVU9vH1gnzaIR8pJwv0bcvMAzyachQf4M --name=_acme-challenge.theentityframework.com. --ttl=60 --type=TXT --zone=tef

gcloud dns --project=bdbd-310322 record-sets transaction execute --zone=tef

echo | openssl s_client -showcerts -servername gnupg.org -connect k8s.theentityframework.com:8443 2>/dev/null | openssl x509 -inform pem -noout -text


kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep gitlab | awk '{print $1}')

kubectl --namespace kasten-io port-forward service/gateway 8080:8000

kubectl expose service elastic-stack-kibana --type=LoadBalancer --name=elastic-stack-kibana-bal --load-balancer-ip=34.138.195.248
kubectl expose deployment web-nginx-php-fpm --type=LoadBalancer --name=web-nginx-php-fpm-bal -n env-ide1 --load-balancer-ip=35.245.179.195

kubectl get pv | grep Released | awk '$1 {print$1}' | while read vol; do kubectl delete pv/${vol}; done

kubectl create secret generic keycloak-tls --from-file=/Users/bry/sys/etc/k8s/tls-sys/keycloak.truststore.jks --from-file=/Users/bry/sys/etc/k8s/tls-sys/keycloak-0.keystore.jks

velero install \
    --provider gcp \
    --plugins velero/velero-plugin-for-gcp:v1.4.1 \
    --bucket sysf-12--velero--0 \
    --secret-file ~/sys/etc/gcloud/sa/credentials-velero \
    --features=EnableCSI \
    --use-restic \
    --restic-pod-cpu-request=50m \
    --restic-pod-mem-request=128Mi \
    --velero-pod-cpu-request=50m \
    --velero-pod-mem-request=128Mi

velero schedule create admin--hourly --schedule="@every 1h" --include-namespaces admin --snapshot-volumes=true --default-volumes-to-restic --ttl 720h0m0s
velero schedule create env-prd--hourly --schedule="@every 1h" --include-namespaces env-prd --snapshot-volumes=true --default-volumes-to-restic --ttl 720h0m0s
velero schedule create env-ide1--hourly --schedule="@every 1h" --include-namespaces env-ide1 --snapshot-volumes=true --default-volumes-to-restic --ttl 720h0m0s

velero schedule create ns--admin--daily -n admin --include-namespaces admin --schedule="0 0 * * *" --snapshot-volumes=true --default-volumes-to-restic --ttl 720h0m0s
velero schedule create mariadb--prd--hourly -n env-prd --selector app.kubernetes.io/name=mariadb --schedule="0 * * * *" --snapshot-volumes=true --default-volumes-to-restic --ttl 720h0m0s

velero schedule create web--prd--hourly -n env-prd --selector app=web-nginx-php-fpm --schedule="15 * * * *" --snapshot-volumes=true --default-volumes-to-restic --ttl 720h0m0s
velero schedule create web--ide1--hourly -n env-ide1 --selector app=web-nginx-php-fpm --schedule="45 * * * *" --snapshot-volumes=true --default-volumes-to-restic --ttl 720h0m0s

velero backup create ns--env-admin--test5 --snapshot-volumes=true --include-cluster-resources=true --default-volumes-to-restic --include-namespaces admin --wait
velero backup create ns--env-admin--test4 --snapshot-volumes=true --include-cluster-resources=true --default-volumes-to-restic --include-namespaces admin --wait
velero backup create ns--env-prd--test1 --snapshot-volumes=true --default-volumes-to-restic --include-namespaces env-prd --wait

velero backup create ns--env-prd--1 --snapshot-volumes=true --default-volumes-to-restic --include-namespaces env-prd --wait
velero backup create ns--env-admin--3 --snapshot-volumes=true --default-volumes-to-restic --include-namespaces admin --wait

velero backup create web--prd--1 --snapshot-volumes=true --default-volumes-to-restic --selector app=web-nginx-php-fpm --wait
velero backup create keycloak-postgresql--1 --snapshot-volumes=true --default-volumes-to-restic --selector app.kubernetes.io/name=postgresql --wait

velero restore create --from-backup admin--24h-20220214132035 --include-resources persistentvolumeclaims,persistentvolumes
velero restore create --from-backup ns--env-admin--test1
velero restore create --from-backup env-prd--24h-20220407213605
velero restore create --from-backup env-ide1--24h-20220309135221


kubectl create clusterrolebinding "kasten-admin--bryan.jiencke@gmail.com" --clusterrole=kasten-admin --user=bryan.jiencke@gmail.com
kubectl create clusterrolebinding "kasten-admin--bryan.jiencke@gmail.com--cluster-admin" --clusterrole=cluster-admin --user=bryan.jiencke@gmail.com
# kubectl create rolebinding "kasten-admin--bryan.jiencke@gmail.com" --role=kasten-ns-admin --user=bryan.jiencke@gmail.com -n k10

kubectl create clusterrolebinding "kasten-admin--mijiencke@gmail.com" --clusterrole=kasten-admin --user=mijiencke@gmail.com
kubectl create clusterrolebinding "kasten-admin--mijiencke@gmail.com--cluster-admin" --clusterrole=cluster-admin --user=mijiencke@gmail.com
# kubectl create rolebinding "kasten-admin--mijiencke@gmail.com" --role=kasten-ns-admin --user=mijiencke@gmail.com -n k10

helmfile --environment=dev destroy; helmfile --environment=stg destroy; helmfile --environment=prd destroy;
kubectl delete pods --all -force -n env-dev; kubectl delete pods --all -force -n env-stg; kubectl delete pods --all -force -n env-prd;
kubectl delete pvc --all -n env-dev; kubectl delete pvc --all -n env-stg; kubectl delete pvc --all -n env-prd;

kubectl -n rook-ceph patch cephclusters.ceph.rook.io rook-ceph -p '{"metadata":{"finalizers": []}}' --type=merge
kubectl -n rook-ceph patch cephfilesystem.ceph.rook.io ceph-filesystem -p '{"metadata":{"finalizers": []}}' --type=merge
kubectl -n rook-ceph patch cephobjectstore.ceph.rook.io ceph-objectstore -p '{"metadata":{"finalizers": []}}' --type=merge

kubectl patch pvc data-keycloak-postgresql-0 -p '{"metadata":{"finalizers":null}}'

kubectl -n admin patch pvc data-keycloak-postgresql-0 -p '{"metadata":{"finalizers": []}}' --type=merge

kubectl get pods --all-namespaces -o jsonpath="{.items[*].spec.containers[*].image}" |\
tr -s '[[:space:]]' '\n' |\
sort |\
uniq


kubectl annotate imagecaches imagecache1 -n admin kubefledged.io/refresh-imagecache=

sysf-12--velero--0

helm install fluentd bitnami/fluentd \
  --set aggregator.configMap=elasticsearch-output \
  --set forwarder.configMap=fluentd-forwarder \
  --set aggregator.extraEnv[0].name=ELASTICSEARCH_HOST \
  --set aggregator.extraEnv[0].value=elasticsearch-coordinating-only.admin.svc.cluster.local \
  --set aggregator.extraEnv[1].name=ELASTICSEARCH_PORT \
  --set-string aggregator.extraEnv[1].value=9200 \
  --set forwarder.extraEnv[0].name=FLUENTD_DAEMON_USER \
  --set forwarder.extraEnv[0].value=root \
  --set forwarder.extraEnv[1].name=FLUENTD_DAEMON_GROUP \
  --set forwarder.extraEnv[1].value=root

k get secret -n rook-ceph rook-ceph-dashboard-password -o yaml

dd if=/dev/zero of=/app/test1.img bs=1G count=3 oflag=dsync
dd if=/dev/zero of=/app/test2.img bs=512 count=1000 oflag=dsync

dd if=/dev/zero of=/bitnami/mariadb/data/test1.img bs=1G count=3 oflag=dsync
dd if=/dev/zero of=/bitnami/mariadb/data/test2.img bs=512 count=1000 oflag=dsync

dd if=/dev/zero of=/bitnami/mariadb/data/test1.img bs=1G count=3 oflag=dsync


gcloud beta container node-pools create local-ssd \
    --ephemeral-storage local-ssd-count=1 \
    --machine-type=c2d-standard-4 \
    --num-nodes=1

mkdir -p /mnt/ram-mariadb-data

mount -t tmpfs -o size=1g tmpfs /bitnami/ram
