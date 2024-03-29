resource "google_sql_database_instance" "main" {
  database_version = "POSTGRES_15"
  name             = "primary-instance"
  region           = var.region

  settings {
    activation_policy = "ALWAYS"
    availability_type = "ZONAL"

    backup_configuration {
      backup_retention_settings {
        retained_backups = 7
        retention_unit   = "COUNT"
      }

      enabled                        = true
      location                       = "asia"
      point_in_time_recovery_enabled = true
      start_time                     = "04:00"
      transaction_log_retention_days = 7
    }

    disk_autoresize       = false
    disk_autoresize_limit = 0
    disk_size             = 10
    disk_type             = "PD_SSD"

    ip_configuration {
      ipv4_enabled = true
    }

    location_preference {
      zone = "asia-northeast1-c"
    }

    pricing_plan = "PER_USE"
    tier         = "db-f1-micro"
  }

  # lifecycle {
  #   prevent_destroy = true
  # }
}

resource "google_sql_database" "main" {
  name       = var.region
  instance   = google_sql_database_instance.main.name
  depends_on = [google_sql_database_instance.main]
}


resource "google_sql_user" "main" {
  name       = "primary-user"
  instance   = google_sql_database_instance.main.name
  password   = "primary-password"
  depends_on = [google_sql_database_instance.main]
}
