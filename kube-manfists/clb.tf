resource "kubernetes_service" "clb" {
  metadata {
    name = "clb-service"
  }
  spec {
    selector = {
      app = "nginx"
    }
    port {
      port        = 8080
      target_port = 80
    }
    type = "LoadBalancer"
  }
}