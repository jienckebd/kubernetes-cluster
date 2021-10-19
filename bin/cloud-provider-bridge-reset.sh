#!/usr/bin/env bash

gcloud beta container --project "bdbd-310322" clusters delete --region us-east4-c sys -q

#gcloud compute disks delete --zone=us-east4-c sys -q

#gcloud compute addresses delete sys --region=us-east4 -q && \
#gcloud compute addresses delete sys-k8s-dashboard --region=us-east4 -q
#gcloud compute addresses delete sys-satis --region=us-east4 -q
