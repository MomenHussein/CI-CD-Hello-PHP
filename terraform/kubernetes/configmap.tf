resource "kubernetes_config_map" "laravel_config" {
  metadata {
    name      = "laravel-config"
    namespace = kubernetes_namespace.my_app.metadata[0].name
  }

  data = {
    APP_ENV   = "production"
    APP_DEBUG = "false"
    APP_NAME  = "Laravel"
  }
}
