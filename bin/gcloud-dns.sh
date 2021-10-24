#!/usr/bin/env bash

ip_old="138.197.60.175"
ip_new="159.203.144.23"

gcloud beta dns --project=bdbd-310322 record-sets transaction start --zone="sysf-one"

gcloud beta dns record-sets transaction remove "${ip_old}" --name="*.sysf.one." --ttl="60" --type="A" --zone="sysf-one"
gcloud beta dns record-sets transaction remove "${ip_old}" --name="sysf.one." --ttl="60" --type="A" --zone="sysf-one"

gcloud beta dns record-sets transaction remove "${ip_old}" --name="sys.sysf.one." --ttl="60" --type="A" --zone="sysf-one"
gcloud beta dns record-sets transaction remove "${ip_old}" --name="*.sys.sysf.one." --ttl="60" --type="A" --zone="sysf-one"
gcloud beta dns record-sets transaction remove "${ip_old}" --name="network.sys.sysf.one." --ttl="60" --type="A" --zone="sysf-one"
gcloud beta dns record-sets transaction remove "${ip_old}" --name="*.network.sys.sysf.one." --ttl="60" --type="A" --zone="sysf-one"
gcloud beta dns record-sets transaction remove "${ip_old}" --name="platform.sys.sysf.one." --ttl="60" --type="A" --zone="sysf-one"
gcloud beta dns record-sets transaction remove "${ip_old}" --name="*.platform.sys.sysf.one." --ttl="60" --type="A" --zone="sysf-one"
gcloud beta dns record-sets transaction remove "${ip_old}" --name="app.sys.sysf.one." --ttl="60" --type="A" --zone="sysf-one"
gcloud beta dns record-sets transaction remove "${ip_old}" --name="*.app.sys.sysf.one." --ttl="60" --type="A" --zone="sysf-one"

gcloud beta dns record-sets transaction remove "${ip_old}" --name="env.sys.sysf.one." --ttl="60" --type="A" --zone="sysf-one"
gcloud beta dns record-sets transaction remove "${ip_old}" --name="*.env.sys.sysf.one." --ttl="60" --type="A" --zone="sysf-one"

gcloud beta dns --project=bdbd-310322 record-sets transaction execute --zone="sysf-one"


gcloud beta dns --project=bdbd-310322 record-sets transaction start --zone="sysf-one"

gcloud beta dns record-sets transaction add "${ip_new}" --name="*.sysf.one." --ttl="60" --type="A" --zone="sysf-one"
gcloud beta dns record-sets transaction add "${ip_new}" --name="sysf.one." --ttl="60" --type="A" --zone="sysf-one"

gcloud beta dns record-sets transaction add "${ip_new}" --name="sys.sysf.one." --ttl="60" --type="A" --zone="sysf-one"
gcloud beta dns record-sets transaction add "${ip_new}" --name="*.sys.sysf.one." --ttl="60" --type="A" --zone="sysf-one"
gcloud beta dns record-sets transaction add "${ip_new}" --name="network.sys.sysf.one." --ttl="60" --type="A" --zone="sysf-one"
gcloud beta dns record-sets transaction add "${ip_new}" --name="*.network.sys.sysf.one." --ttl="60" --type="A" --zone="sysf-one"
gcloud beta dns record-sets transaction add "${ip_new}" --name="platform.sys.sysf.one." --ttl="60" --type="A" --zone="sysf-one"
gcloud beta dns record-sets transaction add "${ip_new}" --name="*.platform.sys.sysf.one." --ttl="60" --type="A" --zone="sysf-one"
gcloud beta dns record-sets transaction add "${ip_new}" --name="app.sys.sysf.one." --ttl="60" --type="A" --zone="sysf-one"
gcloud beta dns record-sets transaction add "${ip_new}" --name="*.app.sys.sysf.one." --ttl="60" --type="A" --zone="sysf-one"

gcloud beta dns record-sets transaction add "${ip_new}" --name="env.sys.sysf.one." --ttl="60" --type="A" --zone="sysf-one"
gcloud beta dns record-sets transaction add "${ip_new}" --name="*.env.sys.sysf.one." --ttl="60" --type="A" --zone="sysf-one"

gcloud beta dns --project=bdbd-310322 record-sets transaction execute --zone="sysf-one"
