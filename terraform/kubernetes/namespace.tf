resource "kubernetes_namespace" "my_app" {
  metadata {
    name = "my-app"
  }
}
