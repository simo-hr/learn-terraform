terraform {
  backend "gcs" {
    bucket = "next-sample-415412-terraform-state"
    prefix = "state"
  }
}
