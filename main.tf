provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
  config_context = "kind-k8s-playground"
}

### Grafana ###### 
resource "kubernetes_namespace_v1" "grafana" {
  metadata {
    annotations = {
      name= "grafana"
    }
    name = "grafana" 
  }

}

resource "helm_release" "grafana" {
  name = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart = "grafana"
  version = "7.3.9"
}

### Prometheus ###### 
resource "kubernetes_namespace" "prometheus" {
  metadata {
    annotations = {
      name= "prometheus"
    }
    name = "prometheus"
 }
}

resource "helm_release" "prometheus" {
  name = "prometheus" 
  repository = "https://prometheus-community.github.io/helm-charts"
  chart = "prometheus"
  version = "25.20.1"
}

