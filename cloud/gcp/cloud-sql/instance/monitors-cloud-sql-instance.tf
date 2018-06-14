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
  message = "${coalesce(var.cpu_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  avg(${var.cpu_timeframe}): avg:gcp.cloudsql.database.cpu.utilization{${data.template_file.filter.rendered}}
  by {database_id}
  > ${var.cpu_threshold_critical}
EOF

  thresholds {
    warning  = "${var.cpu_threshold_warning}"
    critical = "${var.cpu_threshold_critical}"
  }

  include_tags        = true
  notify_no_data      = true
  require_full_window = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  evaluation_delay    = "${var.delay}"
  new_host_delay      = "${var.delay}"
  silenced            = "${var.cpu_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "resource:cloud-sql",
  ]
}

#
# Disk Utilization
#
resource "datadog_monitor" "disk_utilization" {
  name    = "[${var.environment}] Cloud SQL Disk utilization {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.disk_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  avg(${var.disk_timeframe}):
    avg:gcp.cloudsql.database.disk.utilization{${data.template_file.filter.rendered}}
    by {database_id}
    > ${var.disk_threshold_critical}
EOF

  thresholds {
    warning  = "${var.disk_threshold_warning}"
    critical = "${var.disk_threshold_critical}"
  }

  include_tags        = true
  notify_no_data      = true
  require_full_window = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  evaluation_delay    = "${var.delay}"
  new_host_delay      = "${var.delay}"
  silenced            = "${var.disk_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "resource:cloud-sql",
  ]
}

#
# Memory Utilization
#
resource "datadog_monitor" "memory_utilization" {
  name    = "[${var.environment}] Cloud SQL Memory Utilization {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.memory_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  avg(${var.memory_timeframe}):
    avg:gcp.cloudsql.database.memory.utilization{${data.template_file.filter.rendered}}
    by {database_id}
    > ${var.memory_threshold_critical}
EOF

  thresholds {
    warning  = "${var.memory_threshold_warning}"
    critical = "${var.memory_threshold_critical}"
  }

  include_tags        = true
  notify_no_data      = true
  require_full_window = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  evaluation_delay    = "${var.delay}"
  new_host_delay      = "${var.delay}"
  silenced            = "${var.memory_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "resource:cloud-sql",
  ]
}

resource "datadog_monitor" "memory_utilization_forecast" {
  name    = "[${var.environment}] Cloud SQL Memory Utilization Forecast {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.memory_forecast_message, var.message)}"

  type = "query alert"

  query = <<EOF
  max(${var.memory_forecast_timeframe}):
    forecast(
      avg:gcp.cloudsql.database.memory.utilization{${data.template_file.filter.rendered}} by {database_id},
      'linear',
      1,
      interval='${var.memory_forecast_interval}',
      history='${var.memory_forecast_history}',
      model='default'
      )
    > ${var.memory_forecast_threshold_critical}
EOF

  thresholds {
    warning  = "${var.memory_forecast_threshold_warning}"
    critical = "${var.memory_forecast_threshold_critical}"
  }

  include_tags        = true
  notify_no_data      = true
  require_full_window = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  evaluation_delay    = "${var.delay}"
  new_host_delay      = "${var.delay}"
  silenced            = "${var.memory_forecast_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "resource:cloud-sql",
  ]
}
