resource "datadog_monitor" "pgbouncer_availability" {
  count   = var.pgbouncer_availability_enabled ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] PGBouncer does not respond"
  message = coalesce(var.pgbouncer_availability_message, var.message)
  type    = "service check"

  query = <<EOQ
    "pgbouncer.can_connect"${module.filter-tags.service_check}.by("host","db").last(6).count_by_status()
EOQ

  monitor_thresholds {
    warning  = var.pgbouncer_availability_threshold_warning
    critical = 5
  }

  no_data_timeframe   = var.pgbouncer_availability_no_data_timeframe
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = true

  tags = concat(["env:${var.environment}", "type:database", "provider:pgbouncer", "resource:pgbouncer", "team:claranet", "created-by:terraform"], var.pgbouncer_availability_extra_tags)
}

resource "datadog_monitor" "pgbouncer_pool_connection_limit" {
  count   = var.pgbouncer_pool_connection_limit_enabled ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] PGBouncer pool connection limit"
  message = coalesce(var.pgbouncer_pool_connection_limit_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.pgbouncer_pool_connection_limit_time_aggregator}(${var.pgbouncer_pool_connection_limit_timeframe}):
      avg:pgbouncer.pools.cl_active${module.filter-tags.query_alert} by {host,db}
    > ${var.pgbouncer_pool_connection_limit_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.pgbouncer_pool_connection_limit_threshold_warning
    critical = var.pgbouncer_pool_connection_limit_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = 0
  include_tags        = true

  tags = concat(["env:${var.environment}", "type:database", "provider:pgbouncer", "resource:pgbouncer", "team:claranet", "created-by:terraform"], var.pgbouncer_pool_connection_limit_extra_tags)
}

resource "datadog_monitor" "pgbouncer_database_connection_limit" {
  count   = var.pgbouncer_database_connection_limit_enabled ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] PGBouncer database connection limit"
  message = coalesce(var.pgbouncer_database_connection_limit_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.pgbouncer_database_connection_limit_time_aggregator}(${var.pgbouncer_database_connection_limit_timeframe}):
      avg:pgbouncer.databases.current_connections${module.filter-tags.query_alert} by {host,db} *
      avg:pgbouncer.databases.max_connections${module.filter-tags.query_alert} by {host,db} / 100
    > ${var.pgbouncer_database_connection_limit_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.pgbouncer_database_connection_limit_threshold_warning
    critical = var.pgbouncer_database_connection_limit_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = 0
  include_tags        = true

  tags = concat(["env:${var.environment}", "type:database", "provider:pgbouncer", "resource:pgbouncer", "team:claranet", "created-by:terraform"], var.pgbouncer_database_connection_limit_extra_tags)
}

resource "datadog_monitor" "pgbouncer_wait_time" {
  count   = var.pgbouncer_wait_time_enabled ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] PGBouncer wait time"
  message = coalesce(var.pgbouncer_wait_time_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.pgbouncer_wait_time_time_aggregator}(${var.pgbouncer_wait_time_timeframe}):
      avg:pgbouncer.stats.avg_wait_time${module.filter-tags.query_alert} by {host,db}
    > ${var.pgbouncer_wait_time_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.pgbouncer_wait_time_threshold_warning
    critical = var.pgbouncer_wait_time_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = 0
  include_tags        = true

  tags = concat(["env:${var.environment}", "type:database", "provider:pgbouncer", "resource:pgbouncer", "team:claranet", "created-by:terraform"], var.pgbouncer_wait_time_extra_tags)
}
