#!/usr/bin/env bash

ip_old="23.23.246.214"
ip_new="18.235.36.63"

# gcloud beta dns --project=bdbd-310322 record-sets transaction start --zone="sysf-one"

# gcloud beta dns --project=bdbd-310322 record-sets transaction remove "${ip_old}" --name="sysf.one." --ttl="300" --type="A" --zone="sysf-one"
# gcloud beta dns --project=bdbd-310322 record-sets transaction remove "${ip_old}" --name="*.sysf.one." --ttl="300" --type="A" --zone="sysf-one"

# gcloud beta dns --project=bdbd-310322 record-sets transaction remove "${ip_old}" --name="sys.sysf.one." --ttl="300" --type="A" --zone="sysf-one"
# gcloud beta dns --project=bdbd-310322 record-sets transaction remove "${ip_old}" --name="*.sys.sysf.one." --ttl="300" --type="A" --zone="sysf-one"
# gcloud beta dns --project=bdbd-310322 record-sets transaction remove "${ip_old}" --name="network.sys.sysf.one." --ttl="300" --type="A" --zone="sysf-one"
# gcloud beta dns --project=bdbd-310322 record-sets transaction remove "${ip_old}" --name="*.network.sys.sysf.one." --ttl="300" --type="A" --zone="sysf-one"
# gcloud beta dns --project=bdbd-310322 record-sets transaction remove "${ip_old}" --name="platform.sys.sysf.one." --ttl="300" --type="A" --zone="sysf-one"
# gcloud beta dns --project=bdbd-310322 record-sets transaction remove "${ip_old}" --name="*.platform.sys.sysf.one." --ttl="300" --type="A" --zone="sysf-one"
# gcloud beta dns --project=bdbd-310322 record-sets transaction remove "${ip_old}" --name="app.sys.sysf.one." --ttl="300" --type="A" --zone="sysf-one"
# gcloud beta dns --project=bdbd-310322 record-sets transaction remove "${ip_old}" --name="*.app.sys.sysf.one." --ttl="300" --type="A" --zone="sysf-one"

# gcloud beta dns --project=bdbd-310322 record-sets transaction remove "${ip_old}" --name="env.sys.sysf.one." --ttl="300" --type="A" --zone="sysf-one"
# gcloud beta dns --project=bdbd-310322 record-sets transaction remove "${ip_old}" --name="*.env.sys.sysf.one." --ttl="300" --type="A" --zone="sysf-one"

# gcloud beta dns --project=bdbd-310322 record-sets transaction remove "${ip_old}" --name="gitlab.sysf.one." --ttl="300" --type="A" --zone="sysf-one"
# gcloud beta dns --project=bdbd-310322 record-sets transaction remove "${ip_old}" --name="*.gitlab.sysf.one." --ttl="300" --type="A" --zone="sysf-one"

# gcloud beta dns --project=bdbd-310322 record-sets transaction execute --zone="sysf-one"
# gcloud beta dns --project=bdbd-310322 record-sets transaction start --zone="bostondrupal"

# gcloud beta dns --project=bdbd-310322 record-sets transaction remove "${ip_old}" --name="bostondrupal.com." --ttl="300" --type="A" --zone="bostondrupal"
# gcloud beta dns --project=bdbd-310322 record-sets transaction remove "${ip_old}" --name="*.bostondrupal.com." --ttl="300" --type="A" --zone="bostondrupal"

# gcloud beta dns --project=bdbd-310322 record-sets transaction execute --zone="bostondrupal"
# gcloud beta dns --project=bdbd-310322 record-sets transaction start --zone="bryanjiencke"

# gcloud beta dns --project=bdbd-310322 record-sets transaction remove "${ip_old}" --name="bryanjiencke.com." --ttl="300" --type="A" --zone="bryanjiencke"
# gcloud beta dns --project=bdbd-310322 record-sets transaction remove "${ip_old}" --name="*.bryanjiencke.com." --ttl="300" --type="A" --zone="bryanjiencke"

# gcloud beta dns --project=bdbd-310322 record-sets transaction execute --zone="bryanjiencke"
# gcloud beta dns --project=bdbd-310322 record-sets transaction start --zone="stevenjiencke"

# gcloud beta dns --project=bdbd-310322 record-sets transaction remove "${ip_old}" --name="stevenjiencke.com." --ttl="300" --type="A" --zone="stevenjiencke"
# gcloud beta dns --project=bdbd-310322 record-sets transaction remove "${ip_old}" --name="*.stevenjiencke.com." --ttl="300" --type="A" --zone="stevenjiencke"

