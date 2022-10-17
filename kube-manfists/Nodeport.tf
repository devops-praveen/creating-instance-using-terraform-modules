resource "kubernetes_service" "nodeport" {
  metadata {
    name = "np-service"
  }
  spec {
    selector = {
      app = "nginx"
    }
    port {
      port        = 8080
      target_port = 80
    }
    type = "NodePort"
  }
}