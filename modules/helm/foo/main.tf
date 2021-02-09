resource "kubernetes_namespace" "demo" {
  metadata {
    name = "demo"
  }
}

resource "helm_release" "hello-world" {
  name      = "hello-world"
  chart     = "${path.module}/chart"
  namespace = kubernetes_namespace.demo.metadata.0.name
}
