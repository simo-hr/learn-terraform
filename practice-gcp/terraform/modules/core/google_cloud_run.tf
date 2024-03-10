resource "google_cloud_run_v2_service" "web_server" {
  name     = "next-web"
  location = var.region
  template {
    containers {
      image = "${google_artifact_registry_repository.docker.location}-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.docker.name}/next-web:latest"
      resources {
        limits = {
          cpu    = "2"
          memory = "1024Mi"
        }
      }

      env {
        name = "SECRET_ENV_VAR"
        value_source {
          secret_key_ref {
            secret  = google_secret_manager_secret.secret.secret_id
            version = "1"
          }
        }
      }
      volume_mounts {
        name       = "cloudsql"
        mount_path = "/cloudsql"
      }
    }



  }
  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }
  depends_on = [google_secret_manager_secret_version.secret-version-data]
}

resource "google_secret_manager_secret" "secret" {
  secret_id = "secret-1"
  # lifecycle {
    # prevent_destroy = true
  # }

  replication {
    auto {

    }
  }
}

resource "google_secret_manager_secret_version" "secret-version-data" {
  secret      = google_secret_manager_secret.secret.name
  secret_data = "secret-data"
}
