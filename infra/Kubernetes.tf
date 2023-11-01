resource "kubernetes_deployment" "Fastfoodapi" {
  metadata {
    name = "fastfoodapi-pod"
    labels = {
      nome = "fastfoodapi-pod"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        nome = "fastfoodapi-pod"
      }
    }

    template {
      metadata {
        labels = {
          nome = "fastfoodapi-pod"
        }
      }

      spec {
        container {
          image = "265391989599.dkr.ecr.us-east-1.amazonaws.com/prod:v1"
          name  = "fastfoodapi-pod"

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/"
              port = 80
            }

            initial_delay_seconds = 3
            period_seconds        = 5
          }
        }
      }
    }
  }
}
