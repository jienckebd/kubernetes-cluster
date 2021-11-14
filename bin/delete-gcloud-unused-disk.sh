PROJECT="sysf-12"

#   --filter="status:( Released )" \

PAIRS=$(\
  gcloud compute disks list \
  --project=${PROJECT} \
  --format="csv[no-heading](name.scope())")

for PAIR in ${PAIRS}
do

  IFS=, read NAME ZONE <<< ${PAIR}

  printf "Attempting to delete disk: %s [%s]\n" ${NAME}

  gcloud compute disks delete ${NAME} \
  --zone=us-east4-a \
  --project=${PROJECT} \
  --quiet
done
