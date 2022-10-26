resource "kubernetes_service" "clb" {
  metadata {
    name = "clb-service"
  }
  spec {
    selector = {
      app = "mysql"
    }
    port {
      port        = 8080
      target_port = 80
    }
    type = "LoadBalancer"
  }
}