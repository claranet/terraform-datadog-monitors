resource "datadog_monitor" "fsx_windows_free_storage_capacity" {
  count   = var.fsx_windows_free_storage_capacity_enabled ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] FSX for Windows Free Storage Capacity {{#is_alert}}is at 0{{/is_alert}}{{#is_warning}}is at {{value}}%%{{/is_warning}}"
  message = coalesce(var.fsx_windows_free_storage_capacity_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.fsx_windows_free_storage_capacity_time_aggregator}(${var.fsx_windows_free_storage_capacity_timeframe}): (
      avg:aws.fsx_windows.free_storage_capacity${module.filter-tags.query_alert} by {region,filesystemid} /
      ( 1024 * 1024 * 1024 )
    ) < ${var.fsx_windows_free_storage_capacity_threshold_critical}
EOQ

  thresholds = {
    critical = var.fsx_windows_free_storage_capacity_threshold_critical
    warning  = var.fsx_windows_free_storage_capacity_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = var.notify_no_data
  no_data_timeframe   = var.fsx_windows_free_storage_capacity_no_data_timeframe
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = 0
  include_tags        = true

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:fsx", "team:claranet", "created-by:terraform"], var.fsx_windows_free_storage_capacity_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "fsx_windows_throughput" {
  count   = var.fsx_windows_throughput_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] FSX for Windows througput {{#is_alert}}{{{comparator}}} {{threshold}}s ({{value}}s){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}s ({{value}}s){{/is_warning}}"
  message = coalesce(var.fsx_windows_throughput_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.fsx_windows_throughput_time_aggregator}(${var.fsx_windows_throughput_timeframe}): (
      ( avg:aws.fsx_windows.data_read_bytes${module.filter-tags.query_alert} by {region,filesystemid} +
        avg:aws.fsx_windows.data_write_bytes${module.filter-tags.query_alert} by {region,filesystemid} ) /
        ( 1024 * 1024 )
      ) > ${var.fsx_windows_throughput_threshold_critical}
EOQ

  thresholds = {
    critical = var.fsx_windows_throughput_threshold_critical
    warning  = var.fsx_windows_throughput_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = 0
  include_tags        = true

  tags = concat(["env:${var.environment}", "type:cloud", "provider:aws", "resource:fsx", "team:claranet", "created-by:terraform"], var.fsx_windows_throughput_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

