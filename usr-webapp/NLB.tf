resource "kubernetes_service" "nlb" {
  metadata {
    name = "nlb-service"
    annotations = {
      "service.beta.kubernetes.io/aws-load-balancer-type" = "nlb" # To create Network Load Balancer
    }
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