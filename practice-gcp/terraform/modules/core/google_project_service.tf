
resource "google_project_service" "run" {
  service            = "run.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "pubsub" {
  service            = "pubsub.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "artifactregistry" {
  service            = "artifactregistry.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "google_sql_database_instance" {
  service            = "sql-component.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "google_secret_manager_secret" {
  service            = "secretmanager.googleapis.com"
  disable_on_destroy = false
}
