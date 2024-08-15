# https://www.terraform.io/language/settings/backends/gcs
terraform {
  backend "gcs" {
    bucket = "black-mesa-gke-bucket"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {
  project = "black-mesa-gke-research"
  region  = "us-central1"
}
