# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account
resource "google_service_account" "service-a" {
  account_id = "service-a"

  lifecycle {
    create_before_destroy = true
  }
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam
resource "google_project_iam_member" "service-a" {
  project = "black-mesa-west-gke-research"
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
  member             = "serviceAccount:black-mesa-west-gke-research.svc.id.goog[staging/service-a]"

  lifecycle {
    create_before_destroy = true
  }
}
