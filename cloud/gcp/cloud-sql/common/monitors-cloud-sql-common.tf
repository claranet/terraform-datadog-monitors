#
# CPU Utilization
#
resource "datadog_monitor" "cpu_utilization" {
  count   = var.cpu_utilization_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Cloud SQL CPU Utilization {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.cpu_utilization_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.cpu_utilization_time_aggregator}(${var.cpu_utilization_timeframe}):
      avg:gcp.cloudsql.database.cpu.utilization{${var.filter_tags}} by {database_id} * 100
    > ${var.cpu_utilization_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.cpu_utilization_threshold_warning
    critical = var.cpu_utilization_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = false
  notify_no_data      = false
  renotify_interval   = 0
  priority            = var.priority

  tags = concat(["env:${var.environment}", "type:cloud", "provider:gcp", "resource:cloud-sql", "team:claranet", "created-by:terraform"], var.cpu_utilization_extra_tags)
}

#
# Disk Utilization
#
resource "datadog_monitor" "disk_utilization" {
  count   = var.disk_utilization_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Cloud SQL Disk Utilization {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.disk_utilization_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.disk_utilization_time_aggregator}(${var.disk_utilization_timeframe}):
      avg:gcp.cloudsql.database.disk.utilization{${var.filter_tags}} by {database_id} * 100
    > ${var.disk_utilization_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.disk_utilization_threshold_warning
    critical = var.disk_utilization_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = false
  notify_no_data      = var.notify_no_data
  no_data_timeframe   = var.disk_utilization_no_data_timeframe
  renotify_interval   = 0
  priority            = var.priority

  tags = concat(["env:${var.environment}", "type:cloud", "provider:gcp", "resource:cloud-sql", "team:claranet", "created-by:terraform"], var.disk_utilization_extra_tags)
}

#
# Disk Utilization Forecast
#
resource "datadog_monitor" "disk_utilization_forecast" {
  count   = var.disk_utilization_forecast_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Cloud SQL Disk Utilization could reach {{#is_alert}}{{threshold}}%%{{/is_alert}} in a near future"
  message = coalesce(var.disk_utilization_forecast_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.disk_utilization_forecast_time_aggregator}(${var.disk_utilization_forecast_timeframe}):
    forecast(
      avg:gcp.cloudsql.database.disk.utilization{${var.filter_tags}} by {database_id} * 100,
      '${var.disk_utilization_forecast_algorithm}',
      ${var.disk_utilization_forecast_deviations},
      interval='${var.disk_utilization_forecast_interval}',
      ${var.disk_utilization_forecast_algorithm == "linear" ? format("history='%s',model='%s'", var.disk_utilization_forecast_linear_history, var.disk_utilization_forecast_linear_model) : ""}
      ${var.disk_utilization_forecast_algorithm == "seasonal" ? format("seasonality='%s'", var.disk_utilization_forecast_seasonal_seasonality) : ""}
    )
  >= ${var.disk_utilization_forecast_threshold_critical}
EOQ

  monitor_thresholds {
    critical          = var.disk_utilization_forecast_threshold_critical
    critical_recovery = var.disk_utilization_forecast_threshold_critical_recovery
  }

  evaluation_delay    = var.evaluation_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = false
  notify_no_data      = false
  renotify_interval   = 0
  priority            = var.priority

  tags = concat(["env:${var.environment}", "type:cloud", "provider:gcp", "resource:cloud-sql", "team:claranet", "created-by:terraform"], var.disk_utilization_forecast_extra_tags)
}

#
# Memory Utilization
#
resource "datadog_monitor" "memory_utilization" {
  count   = var.memory_utilization_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Cloud SQL Memory Utilization {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.memory_utilization_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.memory_utilization_time_aggregator}(${var.memory_utilization_timeframe}):
      avg:gcp.cloudsql.database.memory.utilization{${var.filter_tags}} by {database_id} * 100
    > ${var.memory_utilization_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.memory_utilization_threshold_warning
    critical = var.memory_utilization_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = false
  notify_no_data      = false
  renotify_interval   = 0
  priority            = var.priority

  tags = concat(["env:${var.environment}", "type:cloud", "provider:gcp", "resource:cloud-sql", "team:claranet", "created-by:terraform"], var.memory_utilization_extra_tags)
}

#
# Memory Utilization Forecast
#
resource "datadog_monitor" "memory_utilization_forecast" {
  count   = var.memory_utilization_forecast_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Cloud SQL Memory Utilization could reach {{#is_alert}}{{threshold}}%%{{/is_alert}} in a near future"
  message = coalesce(var.memory_utilization_forecast_message, var.message)
  type    = "query alert"

  query = <<EOQ
  ${var.memory_utilization_forecast_time_aggregator}(${var.memory_utilization_forecast_timeframe}):
    forecast(
      avg:gcp.cloudsql.database.memory.utilization{${var.filter_tags}} by {database_id} * 100,
      '${var.memory_utilization_forecast_algorithm}',
      ${var.memory_utilization_forecast_deviations},
      interval='${var.memory_utilization_forecast_interval}',
      ${var.memory_utilization_forecast_algorithm == "linear" ? format("history='%s',model='%s'", var.memory_utilization_forecast_linear_history, var.memory_utilization_forecast_linear_model) : ""}
      ${var.memory_utilization_forecast_algorithm == "seasonal" ? format("seasonality='%s'", var.memory_utilization_forecast_seasonal_seasonality) : ""}
      )
    >= ${var.memory_utilization_forecast_threshold_critical}
EOQ

  monitor_thresholds {
    critical          = var.memory_utilization_forecast_threshold_critical
    critical_recovery = var.memory_utilization_forecast_threshold_critical_recovery
  }

  evaluation_delay    = var.evaluation_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = false
  notify_no_data      = false
  renotify_interval   = 0
  priority            = var.priority

  tags = concat(["env:${var.environment}", "type:cloud", "provider:gcp", "resource:cloud-sql", "team:claranet", "created-by:terraform"], var.memory_utilization_forecast_extra_tags)
}

#
# Failover Unavailable
#
resource "datadog_monitor" "failover_unavailable" {
  count   = var.failover_unavailable_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Cloud SQL Failover Unavailable"
  message = coalesce(var.failover_unavailable_message, var.message)
  type    = "metric alert"

  query = <<EOQ
  ${var.failover_unavailable_time_aggregator}(${var.failover_unavailable_timeframe}):
  priority = var.priority

    avg:gcp.cloudsql.database.available_for_failover{${join(", ", compact([var.filter_tags_failover_unavailable, var.filter_tags_failover_unavailable != "" && var.filter_tags == "*" ? "" : var.filter_tags]))}}
  <= ${var.failover_unavailable_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.failover_unavailable_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_group_delay     = var.new_group_delay
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = false
  notify_no_data      = false
  renotify_interval   = 0
  priority            = var.priority

  tags = concat(["env:${var.environment}", "type:cloud", "provider:gcp", "resource:cloud-sql", "team:claranet", "created-by:terraform"], var.failover_unavailable_extra_tags)
}
