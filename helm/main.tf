resource "kubernetes_namespace" "kube-state" {
  metadata {
    name = "kube-state-metrics"
  }
}

resource "helm_release" "kube-state-metrics" {
  name = "kube-state-metrics"

  repository = "https://kubernetes.github.io/kube-state-metrics"
  chart      = "kube-state-metrics"
  namespace  = kubernetes_namespace.kube-state.metadata.0.name

}

resource "kubernetes_namespace" "prom" {
  metadata {
    name = "prometheus"
  }
}

resource "helm_release" "prometheus" {
  name = "prometheus"

  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  namespace  = kubernetes_namespace.prom.metadata.0.name

  depends_on = [helm_release.kube-state-metrics]
}

module "foo" {
  source    = "git::https://github.com/CuddlyDemos/terraform-sandbox.git//modules/helm/foo?ref=helm/foo/v1.0.1"
  namespace = "foo"
}

module "bar" {
  source    = "git::https://github.com/CuddlyDemos/terraform-sandbox.git//modules/helm/foo?ref=helm/foo/v1.0.1"
  namespace = "bar"
}
