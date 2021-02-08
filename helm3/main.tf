# external charts
resource "helm_release" "kube-state-metrics" {
  name = "kube-state-metrics"

  repository = "https://kubernetes.github.io/kube-state-metrics"
  chart      = "kube-state-metrics"

}

resource "helm_release" "prometheus" {
  name = "prometheus"

  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"

  depends_on = [helm_release.kube-state-metrics]

}

# local helm chart
resource "kubernetes_namespace" "demo" {
  metadata {
    name = "demo"
  }
}

resource "helm_release" "hello-world" {
  name      = "hello-world"
  chart     = "./charts/hello-world"
  namespace = kubernetes_namespace.demo.metadata.0.name
}
