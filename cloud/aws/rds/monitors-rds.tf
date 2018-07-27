data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_aws_rds:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

### RDS instance CPU monitor ###
resource "datadog_monitor" "rds_cpu_90_15min" {
  name    = "[${var.environment}] RDS instance CPU high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.cpu_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    ${var.cpu_time_aggregator}(${var.cpu_timeframe}): (
      avg:aws.rds.cpuutilization{${data.template_file.filter.rendered}} by {region,name}
    ) > ${var.cpu_threshold_critical}
  EOF

  lifecycle {
    ignore_changes = ["type"]
  }

  thresholds {
    warning  = "${var.cpu_threshold_warning}"
    critical = "${var.cpu_threshold_critical}"
  }

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  silenced = "${var.cpu_silenced}"

  tags = ["env:${var.environment}", "resource:rds", "team:aws", "provider:aws"]
}

### RDS instance free space monitor ###
resource "datadog_monitor" "rds_free_space_low" {
  name    = "[${var.environment}] RDS instance free space {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.diskspace_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  ${var.diskspace_time_aggregator}(${var.diskspace_timeframe}): (
    avg:aws.rds.free_storage_space{${data.template_file.filter.rendered}} by {region,name} /
    avg:aws.rds.total_storage_space{${data.template_file.filter.rendered}} by {region,name} * 100
  ) < ${var.diskspace_threshold_critical}
  EOF

  lifecycle {
    ignore_changes = ["type"]
  }

  thresholds {
    warning  = "${var.diskspace_threshold_warning}"
    critical = "${var.diskspace_threshold_critical}"
  }

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  silenced = "${var.diskspace_silenced}"

  tags = ["env:${var.environment}", "resource:rds", "team:aws", "provider:aws"]
}
