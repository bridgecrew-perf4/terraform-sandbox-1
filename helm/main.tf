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


module "foo" {
  source = "git::https://github.com/CuddlyDemos/terraform-sandbox.git//modules/hello_world?ref=helm/foo/v1.0.0"
}
