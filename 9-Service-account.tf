# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account
resource "google_service_account" "service-a" {
  account_id = "service-a"

  lifecycle {
    create_before_destroy = true
  }
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam
resource "google_project_iam_member" "service-a" {
  project = "friendly-aurora-447303-m9"
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.service-a.email}"

  lifecycle {
    create_before_destroy = true
  }
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account_iam
resource "google_service_account_iam_member" "service-a" {
  service_account_id = google_service_account.service-a.id
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:friendly-aurora-447303-m9.svc.id.goog[staging/service-a]"

  lifecycle {
    create_before_destroy = true
  }
}
