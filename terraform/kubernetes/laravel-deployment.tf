resource "kubernetes_deployment" "laravel" {
  metadata {
    name      = "laravel-app"
    namespace = "default"
    labels = {
      app = "laravel"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "laravel"
      }
    }

    template {
      metadata {
        labels = {
          app = "laravel"
        }
      }

      spec {
        container {
          name  = "laravel"
          image = "your-dockerhub/laravel:latest"

          env_from {
            config_map_ref {
              name = kubernetes_config_map.laravel_config.metadata[0].name
            }
          }

          ports {
            container_port = 8000
          }

          volume_mount {
            name       = "storage"
            mount_path = "/var/www/html/storage"
          }
        }

        volume {
          name = "storage"

          persistent_volume_claim {
            claim_name = "laravel-pvc"
          }
        }
      }
    }
  }
}
