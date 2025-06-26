

resource "null_resource" "bootstrap" {
  provisioner "local-exec" {
    command = <<EOT
      echo "Setting up kubectl config"
      az aks get-credentials --resource-group ${var.resource_group_name} --name ${var.aks_cluster_name} --overwrite-existing --admin

      echo "Installing NGINX Ingress"
      kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.9.4/deploy/static/provider/cloud/deploy.yaml

    EOT
  }

  depends_on = [
    # ensure the AKS cluster is ready before bootstrapping
    # Replace with the actual module output resource if you can
  ]
}
