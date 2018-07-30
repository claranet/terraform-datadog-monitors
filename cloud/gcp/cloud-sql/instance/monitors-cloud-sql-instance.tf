#
# FILTER
#
data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ?
              format("project_id:%s", var.project_id) :
             "${var.filter_tags_custom}"}"
  }
}

#
# CPU Utilization
#
resource "datadog_monitor" "cpu_utilization" {
  count = "${var.cpu_utilization_enabled == "true" ? 1 : 0 }"

  name    = "[${var.environment}] Cloud SQL CPU Utilization {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.cpu_utilization_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  avg(${var.cpu_utilization_timeframe}):
    avg:gcp.cloudsql.database.cpu.utilization{${data.template_file.filter.rendered}}
    by {database_id} * 100
  > ${var.cpu_utilization_threshold_critical}
EOF

  thresholds {
    warning  = "${var.cpu_utilization_threshold_warning}"
    critical = "${var.cpu_utilization_threshold_critical}"
  }

  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  no_data_timeframe   = 30
  require_full_window = false
  notify_no_data      = true
  renotify_interval   = 0

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  silenced = "${var.cpu_utilization_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "resource:cloud-sql",
    "env:${var.environment}",
    "created_by:terraform",
    "${var.cpu_utilization_extra_tags}",
  ]
}

#
# Disk Utilization
#
resource "datadog_monitor" "disk_utilization" {
  count = "${var.disk_utilization_enabled == "true" ? 1 : 0 }"

  name    = "[${var.environment}] Cloud SQL Disk Utilization {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.disk_utilization_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  avg(${var.disk_utilization_timeframe}):
    avg:gcp.cloudsql.database.disk.utilization{${data.template_file.filter.rendered}}
    by {database_id} * 100
    > ${var.disk_utilization_threshold_critical}
EOF

  thresholds {
    warning  = "${var.disk_utilization_threshold_warning}"
    critical = "${var.disk_utilization_threshold_critical}"
  }

  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  no_data_timeframe   = 20
  require_full_window = false
  notify_no_data      = true
  renotify_interval   = 0

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  silenced = "${var.disk_utilization_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "created_by:terraform",
    "resource:cloud-sql",
    "${var.disk_utilization_extra_tags}",
  ]
}

#
# Disk Utilization Forecast
#
resource "datadog_monitor" "disk_utilization_forecast" {
  count = "${var.disk_utilization_forecast_enabled == "true" ? 1 : 0 }"

  name    = "[${var.environment}] Cloud SQL Disk Utilization could reach {{#is_alert}}{{threshold}}%{{/is_alert}} in a near future"
  message = "${coalesce(var.disk_utilization_forecast_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  max(${var.disk_utilization_forecast_timeframe}):
    forecast(
      avg:gcp.cloudsql.database.disk.utilization{${data.template_file.filter.rendered}} by {database_id} * 100,
      '${var.disk_utilization_forecast_algorithm}',
      ${var.disk_utilization_forecast_deviations},
      interval='${var.disk_utilization_forecast_interval}',
      ${var.disk_utilization_forecast_algorithm == "linear" ? format("history='%s',model='%s'", var.disk_utilization_forecast_linear_history, var.disk_utilization_forecast_linear_model): ""}
      ${var.disk_utilization_forecast_algorithm == "seasonal" ? format("seasonality='%s'", var.disk_utilization_forecast_seasonal_seasonality): ""}
    )
  >= ${var.disk_utilization_forecast_threshold_critical}
EOF

  thresholds {
    critical          = "${var.disk_utilization_forecast_threshold_critical}"
    critical_recovery = "${var.disk_utilization_forecast_threshold_critical_recovery}"
  }

  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = false
  notify_no_data      = false
  renotify_interval   = 0

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  silenced = "${var.disk_utilization_forecast_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "created_by:terraform",
    "resource:cloud-sql",
    "${var.disk_utilization_forecast_extra_tags}",
  ]
}

