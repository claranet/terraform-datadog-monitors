### RDS instance CPU monitor ###
resource "datadog_monitor" "rds_cpu_90_15min" {
  count   = "${var.cpu_enabled ? 1 : 0}"
  name    = "[${var.environment}] RDS instance CPU high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.cpu_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    ${var.cpu_time_aggregator}(${var.cpu_timeframe}): (
      avg:aws.rds.cpuutilization${module.filter-tags.query_alert} by {region,name}
    ) > ${var.cpu_threshold_critical}
EOF

  thresholds {
    warning  = "${var.cpu_threshold_warning}"
    critical = "${var.cpu_threshold_critical}"
  }

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  silenced = "${var.cpu_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:aws", "resource:rds", "team:claranet", "created-by:terraform", "${var.cpu_extra_tags}"]
}

### RDS instance free space monitor ###
resource "datadog_monitor" "rds_free_space_low" {
  count   = "${var.diskspace_enabled ? 1 : 0}"
  name    = "[${var.environment}] RDS instance free space {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.diskspace_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  ${var.diskspace_time_aggregator}(${var.diskspace_timeframe}): (
    avg:aws.rds.free_storage_space${module.filter-tags.query_alert} by {region,name} /
    avg:aws.rds.total_storage_space${module.filter-tags.query_alert} by {region,name} * 100
  ) < ${var.diskspace_threshold_critical}
EOF

  thresholds {
    warning  = "${var.diskspace_threshold_warning}"
    critical = "${var.diskspace_threshold_critical}"
  }

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  silenced = "${var.diskspace_silenced}"

  tags = ["env:${var.environment}", "type:cloud", "provider:aws", "resource:rds", "team:claranet", "created-by:terraform", "${var.diskspace_extra_tags}"]
}
