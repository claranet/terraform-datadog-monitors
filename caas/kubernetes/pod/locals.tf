locals {
  pod_group_by        = join(", ", var.pod_group_by)
  pod_status_group_by = join(", ", var.pod_status_group_by)
  pod_granular        = join(", ", var.pod_granular)
}
