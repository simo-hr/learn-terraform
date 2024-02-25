
resource "google_service_account" "deploy" {
  account_id   = "deploy"
  display_name = "Deploy service account"
}

resource "google_service_account_iam_member" "deploy_binds_github" {
  service_account_id = google_service_account.deploy.name
  role               = "roles/iam.workloadIdentityUser"
  member             = var.workload_identity_member
}
