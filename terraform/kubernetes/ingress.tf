resource "kubernetes_ingress_v1" "app_ingress" {
  metadata {
    name      = "app-ingress"
    namespace = kubernetes_namespace.my_app.metadata[0].name
    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target" = "/"
    }
  }

  spec {
    rule {
      host = "your-domain.com"

      http {
        path {
          path     = "/laravel"
          path_type = "Prefix"

          backend {
            service {
              name = kubernetes_service.laravel_service.metadata[0].name
              port {
                number = 80
              }
            }
          }
        }

        path {
          path     = "/"
          path_type = "Prefix"

          backend {
            service {
              name = kubernetes_service.react_service.metadata[0].name
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}
