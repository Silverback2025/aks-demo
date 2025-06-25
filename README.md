# -----------------------------
# README.md
# -----------------------------

## Overview
This project provisions an AKS cluster using Terraform and bootstraps it with ArgoCD, NGINX Ingress, and Azure Monitor. It also deploys the HuggingFace Chat UI via ArgoCD.

## Prerequisites
- Azure CLI (`az`)
- Terraform >= 1.3
- kubectl

## Setup Steps

### 1. Initialize Terraform
```bash
terraform init
```

### 2. Apply Terraform Configuration
```bash
terraform apply -auto-approve
```
This will provision:
- Resource Group
- Azure Log Analytics Workspace
- AKS Cluster
- NGINX Ingress Controller
- ArgoCD
- Namespace `chatui`
- ArgoCD Application to deploy HuggingFace Chat

### 3. Access ArgoCD (Optional)
To get ArgoCD initial password:
```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d && echo
```
Access ArgoCD UI at:
```bash
kubectl port-forward svc/argocd-server -n argocd 8080:443
```
Then go to: https://localhost:8080

### 4. Access HuggingFace Chat
Once the ingress is ready, get the public IP:
```bash
kubectl get svc -n ingress-nginx
```
Use the EXTERNAL-IP of the ingress controller to open the HuggingFace Chat UI.

## Verify Deployment
```bash
kubectl get pods -n chatui
kubectl get svc -n chatui
kubectl get ingress -n chatui
```
Ensure pods are running and ingress is configured with an IP.

## Teardown
```bash
terraform destroy -auto-approve
```
This will remove all created Azure resources to avoid charges.

---

# (rest of the file remains unchanged)

<the full Terraform and YAML configuration continues here>

(apiVersion: argoproj.io/v1alpha1 ...)
