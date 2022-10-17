
resource "kubernetes_deployment_v1" "nginx-deploy" {
  metadata {
    name = "nginx-deployment"
    labels = {
      app = "nginx"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }

      spec {
        container {
          image = "index.docker.io/sreeharshav/testcontainer:v1"
          name  = "nginx-deployment"
      }
    }
    }
    }
  }