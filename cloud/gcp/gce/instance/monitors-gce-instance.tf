#
# CPU Utilization
#
resource "datadog_monitor" "cpu_utilization" {
  count   = var.cpu_utilization_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Compute Engine instance CPU Utilization {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.cpu_utilization_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.cpu_utilization_time_aggregator}(${var.cpu_utilization_timeframe}):
    avg:gcp.gce.instance.cpu.utilization{${var.filter_tags}} by {instance_name} * 100
  > ${var.cpu_utilization_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.cpu_utilization_threshold_warning
    critical = var.cpu_utilization_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = false
  notify_no_data      = var.notify_no_data
  no_data_timeframe   = var.cpu_utilization_no_data_timeframe
  renotify_interval   = 0

  tags = concat(["env:${var.environment}", "type:cloud", "provider:gcp", "resource:gce-instance", "team:claranet", "created-by:terraform"], var.cpu_utilization_extra_tags)
}

#
# Disk Throttled Bps
#
resource "datadog_monitor" "disk_throttled_bps" {
  count   = var.disk_throttled_bps_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Compute Engine instance Disk Throttled Bps {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.disk_throttled_bps_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.disk_throttled_bps_time_aggregator}(${var.disk_throttled_bps_timeframe}):
    (
      sum:gcp.gce.instance.disk.throttled_read_bytes_count{${var.filter_tags}} by {instance_name, device_name} +
      sum:gcp.gce.instance.disk.throttled_write_bytes_count{${var.filter_tags}} by {instance_name, device_name}
    ) / (
      sum:gcp.gce.instance.disk.read_bytes_count{${var.filter_tags}} by {instance_name, device_name} +
      sum:gcp.gce.instance.disk.write_bytes_count{${var.filter_tags}} by {instance_name, device_name}
    ) * 100
    > ${var.disk_throttled_bps_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.disk_throttled_bps_threshold_warning
    critical = var.disk_throttled_bps_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = false
  notify_no_data      = false
  renotify_interval   = 0

  tags = concat(["env:${var.environment}", "type:cloud", "provider:gcp", "resource:gce-instance", "team:claranet", "created-by:terraform"], var.disk_throttled_bps_extra_tags)
}

#
# Disk Throttled OPS
#
resource "datadog_monitor" "disk_throttled_ops" {
  count   = var.disk_throttled_ops_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Compute Engine instance Disk Throttled OPS {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.disk_throttled_ops_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.disk_throttled_ops_time_aggregator}(${var.disk_throttled_ops_timeframe}):
    (
      sum:gcp.gce.instance.disk.throttled_read_ops_count{${var.filter_tags}} by {instance_name, device_name} +
      sum:gcp.gce.instance.disk.throttled_write_ops_count{${var.filter_tags}} by {instance_name, device_name}
    ) / (
      sum:gcp.gce.instance.disk.read_ops_count{${var.filter_tags}} by {instance_name, device_name} +
      sum:gcp.gce.instance.disk.write_ops_count{${var.filter_tags}} by {instance_name, device_name}
    ) * 100
    > ${var.disk_throttled_ops_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.disk_throttled_ops_threshold_warning
    critical = var.disk_throttled_ops_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = false
  renotify_interval   = 0

  tags = concat(["env:${var.environment}", "type:cloud", "provider:gcp", "resource:gce-instance", "team:claranet", "created-by:terraform"], var.disk_throttled_ops_extra_tags)
}

