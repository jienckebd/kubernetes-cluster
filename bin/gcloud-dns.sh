#!/usr/bin/env bash

gcloud beta dns --project=bdbd-310322 record-sets transaction start --zone="sysf-one"

gcloud beta dns record-sets transaction add 159.203.156.151 --name="*.sysf.one." --ttl="60" --type="A" --zone="sysf-one"
gcloud beta dns record-sets transaction add 159.203.156.151 --name="sysf.one." --ttl="60" --type="A" --zone="sysf-one"

gcloud beta dns record-sets transaction add 159.203.156.151 --name="sys.sysf.one." --ttl="60" --type="A" --zone="sysf-one"
gcloud beta dns record-sets transaction add 159.203.156.151 --name="network.sys.sysf.one." --ttl="60" --type="A" --zone="sysf-one"
gcloud beta dns record-sets transaction add 159.203.156.151 --name="*.network.sys.sysf.one." --ttl="60" --type="A" --zone="sysf-one"
gcloud beta dns record-sets transaction add 159.203.156.151 --name="platform.sys.sysf.one." --ttl="60" --type="A" --zone="sysf-one"
gcloud beta dns record-sets transaction add 159.203.156.151 --name="*.platform.sys.sysf.one." --ttl="60" --type="A" --zone="sysf-one"
gcloud beta dns record-sets transaction add 159.203.156.151 --name="app.sys.sysf.one." --ttl="60" --type="A" --zone="sysf-one"
gcloud beta dns record-sets transaction add 159.203.156.151 --name="*.app.sys.sysf.one." --ttl="60" --type="A" --zone="sysf-one"

gcloud beta dns record-sets transaction add 159.203.156.151 --name="env.sys.sysf.one." --ttl="60" --type="A" --zone="sysf-one"
gcloud beta dns record-sets transaction add 159.203.156.151 --name="*.env.sys.sysf.one." --ttl="60" --type="A" --zone="sysf-one"

gcloud beta dns --project=bdbd-310322 record-sets transaction execute --zone="sysf-one"
