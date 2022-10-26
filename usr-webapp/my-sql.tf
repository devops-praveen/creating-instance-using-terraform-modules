
resource "kubernetes_deployment" "my-sql-db" {
  metadata {
    name = "user-mgmt-sql-db"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "mysql"
      }
    }
    strategy {
      type = "Recreate"
    }
    template {
      metadata {
        labels = {
          app = "mysql"
        }
      }
      spec {
        volume {
          name = "my-storage-vol"
          persistent_volume_claim {
            claim_name = "ebs-mysql-pv-claim"
          }
        }
        volume {
          name = "user-db-creation-script"
          config_map {
            name = "${kubernetes_config_map.webapp-config.metadata.0.name}"
          }
        }
       container {
          name = "mysql"
          image = "mysql:5.6"
          port {
            container_port = 3306
            name = "mysql"
          }
          env {
            name  = "MYSQL_ROOT_PASSWORD"
            value = "dbpassword11"
          }
          volume_mount {

            name       = "my-storage-vol"
            mount_path = "/var/lib/mysql"
          }
          volume_mount {
            name       = "user-db-creation-script"
            mount_path = "/docker-entrypoint-initdb.d"
          }
        }
      }
    }
  }
}


