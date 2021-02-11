resource "kubernetes_namespace" "foo" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "hello-world" {
  name      = "hello-world"
  chart     = "${path.module}/chart"
  namespace = kubernetes_namespace.foo.metadata.0.name
}
