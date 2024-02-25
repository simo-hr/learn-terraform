module "core" {
  source                   = "../../modules/core"
  project_id               = local.project_id
  region                   = local.region
  workload_identity_member = module.workload_identity.workload_identity_member
}

module "workload_identity" {
  source     = "../../modules/workload-identity"
  project_id = local.project_id
  region     = local.region
}
