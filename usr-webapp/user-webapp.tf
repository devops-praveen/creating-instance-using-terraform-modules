resource "kubernetes_deployment" "user-mgmt" {
  metadata {
    name = "webapp-db"
    labels = {
      app = "mysql"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "mysql"
      }
    }

    template {
      metadata {
        labels = {
          app = "mysql"
        }
      }

      spec {
      container {
        name = "user-mgmt-webapp"
        image = "stacksimplify/kube-usermgmt-webapp:1.0.0-MySQLDB"
#        image_pull_policy = "always"
        port {
          container_port = 8080 
        } 
      
      env {
        name = "DB_HOSTNAME"
        value = "mysql"
      }
      env {
         name = "DB_PORT"
        value = "3306"
      }
      env {
        name = "DB_NAME"
        value = "webappdb"
      }
      env {
        name = "DB_USERNAME"
        value = "root"
      }
      env {
        name = "DB_PASSWORD"
        value = "dbpassword11"
      }
      }

      }

      }
  }
}        