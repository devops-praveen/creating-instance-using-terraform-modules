resource "kubernetes_config_map" "webapp-config" {
  metadata {
    name = "sql-config"
  }

  data = {
    "webappdb.sql" = "${file("${path.module}/webappdb.sql")}"
  }
}
