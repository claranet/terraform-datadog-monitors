data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_aws_system:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "datadog_cpu_too_high" {
  name    = "[${var.environment}] CPU too High {{comparator}} {{#is_alert}}{{threshold}}%{{/is_alert}}{{#is_warning}}{{warn_threshold}}%{{/is_warning}} ({{value}}%)"
  message = "${var.message}"

  query = <<EOF
    min(${var.cpu_high_timeframe}): (
      avg:system.cpu.system{${data.template_file.filter.rendered}} by {region,host} +
      avg:system.cpu.user{${data.template_file.filter.rendered}} by {region,host}
    ) > ${var.cpu_high_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.cpu_high_threshold_warning}"
    critical = "${var.cpu_high_threshold_critical}"
  }

  tags = ["env:${var.environment}", "type:system"]

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay}"
  new_host_delay      = "${var.evaluation_delay}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  no_data_timeframe   = 20
}

resource "datadog_monitor" "datadog_free_disk_space_too_low" {
  name    = "[${var.environment}] Free disk space {{comparator}} {{#is_alert}}{{threshold}}%{{/is_alert}}{{#is_warning}}{{warn_threshold}}%{{/is_warning}} ({{value}}%)"
  message = "${var.message}"

  query = <<EOF
    sum(last_5m): (
      avg:system.disk.free{${data.template_file.filter.rendered}} by {region,host,device} /
      avg:system.disk.total{${data.template_file.filter.rendered}} by {region,host,device} * 100
    ) < ${var.free_disk_space_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.free_disk_space_threshold_warning}"
    critical = "${var.free_disk_space_threshold_critical}"
  }

  tags = ["env:${var.environment}", "type:system"]

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay}"
  new_host_delay      = "${var.evaluation_delay}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  no_data_timeframe   = 20
}

resource "datadog_monitor" "datadog_free_disk_space_inodes_too_low" {
  name    = "[${var.environment}] Free disk inodes {{comparator}} {{#is_alert}}{{threshold}}%{{/is_alert}}{{#is_warning}}{{warn_threshold}}%{{/is_warning}} ({{value}}%)"
  message = "${var.message}"

  query = <<EOF
    sum(last_5m): (
      avg:system.fs.inodes.free{${data.template_file.filter.rendered}} by {region,host,device} /
      avg:system.fs.inodes.total{${data.template_file.filter.rendered}} by {region,host,device} * 100
    ) < ${var.free_disk_inodes_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.free_disk_inodes_threshold_warning}"
    critical = "${var.free_disk_inodes_threshold_critical}"
  }

  tags = ["env:${var.environment}", "type:system"]

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay}"
  new_host_delay      = "${var.evaluation_delay}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  no_data_timeframe   = 20
}

resource "datadog_monitor" "datadog_free_memory" {
  name    = "[${var.environment}] Free memory {{comparator}} {{#is_alert}}{{threshold}}%{{/is_alert}}{{#is_warning}}{{warn_threshold}}%{{/is_warning}} ({{value}}%)"
  message = "Debugging alert - no escalation"

  query = <<EOF
    sum(last_1m): (
      avg:system.mem.free{${data.template_file.filter.rendered}} by {region,host} /
      avg:system.mem.total{${data.template_file.filter.rendered}} by {region,host} * 100
    ) < ${var.free_memory_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.free_memory_threshold_warning}"
    critical = "${var.free_memory_threshold_critical}"
  }

  tags = ["env:${var.environment}", "type:system"]

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay}"
  new_host_delay      = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  no_data_timeframe   = 20
}
