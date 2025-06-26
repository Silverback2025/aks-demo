# Set up provider and initialize Terraform
cd terraform/
terraform init

terraform providers

# Validate configuration
terraform validate

# Review execution plan
terraform plan -out=tfplan

# Apply the plan to create AKS
terraform apply tfplan

# Get kubeconfig for kubectl
az aks get-credentials --resource-group <rg-name> --name <aks-name>

# (Optional) Destroy resources
terraform destroy

# Apply all manifests
kubectl apply -f k8s/

# Check pods
kubectl get pods

# Check services
kubectl get svc

# Check ingress
kubectl get ingress

# Get logs
kubectl logs -f <pod-name>

# Install NGINX Ingress Controller via Helm
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install nginx ingress-nginx/ingress-nginx --create-namespace -n ingress-nginx

# Verify LoadBalancer IP
kubectl get svc -n ingress-nginx

# Apply ingress rule
kubectl apply -f k8s/ingress.yaml

# (Already done via Terraform in AKS module)
# Check log workspace
az monitor log-analytics workspace show --resource-group <rg> --workspace-name <name>

# Query logs (via portal or CLI)
az monitor log-analytics query --workspace <id> --analytics-query "KubePodInventory | limit 10"

# Test external access
curl http://<EXTERNAL_IP>

# Describe resources
kubectl describe pod <name>
kubectl describe ingress <name>

# Teardown everything
terraform destroy -auto-approve

az ad app create --display-name "github-oidc-app"

az role assignment create \
  --assignee a6457314-aed2-4955-b984-41651fad9983 \
  --role "Contributor" \
  --scope /subscriptions/c9a64aa6-d430-43a8-a468-96c3018719cd/resourceGroups/ashishtech
  
az identity federated-credential create \
  --name github-actions-federation \
  --identity-name github-actions-identity \
  --resource-group ashishtech \
  --issuer "https://token.actions.githubusercontent.com" \
  --subject "repo:<OWNER>/<REPO>:ref:refs/heads/<BRANCH>" \
  --audiences "api://AzureADTokenExchange"

az aks get-credentials --resource-group <your-resource-group> --name <your-aks-cluster-name>

