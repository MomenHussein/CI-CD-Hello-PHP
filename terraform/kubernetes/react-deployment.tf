resource "kubernetes_deployment" "react" {
  metadata {
    name      = "react-app"
    namespace = "default"
    labels = {
      app = "react"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "react"
      }
    }

    template {
      metadata {
        labels = {
          app = "react"
        }
      }

      spec {
        container {
          name  = "react"
          image = "your-dockerhub/react-app:latest"

          ports {
            container_port = 80
          }
        }
      }
    }
  }
}
