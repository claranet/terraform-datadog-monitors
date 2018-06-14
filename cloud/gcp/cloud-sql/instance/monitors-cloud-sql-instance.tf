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
  avg(${var.cpu_timeframe}): (
    avg:gcp.cloudsql.database.cpu.utilization{${data.template_file.filter.rendered}}
    )
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
    "${var.cpu_tags}",
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
  avg(${var.disk_timeframe}): (
    avg:gcp.cloudsql.database.disk.utilization{${data.template_file.filter.rendered}}
    )
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
    "${var.disk_tags}",
  ]
}

#
# Network Connections
#
resource "datadog_monitor" "network_connections" {
  name    = "[${var.environment}] Cloud SQL Network Connections (hard limit: ${var.network_connections_hard_limit}) {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.network_connections_message, var.message)}"

  type = "metric alert"

  query = <<EOF
  avg(${var.network_connections_timeframe}): (
    avg:gcp.cloudsql.database.network.connections{${data.template_file.filter.rendered}}
    /${var.network_connections_hard_limit}
    )
    by {database_id}
    > ${var.network_connections_threshold_critical}
EOF

  thresholds {
    warning  = "${var.network_connections_threshold_warning}"
    critical = "${var.network_connections_threshold_critical}"
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
  silenced            = "${var.network_connections_silenced}"

  tags = [
    "team:gcp",
    "provider:gcp",
    "env:${var.environment}",
    "resource:cloud-sql",
    "${var.network_connections_tags}",
  ]
}
