resource "google_service_account" "terraform" {
  account_id   = "terraform"
  display_name = "Terraform service account"
}

resource "google_project_iam_member" "terraform_is_owner" {
  project = var.project_id
  role    = "roles/owner"
  member  = "serviceAccount:${google_service_account.terraform.email}"
}
