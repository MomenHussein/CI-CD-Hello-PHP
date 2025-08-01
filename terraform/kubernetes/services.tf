resource "kubernetes_service" "laravel_service" {
  metadata {
    name      = "laravel-service"
    namespace = kubernetes_namespace.my_app.metadata[0].name
  }

  spec {
    selector = {
      app = "laravel"
    }

    port {
      port        = 80
      target_port = 8000
    }

    type = "ClusterIP"
  }
}

resource "kubernetes_service" "react_service" {
  metadata {
    name      = "react-service"
    namespace = kubernetes_namespace.my_app.metadata[0].name
  }

  spec {
    selector = {
      app = "react"
    }

    port {
      port        = 80
      target_port = 3000
    }

    type = "ClusterIP"
  }
}
