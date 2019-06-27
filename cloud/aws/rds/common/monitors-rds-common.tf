### RDS instance CPU monitor ###
resource "datadog_monitor" "rds_cpu_90_15min" {
  count   = var.cpu_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] RDS instance CPU high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.cpu_message, var.message)
  type = "query alert"

  query = <<EOQ
    ${var.cpu_time_aggregator}(${var.cpu_timeframe}): (
      avg:aws.rds.cpuutilization${module.filter-tags.query_alert} by {region,name}
    ) > ${var.cpu_threshold_critical}
EOQ

  thresholds = {
    warning = var.cpu_threshold_warning
    critical = var.cpu_threshold_critical
  }

  evaluation_delay = var.evaluation_delay
  new_host_delay = var.new_host_delay
  notify_no_data = false
  notify_audit = false
  timeout_h = 0
  include_tags = true
  locked = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:rds", "team:claranet", "created-by:terraform"], var.cpu_extra_tags)
}

### RDS instance free space monitor ###
resource "datadog_monitor" "rds_free_space_low" {
  count = var.diskspace_enabled == "true" ? 1 : 0
  name = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] RDS instance free space {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.diskspace_message, var.message)
  type = "query alert"

  query = <<EOQ
  ${var.diskspace_time_aggregator}(${var.diskspace_timeframe}): (
    avg:aws.rds.free_storage_space${module.filter-tags.query_alert} by {region,name} /
    avg:aws.rds.total_storage_space${module.filter-tags.query_alert} by {region,name} * 100
  ) < ${var.diskspace_threshold_critical}
EOQ

thresholds = {
warning  = var.diskspace_threshold_warning
critical = var.diskspace_threshold_critical
}

evaluation_delay    = var.evaluation_delay
new_host_delay      = var.new_host_delay
notify_no_data      = true
notify_audit        = false
timeout_h           = 0
include_tags        = true
locked              = false
require_full_window = false

tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:rds", "team:claranet", "created-by:terraform"], var.diskspace_extra_tags)
}

### RDS Replica Lag monitor ###
resource "datadog_monitor" "rds_replica_lag" {
count   = var.replicalag_enabled == "true" ? 1 : 0
name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] RDS replica lag {{#is_alert}}{{{comparator}}} {{threshold}} ms ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ms ({{value}}%){{/is_warning}}"
message = coalesce(var.replicalag_message, var.message)
type = "query alert"

query = <<EOQ
  avg(${var.replicalag_timeframe}): (
    avg:aws.rds.replica_lag${module.filter-tags.query_alert} by {region,name}
  ) > ${var.replicalag_threshold_critical}
EOQ

thresholds = {
warning = var.replicalag_threshold_warning
critical = var.replicalag_threshold_critical
}

evaluation_delay = var.evaluation_delay
new_host_delay = var.new_host_delay
notify_no_data = false
notify_audit = false
timeout_h = 0
include_tags = true
locked = false
require_full_window = false

tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:rds", "team:claranet", "created-by:terraform"], var.replicalag_extra_tags)
}

