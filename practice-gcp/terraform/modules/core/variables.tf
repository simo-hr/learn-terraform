variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "workload_identity_member" {
  type        = string
  description = "member of workload identity"
}
