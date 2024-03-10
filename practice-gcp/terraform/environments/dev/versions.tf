terraform {
  required_version = ">=1.4.3"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.19.0"
    }
  }
}

provider "google" {
  region  = local.region
  project = local.project_id
}
