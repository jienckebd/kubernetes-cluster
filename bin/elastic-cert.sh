#!/usr/bin/env bash

kubectl exec -it elasticsearch-master-0 -- bash -c "mkdir -p /tmp/cert"
kubectl exec -it elasticsearch-master-0 -- bash -c "elasticsearch-certutil ca --out /tmp/cert/elastic-stack-ca.p12 --pass ''"
kubectl exec -it elasticsearch-master-0 -- bash -c "elasticsearch-certutil cert --name elasticsearch-master-cert --dns elasticsearch-master,elasticsearch-master-headless --out /tmp/cert/elastic-certificates.p12 --pass '' --ca-pass ''"
kubectl exec -it elasticsearch-master-0 -- bash -c "openssl pkcs12 -nodes -passin pass:'' -in /tmp/cert/elastic-stack-ca.p12 -out /tmp/cert/elastic-kibana-ca.pem"

mkdir -p /Users/bry/sys/etc/elastic-cert
kubectl cp elasticsearch-master-0:/tmp/cert /Users/bry/sys/etc/elastic-cert

elasticsearch-certutil http
# elasticsearch-master,elasticsearch-master-headless

elasticsearch-keystore add xpack.security.authc.realms.oidc.oidc1.rp.client_secret
