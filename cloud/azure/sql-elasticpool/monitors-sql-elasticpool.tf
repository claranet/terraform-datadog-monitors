resource "datadog_monitor" "sql_elasticpool_cpu" {
  count   = var.cpu_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] SQL Elastic Pool CPU too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.cpu_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.cpu_time_aggregator}(${var.cpu_timeframe}): (
      avg:azure.sql_servers_elasticpools.cpu_percent${module.filter-tags.query_alert} by {resource_group,region,server_name,name}
    ) > ${var.cpu_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.cpu_threshold_critical
    warning  = var.cpu_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = var.notify_no_data
  no_data_timeframe   = var.sql_elasticpool_cpu_no_data_timeframe
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:sql-elasticpool", "team:claranet", "created-by:terraform"], var.cpu_extra_tags)
}

resource "datadog_monitor" "sql_elasticpool_free_space_low" {
  count   = var.diskspace_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] SQL Elastic Pool high disk usage {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.diskspace_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.diskspace_time_aggregator}(${var.diskspace_timeframe}): (
      avg:azure.sql_servers_elasticpools.storage_percent${module.filter-tags.query_alert} by {resource_group,region,server_name,name}
    ) > ${var.diskspace_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.diskspace_threshold_warning
    critical = var.diskspace_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:sql-elasticpool", "team:claranet", "created-by:terraform"], var.diskspace_extra_tags)
}

resource "datadog_monitor" "sql_elasticpool_dtu_consumption_high" {
  count   = var.dtu_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] SQL Elastic Pool DTU Consumption too high {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.dtu_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.dtu_time_aggregator}(${var.dtu_timeframe}): (
      azure.sql_servers_elasticpools.dtu_consumption_percent${module.filter-tags.query_alert} by {resource_group,region,server_name,name}
    ) > ${var.dtu_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.dtu_threshold_warning
    critical = var.dtu_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false

  tags = concat(["env:${var.environment}", "type:cloud", "provider:azure", "resource:sql-elasticpool", "team:claranet", "created-by:terraform"], var.dtu_extra_tags)
}

