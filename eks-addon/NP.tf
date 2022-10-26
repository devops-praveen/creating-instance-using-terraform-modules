resource "kubernetes_service" "nodeport" {
  metadata {
    name = "np-service"
  }
  spec {
    selector = {
      app = "mysql"
    }
    port {
      port        = 8080
      target_port = 80
    }
    type = "NodePort"
  }
}