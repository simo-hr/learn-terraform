output "workload_identity_member" {
  value = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github.name}/attribute.repository/simo-hr/nextjs-dashboard"
}
