resource "google_artifact_registry_repository" "docker" {
  location      = var.region
  repository_id = "docker"
  description   = "Docker images for Ms-Engineer Reskill Platform"
  format        = "DOCKER"
  depends_on    = [google_project_service.artifactregistry]
}

resource "google_artifact_registry_repository_iam_member" "deploy" {
  repository = google_artifact_registry_repository.docker.name
  location   = google_artifact_registry_repository.docker.location
  role       = "roles/artifactregistry.writer"
  member     = "serviceAccount:${google_service_account.deploy.email}"
}
