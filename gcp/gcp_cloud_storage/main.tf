resource "google_storage_bucket" "auto-expire" {
  name          = var.bucket_name
  location      = var.bucket_region
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }
}