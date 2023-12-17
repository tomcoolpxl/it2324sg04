PROJECT_ID="online-boutique-408315"
ZONE="us-central1-a"
CLUSTER_NAME="onlineboutique"

gcloud container clusters create ${CLUSTER_NAME} \
    --project=${PROJECT_ID} \
    --zone=${ZONE} \
    --machine-type=e2-standard-4 \
    --num-nodes=4 \
    --workload-pool ${PROJECT_ID}.svc.id.goog \
    --gateway-api "standard"

