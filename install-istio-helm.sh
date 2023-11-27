
#!/bin/bash

# Step 1: Add Istio Helm repository and update
helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo update

# Step 2: Create Istio namespace
kubectl create namespace istio-system

# Step 3: Install istio-base
helm install istio-base istio/base -n istio-system --set defaultRevision=default

# Step 4: Validate CRD installation
helm ls -n istio-system

# Step 5: Install Istio discovery chart (istiod)
helm install istiod istio/istiod -n istio-system

# Step 6: Verify Istio discovery chart installation
helm ls -n istio-system
helm status istiod -n istio-system

# Step 7: Check istiod service is successfully installed and its pods are running
kubectl get deployments -n istio-system --output wide

# Step 8: Install an ingress gateway
kubectl create namespace istio-ingress
helm install istio-ingress istio/gateway -n istio-ingress

echo "Istio installation completed successfully."
