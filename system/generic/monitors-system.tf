resource "datadog_monitor" "datadog_host_unreachable" {
  count   = "${var.unreachable_enabled ? 1 : 0}"
  name    = "[${var.environment}] Host unreachable"
  message = "${coalesce(var.unreachable_message, var.message)}"

  query = "\"datadog.agent.up\".over${module.filter-tags.service_check}.last(6).count_by_status()"

  type = "service check"

  thresholds {
    ok       = 1
    warning  = 1
    critical = 5
  }

  notify_no_data      = true
  new_host_delay      = "${var.new_host_delay}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  no_data_timeframe   = "${var.unreachable_no_data_timeframe}"

  silenced = "${var.unreachable_silenced}"

  tags = ["env:${var.environment}", "type:system", "provider:host", "resource:generic", "team:claranet", "created-by:terraform", "${var.unreachable_extra_tags}"]
}

resource "datadog_monitor" "datadog_cpu_too_high" {
  count   = "${var.cpu_high_enabled ? 1 : 0}"
  name    = "[${var.environment}] CPU usage {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.cpu_high_message, var.message)}"

  query = <<EOF
    ${var.cpu_high_time_aggregator}(${var.cpu_high_timeframe}): (
      100 - avg:system.cpu.idle${module.filter-tags.query_alert} by {region,host}
    ) > ${var.cpu_high_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.cpu_high_threshold_warning}"
    critical = "${var.cpu_high_threshold_critical}"
  }

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay}"
  new_host_delay      = "${var.new_host_delay}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.cpu_high_silenced}"

  tags = ["env:${var.environment}", "type:system", "provider:system-check", "resource:generic", "team:claranet", "created-by:terraform", "${var.cpu_high_extra_tags}"]
}

resource "datadog_monitor" "datadog_load_too_high" {
  count   = "${var.cpu_load_enabled ? 1 : 0}"
  name    = "[${var.environment}] CPU load 5 {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.cpu_load_message, var.message)}"

  query = <<EOF
    ${var.cpu_load_time_aggregator}(${var.cpu_load_timeframe}): (
      avg:system.load.5${module.filter-tags.query_alert} by {region,host} /
      avg:system.core.count${module.filter-tags.query_alert} by {region,host}
    ) > ${var.cpu_load_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.cpu_load_threshold_warning}"
    critical = "${var.cpu_load_threshold_critical}"
  }

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay}"
  new_host_delay      = "${var.new_host_delay}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.cpu_load_silenced}"

  tags = ["env:${var.environment}", "type:system", "provider:system-core", "resource:generic", "team:claranet", "created-by:terraform", "${var.cpu_load_extra_tags}"]
}

resource "datadog_monitor" "datadog_free_disk_space_too_low" {
  count   = "${var.free_disk_space_enabled ? 1 : 0}"
  name    = "[${var.environment}] Free disk space {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.free_disk_space_message, var.message)}"

  query = <<EOF
    ${var.free_disk_space_time_aggregator}(${var.free_disk_space_timeframe}): (
      avg:system.disk.free${module.filter-tags-disk.query_alert} by {region,host,device} /
      avg:system.disk.total${module.filter-tags-disk.query_alert} by {region,host,device} * 100
    ) < ${var.free_disk_space_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.free_disk_space_threshold_warning}"
    critical = "${var.free_disk_space_threshold_critical}"
  }

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay}"
  new_host_delay      = "${var.new_host_delay}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.free_disk_space_silenced}"

  tags = ["env:${var.environment}", "type:system", "provider:disk", "resource:generic", "team:claranet", "created-by:terraform", "${var.free_disk_space_extra_tags}"]
}

resource "datadog_monitor" "datadog_free_disk_space_forecast" {
  count   = "${var.free_disk_space_forecast_enabled ? 1 : 0}"
  name    = "[${var.environment}] Disk Space could reach {{#is_alert}}{{threshold}}%{{/is_alert}} in a near future"
  message = "${coalesce(var.free_disk_space_forecast_message, var.message)}"

  query = <<EOF
    ${var.free_disk_space_forecast_time_aggregator}(${var.free_disk_space_forecast_timeframe}):
      forecast(avg:system.disk.in_use${module.filter-tags-disk.query_alert} by {host,device} * 100,
              '${var.free_disk_space_forecast_algorithm}',
               ${var.free_disk_space_forecast_deviations},
               interval='${var.free_disk_space_forecast_interval}',
               ${var.free_disk_space_forecast_algorithm == "linear" ? format("history='%s',model='%s'", var.free_disk_space_forecast_linear_history, var.free_disk_space_forecast_linear_model): ""}
               ${var.free_disk_space_forecast_algorithm == "seasonal" ? format("seasonality='%s'", var.free_disk_space_forecast_seasonal_seasonality): ""}
              )
    >= ${var.free_disk_space_forecast_threshold_critical}
  EOF

  type = "query alert"

  thresholds {
    critical_recovery = "${var.free_disk_space_forecast_threshold_critical_recovery}"
    critical          = "${var.free_disk_space_forecast_threshold_critical}"
  }

  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = true
  notify_no_data      = false
  renotify_interval   = 0

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  silenced = "${var.free_disk_space_forecast_silenced}"

  tags = ["env:${var.environment}", "type:system", "provider:disk", "resource:generic", "team:claranet", "created-by:terraform", "${var.free_disk_space_forecast_extra_tags}"]
}

resource "datadog_monitor" "datadog_free_disk_space_inodes_too_low" {
  count   = "${var.free_disk_inodes_enabled ? 1 : 0}"
  name    = "[${var.environment}] Free disk inodes {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.free_disk_inodes_message, var.message)}"

  query = <<EOF
    ${var.free_disk_inodes_time_aggregator}(${var.free_disk_inodes_timeframe}): (
      avg:system.fs.inodes.free${module.filter-tags-disk.query_alert} by {region,host,device} /
      avg:system.fs.inodes.total${module.filter-tags-disk.query_alert} by {region,host,device} * 100
    ) < ${var.free_disk_inodes_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.free_disk_inodes_threshold_warning}"
    critical = "${var.free_disk_inodes_threshold_critical}"
  }

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay}"
  new_host_delay      = "${var.new_host_delay}"
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.free_disk_inodes_silenced}"

  tags = ["env:${var.environment}", "type:system", "provider:disk", "resource:generic", "team:claranet", "created-by:terraform", "${var.free_disk_inodes_extra_tags}"]
}

resource "datadog_monitor" "datadog_free_memory" {
  count   = "${var.free_memory_enabled ? 1 : 0}"
  name    = "[${var.environment}] Free memory {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${var.free_memory_message}"

  query = <<EOF
    ${var.free_memory_time_aggregator}(${var.free_memory_timeframe}): (
      avg:system.mem.usable${module.filter-tags.query_alert} by {region,host} /
      avg:system.mem.total${module.filter-tags.query_alert} by {region,host} * 100
    ) < ${var.free_memory_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.free_memory_threshold_warning}"
    critical = "${var.free_memory_threshold_critical}"
  }

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay}"
  new_host_delay      = "${var.new_host_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.free_memory_silenced}"

  tags = ["env:${var.environment}", "type:system", "provider:system-check", "resource:generic", "team:claranet", "created-by:terraform", "${var.free_memory_extra_tags}"]
}
