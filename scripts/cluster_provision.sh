istioctl install --set profile=minimal -y

# Enable sidecar injection for Kubernetes namespace(s) where microservices-demo is deployed
kubectl label namespace default istio-injection=enabled

# Make sure the istiod injection webhook port 15017 is accessible via GKE master nodes
# Otherwise your replicaset-controller may be blocked when trying to create new pods

# Create a firewall rule to allow webhook port 15017
gcloud compute firewall-rules update gke-onlineboutique-408315-master \
--allow tcp:10250,tcp:443,tcp:15017

gcloud compute firewall-rules list --filter="name~gke-[0-9a-z-]*-master"

#Kustomize apply
cd ../../microservices-demo/kustomize
kustomize edit add component components/service-accounts
kustomize edit add component components/service-mesh-istio
kubectl apply -k .

sleep 3
kubectl get pods,gateway,svc
