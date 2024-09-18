locals {
  replica_group_by       = join(", ", var.replica_group_by)
  deployment_group_by    = join(", ", var.deployment_group_by)
  jobfailed_group_by     = join(", ", [for i in var.jobfailed_group_by : format("%q", i)])
  cronjobfailed_group_by = join(", ", [for i in var.cronjobfailed_group_by : format("%q", i)])
}