# gcloud beta dns --project=bdbd-310322 record-sets transaction execute --zone="stevenjiencke"
# gcloud beta dns --project=bdbd-310322 record-sets transaction start --zone="tef"

# gcloud beta dns --project=bdbd-310322 record-sets transaction remove "${ip_old}" --name="theentityframework.com." --ttl="300" --type="A" --zone="tef"
# gcloud beta dns --project=bdbd-310322 record-sets transaction remove "${ip_old}" --name="*.theentityframework.com." --ttl="300" --type="A" --zone="tef"

# gcloud beta dns --project=bdbd-310322 record-sets transaction execute --zone="tef"
# # gcloud beta dns --project=bdbd-310322 record-sets transaction start --zone="shoreacresimprovementassociation-com"

# # gcloud beta dns --project=bdbd-310322 record-sets transaction remove "${ip_old}" --name="shoreacresimprovementassociation.com." --ttl="300" --type="A" --zone="shoreacresimprovementassociation-com"
# # gcloud beta dns --project=bdbd-310322 record-sets transaction remove "${ip_old}" --name="*.shoreacresimprovementassociation.com." --ttl="300" --type="A" --zone="shoreacresimprovementassociation-com"

# # gcloud beta dns --project=bdbd-310322 record-sets transaction execute --zone="shoreacresimprovementassociation-com"
# gcloud beta dns --project=bdbd-310322 record-sets transaction start --zone="systemf-one"

# gcloud beta dns --project=bdbd-310322 record-sets transaction remove "${ip_old}" --name="systemf.one." --ttl="300" --type="A" --zone="systemf-one"
# gcloud beta dns --project=bdbd-310322 record-sets transaction remove "${ip_old}" --name="*.systemf.one." --ttl="300" --type="A" --zone="systemf-one"


# gcloud beta dns --project=bdbd-310322 record-sets transaction execute --zone="systemf-one"






# gcloud beta dns --project=bdbd-310322 record-sets transaction start --zone="sysf-one"

# gcloud beta dns --project=bdbd-310322 record-sets transaction add "${ip_new}" --name="*.sysf.one." --ttl="300" --type="A" --zone="sysf-one"
# gcloud beta dns --project=bdbd-310322 record-sets transaction add "${ip_new}" --name="sysf.one." --ttl="300" --type="A" --zone="sysf-one"

# gcloud beta dns --project=bdbd-310322 record-sets transaction add "${ip_new}" --name="sys.sysf.one." --ttl="300" --type="A" --zone="sysf-one"
# gcloud beta dns --project=bdbd-310322 record-sets transaction add "${ip_new}" --name="*.sys.sysf.one." --ttl="300" --type="A" --zone="sysf-one"
# gcloud beta dns --project=bdbd-310322 record-sets transaction add "${ip_new}" --name="network.sys.sysf.one." --ttl="300" --type="A" --zone="sysf-one"
# gcloud beta dns --project=bdbd-310322 record-sets transaction add "${ip_new}" --name="*.network.sys.sysf.one." --ttl="300" --type="A" --zone="sysf-one"
# gcloud beta dns --project=bdbd-310322 record-sets transaction add "${ip_new}" --name="platform.sys.sysf.one." --ttl="300" --type="A" --zone="sysf-one"
# gcloud beta dns --project=bdbd-310322 record-sets transaction add "${ip_new}" --name="*.platform.sys.sysf.one." --ttl="300" --type="A" --zone="sysf-one"
# gcloud beta dns --project=bdbd-310322 record-sets transaction add "${ip_new}" --name="app.sys.sysf.one." --ttl="300" --type="A" --zone="sysf-one"
# gcloud beta dns --project=bdbd-310322 record-sets transaction add "${ip_new}" --name="*.app.sys.sysf.one." --ttl="300" --type="A" --zone="sysf-one"

# gcloud beta dns --project=bdbd-310322 record-sets transaction add "${ip_new}" --name="env.sys.sysf.one." --ttl="300" --type="A" --zone="sysf-one"
# gcloud beta dns --project=bdbd-310322 record-sets transaction add "${ip_new}" --name="*.env.sys.sysf.one." --ttl="300" --type="A" --zone="sysf-one"
# gcloud beta dns --project=bdbd-310322 record-sets transaction add "${ip_new}" --name="gitlab.sysf.one." --ttl="300" --type="A" --zone="sysf-one"
# gcloud beta dns --project=bdbd-310322 record-sets transaction add "${ip_new}" --name="*.gitlab.sysf.one." --ttl="300" --type="A" --zone="sysf-one"

