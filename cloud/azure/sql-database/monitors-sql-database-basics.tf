resource "datadog_monitor" "sql-database_cpu_90_15min" {
  count   = "${var.cpu_enabled ? 1 : 0}"
  name    = "[${var.environment}] SQL Database CPU too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.cpu_message, var.message)}"

  query = <<EOF
    ${var.cpu_time_aggregator}(${var.cpu_timeframe}): (
      avg:azure.sql_servers_databases.cpu_percent${module.filter-tags.query_alert} by {resource_group,region,name}
    ) > ${var.cpu_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    critical = "${var.cpu_threshold_critical}"
  }

  silenced = "${var.cpu_silenced}"

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:sql-database", "team:claranet", "created-by:terraform", "${var.cpu_extra_tags}"]
}

resource "datadog_monitor" "sql-database_free_space_low" {
  count   = "${var.diskspace_enabled ? 1 : 0}"
  name    = "[${var.environment}] SQL Database low free space {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.diskspace_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    ${var.diskspace_time_aggregator}(${var.diskspace_timeframe}): (
      avg:azure.sql_servers_databases.storage_percent${module.filter-tags.query_alert} by {resource_group,region,name}
    ) > ${var.diskspace_threshold_critical}
  EOF

  thresholds {
    warning  = "${var.diskspace_threshold_warning}"
    critical = "${var.diskspace_threshold_critical}"
  }

  silenced = "${var.diskspace_silenced}"

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:sql-database", "team:claranet", "created-by:terraform", "${var.diskspace_extra_tags}"]
}

resource "datadog_monitor" "sql-database_dtu_consumption_high" {
  count   = "${var.dtu_enabled ? 1 : 0}"
  name    = "[${var.environment}] SQL Database DTU Consumption too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.dtu_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    ${var.dtu_time_aggregator}(${var.dtu_timeframe}): (
      azure.sql_servers_databases.dtu_consumption_percent${module.filter-tags.query_alert} by {resource_group,region,name}
    ) > ${var.dtu_threshold_critical}
  EOF

  thresholds {
    warning  = "${var.dtu_threshold_warning}"
    critical = "${var.dtu_threshold_critical}"
  }

  silenced = "${var.dtu_silenced}"

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:sql-database", "team:claranet", "created-by:terraform", "${var.dtu_extra_tags}"]
}

resource "datadog_monitor" "sql-database_deadlocks_count" {
  count   = "${var.deadlock_enabled ? 1 : 0}"
  name    = "[${var.environment}] SQL Database Deadlocks too high {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.deadlock_message, var.message)}"

  type = "metric alert"

  query = <<EOF
    sum(${var.deadlock_timeframe}): (
      avg:azure.sql_servers_databases.deadlock${module.filter-tags.query_alert} by {resource_group,region,name}.as_count()
    ) > ${var.deadlock_threshold_critical}
  EOF

  thresholds {
    critical = "${var.deadlock_threshold_critical}"
  }

  silenced = "${var.deadlock_silenced}"

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 1
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.new_host_delay}"

  tags = ["env:${var.environment}", "type:cloud", "provider:azure", "resource:sql-database", "team:claranet", "created-by:terraform", "${var.deadlock_extra_tags}"]
}
