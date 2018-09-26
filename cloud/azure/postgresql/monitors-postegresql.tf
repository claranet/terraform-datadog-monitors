data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_azure_postgresql:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "postgresql_cpu_usage" {
  name    = "[${var.environment}] Postgresql Server CPU usage is high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.cpu_usage_message, var.message)}"

  query = <<EOF
    ${var.cpu_usage_time_aggregator}(${var.cpu_usage_timeframe}): (
      avg:azure.dbforpostgresql_servers.cpu_percent{${data.template_file.filter.rendered}} by {resource_group,region,name}
    ) > ${var.cpu_usage_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    critical = "${var.cpu_usage_threshold_critical}"
    warning  = "${var.cpu_usage_threshold_warning}"
  }

  silenced = "${var.cpu_usage_silenced}"

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  tags = ["env:${var.environment}", "resource:postgresql", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "postgresql_no_connection" {
  name    = "[${var.environment}] Postgresql Server has no connection"
  message = "${coalesce(var.no_connection_message, var.message)}"

  query = <<EOF
    ${var.no_connection_time_aggregator}(${var.no_connection_timeframe}): (
      avg:azure.dbforpostgresql_servers.active_connections{${data.template_file.filter.rendered}} by {resource_group,region,name}
    ) < 1
  EOF

  type = "metric alert"

  silenced = "${var.no_connection_silenced}"

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  tags = ["env:${var.environment}", "resource:postgresql", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "postgresql_free_storage" {
  name    = "[${var.environment}] Postgresql Server storage is running low {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.free_storage_message, var.message)}"

  query = <<EOF
    ${var.free_storage_time_aggregator}(${var.free_storage_timeframe}): (
      100 - avg:azure.dbforpostgresql_servers.storage_percent{${data.template_file.filter.rendered}} by {resource_group,region,name}
    ) < ${var.free_storage_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    critical = "${var.free_storage_threshold_critical}"
    warning  = "${var.free_storage_threshold_warning}"
  }

  silenced = "${var.free_storage_silenced}"

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  tags = ["env:${var.environment}", "resource:postgresql", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "postgresql_io_consumption" {
  name    = "[${var.environment}] Postgresql Server IO consumption is high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.io_consumption_message, var.message)}"

  query = <<EOF
    ${var.io_consumption_time_aggregator}(${var.io_consumption_timeframe}): (
      avg:azure.dbforpostgresql_servers.io_consumption_percent{${data.template_file.filter.rendered}} by {resource_group,region,name}
    ) > ${var.io_consumption_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    critical = "${var.io_consumption_threshold_critical}"
    warning  = "${var.io_consumption_threshold_warning}"
  }

  silenced = "${var.io_consumption_silenced}"

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  tags = ["env:${var.environment}", "resource:postgresql", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "postgresql_memory_usage" {
  name    = "[${var.environment}] Postgresql Server memory usage is high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.memory_usage_message, var.message)}"

  query = <<EOF
    ${var.memory_usage_time_aggregator}(${var.memory_usage_timeframe}): (
      avg:azure.dbforpostgresql_servers.memory_percent{${data.template_file.filter.rendered}} by {resource_group,region,name}
    ) > ${var.memory_usage_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    critical = "${var.memory_usage_threshold_critical}"
    warning  = "${var.memory_usage_threshold_warning}"
  }

  silenced = "${var.memory_usage_silenced}"

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  tags = ["env:${var.environment}", "resource:postgresql", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "postgresql_compute_consumption" {
  name    = "[${var.environment}] Postgresql Server compute consumption is high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.compute_consumption_message, var.message)}"

  query = <<EOF
    ${var.compute_consumption_time_aggregator}(${var.compute_consumption_timeframe}): (
      avg:azure.dbforpostgresql_servers.compute_consumption_percent{${data.template_file.filter.rendered}} by {resource_group,region,name}
    ) > ${var.compute_consumption_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    critical = "${var.compute_consumption_threshold_critical}"
    warning  = "${var.compute_consumption_threshold_warning}"
  }

  silenced = "${var.compute_consumption_silenced}"

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"

  tags = ["env:${var.environment}", "resource:postgresql", "team:azure", "provider:azure"]
}
