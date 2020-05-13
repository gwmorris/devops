#!/bin/bash -x

# Install the CustomResourceDefinition resources separately
/usr/local/bin/kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.12/deploy/manifests/00-crds.yaml

# **Important:**
# If you are running Kubernetes v1.15 or below, you
# will need to add the `--validate=false` flag to your
# kubectl apply command, or else you will receive a
# validation error relating to the
# x-kubernetes-preserve-unknown-fields field in
# cert-manager’s CustomResourceDefinition resources.
# This is a benign error and occurs due to the way kubectl
# performs resource validation.

# Create the namespace for cert-manager
/usr/local/bin/kubectl create namespace cert-manager

# Add the Jetstack Helm repository
/usr/local/bin/helm repo add jetstack https://charts.jetstack.io

# Update your local Helm chart repository cache
/usr/local/bin/helm repo update

# Install the cert-manager Helm chart
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

/usr/local/bin/helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --version v0.12.0

/usr/local/bin/helm install rancher rancher-latest/rancher \
  --namespace cattle-system --set hostname=$(curl http://169.254.169.254/latest/meta-data/public-hostname)

/usr/local/bin/kubectl -n cattle-system rollout status deploy/rancher
