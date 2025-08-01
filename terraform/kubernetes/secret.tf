resource "kubernetes_secret" "ghcr_secret" {
  metadata {
    name      = "ghcr-secret"
    namespace = kubernetes_namespace.my_app.metadata[0].name
  }

  data = {
    ".dockerconfigjson" = base64encode(file("path/to/.docker/config.json"))
  }

  type = "kubernetes.io/dockerconfigjson"
}
