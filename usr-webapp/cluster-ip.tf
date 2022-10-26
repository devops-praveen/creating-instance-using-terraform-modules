resource "kubernetes_service" "cluster-ip" {
  metadata {
    name = "mysql"
  }
  spec {
    selector = {
      app = "mysql"
    }
    port {
      port = 3306
    }
    type       = "ClusterIP"
    cluster_ip = "None"
  }
}