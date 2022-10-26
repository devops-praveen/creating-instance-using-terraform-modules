# Resource: Persistent Volume Claim
resource "kubernetes_persistent_volume_claim" "pvc" {
  metadata {
    name = "ebs-mysql-pv-claim"
  }
  spec {
    access_modes       = ["ReadWriteOnce"]
    storage_class_name = "ebs-sc" #kubernetes_storage_class.webapp-storage.metadata.0.name 
    resources {
      requests = {
        storage = "4Gi"
      }
    }
  }
}

  