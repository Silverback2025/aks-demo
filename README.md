
---

# HuggingFace Chat on Azure Kubernetes Service (AKS)

## Overview

This project demonstrates how to deploy the [HuggingFace Chat UI](https://github.com/huggingface/chat-ui) on an Azure Kubernetes Service (AKS) cluster provisioned using Terraform. It includes:

* Automated AKS cluster creation with Terraform
* Kubernetes deployment manifests for the HuggingFace chat application
* Public ingress setup via NGINX Ingress Controller
* Basic logging and monitoring using Azure Monitor (Log Analytics)
* Scripts and instructions to deploy, verify, and tear down the environment

---

## Architecture

```
User Browser
     ↓
  Ingress Controller (NGINX)
     ↓
 HuggingFace Chat UI Pod(s) (Kubernetes Deployment)
     ↓
 Azure Monitor (Logging & Metrics)
     ↓
 AKS Cluster (Provisioned by Terraform)
```

---

## Prerequisites

* Azure CLI installed and logged in (`az login`)
* Terraform installed (version >= 1.6.0 recommended)
* `kubectl` installed and configured
* Helm installed (for ingress controller)
* GitHub Actions setup (optional, if using CI/CD)
* An Azure Service Principal with Contributor role, configured as GitHub Secret (`AZURE_CREDENTIALS`)

---

## Deployment Instructions

### 1. Provision AKS Cluster using Terraform

```bash
cd terraform/
terraform init
terraform plan -out=tfplan
terraform apply tfplan
```

> After completion, configure kubectl context:

```bash
az aks get-credentials --resource-group <resource-group> --name <aks-cluster-name>
```

---

### 2. Install NGINX Ingress Controller

```bash
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install nginx ingress-nginx/ingress-nginx --create-namespace -n ingress-nginx
```

---

### 3. Deploy HuggingFace Chat UI Application

```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/ingress.yaml
```

---

### 4. Verify Deployment

* Check pods status:

```bash
kubectl get pods
```

* Check services and ingress:

```bash
kubectl get svc
kubectl get ingress
```

* Access the chat UI via the external IP or DNS name from the ingress:

```bash
http://<EXTERNAL_IP_OR_DNS>
```

---

### 5. Monitor Logs and Metrics

* Azure Monitor is enabled through Terraform (Log Analytics Workspace).
* You can query logs via Azure Portal or CLI:

```bash
az monitor log-analytics query --workspace <workspace-id> --analytics-query "KubePodInventory | limit 10"
```

---

## Teardown Instructions

To avoid unnecessary cost, destroy all resources after use:

### Option 1: Terraform Destroy

```bash
cd terraform/
terraform destroy -auto-approve -parallelism=50
```

### Option 2: Manual AKS delete followed by Terraform destroy (faster)

```bash
az aks delete --name <aks-cluster-name> --resource-group <resource-group> --yes --no-wait
terraform destroy -auto-approve
```

---

## CLI Commands Summary

```bash
# Terraform
terraform init
terraform plan -out=tfplan
terraform apply tfplan
terraform destroy -auto-approve -parallelism=50

# AKS Credentials
az aks get-credentials --resource-group <rg> --name <aks-name>

# Kubernetes
kubectl apply -f k8s/
kubectl get pods,svc,ingress
kubectl logs -f <pod-name>

# Helm (Ingress)
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm install nginx ingress-nginx/ingress-nginx --create-namespace -n ingress-nginx

# Azure Monitor Logs Query
az monitor log-analytics query --workspace <workspace-id> --analytics-query "KubePodInventory | limit 10"
```

---

## Known Limitations & Next Steps

* Security hardening is minimal — no network policies or RBAC enforced.
* TLS/HTTPS for ingress is not configured; can be added using cert-manager.
* CI/CD pipelines can be integrated for automated deploy/destroy workflows.
* Additional monitoring and alerting can be configured in Azure Monitor.
* Scaling of AKS node pools can be tuned based on load.





---

### 3a. Install Cert-Manager for TLS Certificates

Cert-Manager automates the management and issuance of TLS certificates for Kubernetes ingress resources.

```bash
# Add Jetstack Helm repository
helm repo add jetstack https://charts.jetstack.io
helm repo update

# Install cert-manager CRDs
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/latest/download/cert-manager.crds.yaml

# Install cert-manager
helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --version v1.12.3
```

---

### 3b. Configure ClusterIssuer (Let's Encrypt staging)

Create a ClusterIssuer YAML to issue certificates from Let’s Encrypt staging (for testing):

```yaml
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-staging
spec:
  acme:
    server: https://acme-staging-v02.api.letsencrypt.org/directory
    email: your-email@example.com
    privateKeySecretRef:
      name: letsencrypt-staging-key
    solvers:
      - http01:
          ingress:
            class: nginx
```

Apply it:

```bash
kubectl apply -f cluster-issuer.yaml
```

---

### 3c. Update Ingress Manifest for TLS

Modify your `ingress.yaml` to enable TLS and use the cert-manager issuer:

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: hf-chat-ingress
  annotations:
    kubernetes.io/ingress.class: "nginx"
    cert-manager.io/cluster-issuer: "letsencrypt-staging"
spec:
  tls:
  - hosts:
    - your.domain.example
    secretName: hf-chat-tls
  rules:
  - host: your.domain.example
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: hf-chat-service
            port:
              number: 80
```

---

### 3d. Access the Application via HTTPS

Once the certificate is issued and ready, your ingress will serve the chat UI securely at:

```bash
https://your.domain.example
```

> **Note:** Replace `your.domain.example` with your actual domain. For quick testing without a custom domain, use services like `nip.io` or `sslip.io`.

---

## Teardown Instructions

*(same as before)*

---

## Additional Notes

* Use **Let's Encrypt production** `ClusterIssuer` once validated by switching the `server` URL to production.
* Monitor certificate issuance with:

```bash
kubectl describe certificate hf-chat-tls
kubectl get certificate -A
```

* Cert-Manager requires DNS pointing to your ingress controller IP for HTTP-01 challenge.

---