# gcloud beta dns --project=bdbd-310322 record-sets transaction execute --zone="sysf-one"
gcloud beta dns --project=bdbd-310322 record-sets transaction start --zone="bostondrupal"

gcloud beta dns --project=bdbd-310322 record-sets transaction add "${ip_new}" --name="bostondrupal.com." --ttl="300" --type="A" --zone="bostondrupal"
gcloud beta dns --project=bdbd-310322 record-sets transaction add "${ip_new}" --name="*.bostondrupal.com." --ttl="300" --type="A" --zone="bostondrupal"

gcloud beta dns --project=bdbd-310322 record-sets transaction execute --zone="bostondrupal"
gcloud beta dns --project=bdbd-310322 record-sets transaction start --zone="bryanjiencke"

gcloud beta dns --project=bdbd-310322 record-sets transaction add "${ip_new}" --name="bryanjiencke.com." --ttl="300" --type="A" --zone="bryanjiencke"
gcloud beta dns --project=bdbd-310322 record-sets transaction add "${ip_new}" --name="*.bryanjiencke.com." --ttl="300" --type="A" --zone="bryanjiencke"

gcloud beta dns --project=bdbd-310322 record-sets transaction execute --zone="bryanjiencke"
gcloud beta dns --project=bdbd-310322 record-sets transaction start --zone="stevenjiencke"

gcloud beta dns --project=bdbd-310322 record-sets transaction add "${ip_new}" --name="stevenjiencke.com." --ttl="300" --type="A" --zone="stevenjiencke"
gcloud beta dns --project=bdbd-310322 record-sets transaction add "${ip_new}" --name="*.stevenjiencke.com." --ttl="300" --type="A" --zone="stevenjiencke"

gcloud beta dns --project=bdbd-310322 record-sets transaction execute --zone="stevenjiencke"
gcloud beta dns --project=bdbd-310322 record-sets transaction start --zone="tef"

gcloud beta dns --project=bdbd-310322 record-sets transaction add "${ip_new}" --name="theentityframework.com." --ttl="300" --type="A" --zone="tef"
gcloud beta dns --project=bdbd-310322 record-sets transaction add "${ip_new}" --name="*.theentityframework.com." --ttl="300" --type="A" --zone="tef"

gcloud beta dns --project=bdbd-310322 record-sets transaction execute --zone="tef"
# gcloud beta dns --project=bdbd-310322 record-sets transaction start --zone="shoreacresimprovementassociation-com"

# gcloud beta dns --project=bdbd-310322 record-sets transaction add "${ip_new}" --name="shoreacresimprovementassociation.com." --ttl="300" --type="A" --zone="shoreacresimprovementassociation-com"
# gcloud beta dns --project=bdbd-310322 record-sets transaction add "${ip_new}" --name="*.shoreacresimprovementassociation.com." --ttl="300" --type="A" --zone="shoreacresimprovementassociation-com"

# gcloud beta dns --project=bdbd-310322 record-sets transaction execute --zone="shoreacresimprovementassociation-com"
gcloud beta dns --project=bdbd-310322 record-sets transaction start --zone="systemf-one"

gcloud beta dns --project=bdbd-310322 record-sets transaction add "${ip_new}" --name="systemf.one." --ttl="300" --type="A" --zone="systemf-one"
gcloud beta dns --project=bdbd-310322 record-sets transaction add "${ip_new}" --name="*.systemf.one." --ttl="300" --type="A" --zone="systemf-one"

gcloud beta dns --project=bdbd-310322 record-sets transaction execute --zone="systemf-one"


# gcloud beta dns --project=bdbd-310322 record-sets transaction abort --zone="sysf-one"
# gcloud beta dns --project=bdbd-310322 record-sets transaction abort --zone="bostondrupal"
# gcloud beta dns --project=bdbd-310322 record-sets transaction abort --zone="bryanjiencke"
# gcloud beta dns --project=bdbd-310322 record-sets transaction abort --zone="stevenjiencke"
# gcloud beta dns --project=bdbd-310322 record-sets transaction abort --zone="tef"
# gcloud beta dns --project=bdbd-310322 record-sets transaction abort --zone="shoreacresimprovementassociation-com"
# gcloud beta dns --project=bdbd-310322 record-sets transaction abort --zone="systemf-one"
