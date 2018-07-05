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
  name    = "[${var.environment}] Cloud SQL CPU utilization {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.cpu_utilization_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  avg(${var.cpu_utilization_timeframe}):
  avg:gcp.cloudsql.database.cpu.utilization{${data.template_file.filter.rendered}}
  by {database_id}
  > ${var.cpu_utilization_threshold_critical}
EOF

  thresholds {
    warning  = "${var.cpu_utilization_threshold_warning}"
    critical = "${var.cpu_utilization_threshold_critical}"
  }

  notify_no_data      = true
  require_full_window = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  evaluation_delay    = "${var.delay}"
  new_host_delay      = "${var.delay}"
  silenced            = "${var.cpu_utilization_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "resource:cloud-sql",
    "env:${var.environment}",
    "${var.cpu_utilization_extra_tags}",
  ]
}

#
# Disk Utilization
#
resource "datadog_monitor" "disk_utilization" {
  name    = "[${var.environment}] Cloud SQL Disk utilization {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.disk_utilization_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  avg(${var.disk_utilization_timeframe}):
    avg:gcp.cloudsql.database.disk.utilization{${data.template_file.filter.rendered}}
    by {database_id}
    > ${var.disk_utilization_threshold_critical}
EOF

  thresholds {
    warning  = "${var.disk_utilization_threshold_warning}"
    critical = "${var.disk_utilization_threshold_critical}"
  }

  notify_no_data      = true
  require_full_window = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  evaluation_delay    = "${var.delay}"
  new_host_delay      = "${var.delay}"
  silenced            = "${var.disk_utilization_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "resource:cloud-sql",
    "${var.disk_utilization_extra_tags}",
  ]
}

#
# Memory Utilization
#
resource "datadog_monitor" "memory_utilization" {
  name    = "[${var.environment}] Cloud SQL Memory Utilization {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.memory_utilization_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  avg(${var.memory_utilization_timeframe}):
    avg:gcp.cloudsql.database.memory.utilization{${data.template_file.filter.rendered}}
    by {database_id}
    > ${var.memory_utilization_threshold_critical}
EOF

  thresholds {
    warning  = "${var.memory_utilization_threshold_warning}"
    critical = "${var.memory_utilization_threshold_critical}"
  }

  notify_no_data      = true
  require_full_window = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  evaluation_delay    = "${var.delay}"
  new_host_delay      = "${var.delay}"
  silenced            = "${var.memory_utilization_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "resource:cloud-sql",
    "${var.memory_utilization_extra_tags}",
  ]
}

#
# Memory Utilization Forecast
#
resource "datadog_monitor" "memory_utilization_forecast" {
  name    = "[${var.environment}] Cloud SQL Memory Utilization Forecast {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.memory_utilization_forecast_message, var.message)}"

  type = "query alert"

  query = <<EOF
  max(${var.memory_utilization_forecast_timeframe}):
    forecast(
      avg:gcp.cloudsql.database.memory.utilization{${data.template_file.filter.rendered}} by {database_id},
      'linear',
      1,
      interval='${var.memory_utilization_forecast_interval}',
      history='${var.memory_utilization_forecast_history}',
      model='default'
      )
    > ${var.memory_utilization_forecast_threshold_critical}
EOF

  thresholds {
    warning  = "${var.memory_utilization_forecast_threshold_warning}"
    critical = "${var.memory_utilization_forecast_threshold_critical}"
  }

  notify_no_data      = true
  require_full_window = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  evaluation_delay    = "${var.delay}"
  new_host_delay      = "${var.delay}"
  silenced            = "${var.memory_utilization_forecast_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "resource:cloud-sql",
    "${var.memory_utilization_forecast_extra_tags}",
  ]
}

#
# Failover Unavailable
#
resource "datadog_monitor" "failover_unavailable" {
  name    = "[${var.environment}] Cloud SQL Failover Unavailable {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
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

  notify_no_data      = true
  require_full_window = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  evaluation_delay    = "${var.delay}"
  new_host_delay      = "${var.delay}"
  silenced            = "${var.failover_unavailable_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "resource:cloud-sql",
    "${var.failover_unavailable_extra_tags}",
  ]
}
