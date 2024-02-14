locals {
  replica_group_by    = join(", ", var.replica_group_by)
  deployment_group_by = join(", ", var.deployment_group_by)
}
