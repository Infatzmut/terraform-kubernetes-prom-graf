terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "2.13.1"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.29.0"
    }
  }
}
