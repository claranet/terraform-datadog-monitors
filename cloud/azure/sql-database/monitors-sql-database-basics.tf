data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_azure_sqldatabase:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "sql-database_cpu_90_15min" {
  name    = "[${var.environment}] SQL Database CPU too high {{#is_alert}}{{comparator}}{{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{comparator}}{{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.cpu_message, var.message)}"

  query = <<EOF
    avg(last_15m): (
      avg:azure.sql_servers_databases.cpu_percent{${data.template_file.filter.rendered}} by {resource_group,region,name}
    ) > ${var.cpu_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    critical = "${var.cpu_threshold_critical}"
  }

  silenced = "${var.cpu_silenced}"

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:sqldatabase", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "sql-database_free_space_low" {
  name    = "[${var.environment}] SQL Database low free space {{#is_alert}}{{comparator}}{{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{comparator}}{{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.diskspace_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    avg(last_15m): (
      avg:azure.sql_servers_databases.storage_percent{${data.template_file.filter.rendered}} by {resource_group,region,name}
    ) > ${var.diskspace_threshold_critical}
  EOF

  thresholds {
    warning  = "${var.diskspace_threshold_warning}"
    critical = "${var.diskspace_threshold_critical}"
  }

  silenced = "${var.diskspace_silenced}"

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:sqldatabase", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "sql-database_dtu_consumption_high" {
  name    = "[${var.environment}] SQL Database DTU Consumption too high {{#is_alert}}{{comparator}}{{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{comparator}}{{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.dtu_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    avg(last_15m): (
      azure.sql_servers_databases.dtu_consumption_percent{${data.template_file.filter.rendered}} by {resource_group,region,name}
    ) > ${var.dtu_threshold_critical}
  EOF

  thresholds {
    warning  = "${var.dtu_threshold_warning}"
    critical = "${var.dtu_threshold_critical}"
  }

  silenced = "${var.dtu_silenced}"

  notify_no_data      = true
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:sqldatabase", "team:azure", "provider:azure"]
}

resource "datadog_monitor" "sql-database_deadlocks_count" {
  name    = "[${var.environment}] SQL Database Deadlocks too high {{#is_alert}}{{comparator}}{{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{comparator}}{{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.deadlock_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    sum(last_5m): (
      avg:azure.sql_servers_databases.deadlock{${data.template_file.filter.rendered}} by {resource_group,region,name}.as_count()
    ) > ${var.deadlock_threshold_critical}
  EOF

  thresholds {
    critical = "${var.deadlock_threshold_critical}"
  }

  silenced = "${var.deadlock_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:sqldatabase", "team:azure", "provider:azure"]
}
