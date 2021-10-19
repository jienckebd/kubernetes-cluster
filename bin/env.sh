#!/usr/bin/env bash

#kubectl get secret ssh-config --namespace=default -o yaml | sed 's/namespace: .*/namespace: test2/' | kubectl apply --namespace=test2 -f -
#helmfile apply

gcloud beta dns --project=bdbd-310322 record-sets transaction start --zone="bostondrupal"

gcloud beta dns --project=bdbd-310322 record-sets transaction add 35.227.54.244 --name="*.bostondrupal.com." --ttl="60" --type="A" --zone="bostondrupal"

gcloud beta dns --project=bdbd-310322 record-sets transaction add 35.227.54.244 --name="bostondrupal.com." --ttl="60" --type="A" --zone="bostondrupal"

gcloud beta dns --project=bdbd-310322 record-sets transaction execute --zone="bostondrupal"