#
# Memory Utilization
#
resource "datadog_monitor" "memory_utilization" {
  count = "${var.memory_utilization_enabled == "true" ? 1 : 0 }"

  name    = "[${var.environment}] Cloud SQL Memory Utilization {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.memory_utilization_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  avg(${var.memory_utilization_timeframe}):
    avg:gcp.cloudsql.database.memory.utilization{${data.template_file.filter.rendered}}
    by {database_id} * 100
  > ${var.memory_utilization_threshold_critical}
EOF

  thresholds {
    warning  = "${var.memory_utilization_threshold_warning}"
    critical = "${var.memory_utilization_threshold_critical}"
  }

  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  no_data_timeframe   = 20
  require_full_window = false
  notify_no_data      = true
  renotify_interval   = 0

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  silenced = "${var.memory_utilization_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "created_by:terraform",
    "resource:cloud-sql",
    "${var.memory_utilization_extra_tags}",
  ]
}

#
# Memory Utilization Forecast
#
resource "datadog_monitor" "memory_utilization_forecast" {
  count = "${var.memory_utilization_forecast_enabled == "true" ? 1 : 0 }"

  name    = "[${var.environment}] Cloud SQL Memory Utilization could reach {{#is_alert}}{{threshold}}%{{/is_alert}} in a near future"
  message = "${coalesce(var.memory_utilization_forecast_message, var.message)}"

  type = "query alert"

  query = <<EOF
  max(${var.memory_utilization_forecast_timeframe}):
    forecast(
      avg:gcp.cloudsql.database.memory.utilization{${data.template_file.filter.rendered}} by {database_id} * 100,
      '${var.memory_utilization_forecast_algorithm}',
      ${var.memory_utilization_forecast_deviations},
      interval='${var.memory_utilization_forecast_interval}',
      ${var.memory_utilization_forecast_algorithm == "linear" ? format("history='%s',model='%s'", var.memory_utilization_forecast_linear_history, var.memory_utilization_forecast_linear_model): ""}
      ${var.memory_utilization_forecast_algorithm == "seasonal" ? format("seasonality='%s'", var.memory_utilization_forecast_seasonal_seasonality): ""}
      )
    >= ${var.memory_utilization_forecast_threshold_critical}
EOF

  thresholds {
    critical          = "${var.memory_utilization_forecast_threshold_critical}"
    critical_recovery = "${var.memory_utilization_forecast_threshold_critical_recovery}"
  }

  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  require_full_window = false
  notify_no_data      = false
  renotify_interval   = 0

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  silenced = "${var.memory_utilization_forecast_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "created_by:terraform",
    "resource:cloud-sql",
    "${var.memory_utilization_forecast_extra_tags}",
  ]
}

#
# Failover Unavailable
#
resource "datadog_monitor" "failover_unavailable" {
  count = "${var.failover_unavailable_enabled == "true" ? 1 : 0 }"

  name    = "[${var.environment}] Cloud SQL Failover Unavailable"
  message = "${coalesce(var.failover_unavailable_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  max(${var.failover_unavailable_timeframe}):
    avg:gcp.cloudsql.database.available_for_failover{${data.template_file.filter.rendered}}
    by {database_id}
  <= ${var.failover_unavailable_threshold_critical}
EOF

  thresholds {
    critical = "${var.failover_unavailable_threshold_critical}"
  }

  notify_audit        = false
  locked              = false
  timeout_h           = 0
  include_tags        = true
  no_data_timeframe   = 20
  require_full_window = false
  notify_no_data      = true
  renotify_interval   = 0

  evaluation_delay = "${var.delay}"
  new_host_delay   = "${var.delay}"

  silenced = "${var.failover_unavailable_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "created_by:terraform",
    "resource:cloud-sql",
    "${var.failover_unavailable_extra_tags}",
  ]
}
