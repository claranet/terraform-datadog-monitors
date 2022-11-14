locals {
  replica_group_by = join(", ", var.replica_group_by)
  job_group_by = var.job_group_by
}