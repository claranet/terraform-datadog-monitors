resource "datadog_monitor" "proxysql_thread_worker" {
  count   = var.proxysql_thread_worker_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ProxySQL Thread Worker {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = coalesce(var.proxysql_thread_worker_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.proxysql_thread_worker_time_aggregator}(${var.proxysql_thread_worker_timeframe}):avg:proxysql.mysql.thread_workers${module.filter-tags.query_alert} by {proxysql_server,proxysql_port} < ${var.proxysql_thread_worker_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.proxysql_thread_worker_threshold_warning
    critical = var.proxysql_thread_worker_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = var.notify_no_data
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = 0
  include_tags        = true

  tags = concat(["env:${var.environment}", "type:database", "provider:proxysql", "resource:proxysql", "team:claranet", "created-by:terraform"], var.proxysql_thread_worker_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "proxysql_slow" {
  count   = var.proxysql_slow_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ProxySQL Slow queries {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.proxysql_slow_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.proxysql_slow_time_aggregator}(${var.proxysql_slow_timeframe}): (
      avg:proxysql.slow_queries${module.filter-tags.query_alert} by {proxysql_server,proxysql_port} /
      avg:proxysql.questions${module.filter-tags.query_alert} by {proxysql_server,proxysql_port}
    ) * 100 > ${var.proxysql_slow_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.proxysql_slow_threshold_warning
    critical = var.proxysql_slow_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = 0
  include_tags        = true

  tags = concat(["env:${var.environment}", "type:database", "provider:proxysql", "resource:proxysql", "team:claranet", "created-by:terraform"], var.proxysql_slow_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "proxysql_client_conn_aborted" {
  count   = var.proxysql_client_conn_aborted_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ProxySQL Client connections aborted {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = coalesce(var.proxysql_client_conn_aborted_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.proxysql_client_conn_aborted_time_aggregator}(${var.proxysql_client_conn_aborted_timeframe}):avg:proxysql.client.connections_aborted${module.filter-tags.query_alert} by {proxysql_server,proxysql_port} > ${var.proxysql_client_conn_aborted_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.proxysql_client_conn_aborted_threshold_warning
    critical = var.proxysql_client_conn_aborted_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = 0
  include_tags        = true

  tags = concat(["env:${var.environment}", "type:database", "provider:proxysql", "resource:proxysql", "team:claranet", "created-by:terraform"], var.proxysql_client_conn_aborted_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "proxysql_server_conn_aborted" {
  count   = var.proxysql_server_conn_aborted_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ProxySQL Server connections aborted {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.proxysql_server_conn_aborted_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.proxysql_server_conn_aborted_time_aggregator}(${var.proxysql_server_conn_aborted_timeframe}):avg:proxysql.server.connections_aborted${module.filter-tags.query_alert} by {proxysql_server,proxysql_port} > ${var.proxysql_server_conn_aborted_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.proxysql_server_conn_aborted_threshold_warning
    critical = var.proxysql_server_conn_aborted_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = 0
  include_tags        = true

  tags = concat(["env:${var.environment}", "type:database", "provider:proxysql", "resource:proxysql", "team:claranet", "created-by:terraform"], var.proxysql_server_conn_aborted_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}

resource "datadog_monitor" "proxysql_pool_conn_failure" {
  count   = var.proxysql_pool_conn_failure_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] ProxySQL Pool connections failure {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.proxysql_pool_conn_failure_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.proxysql_pool_conn_failure_time_aggregator}(${var.proxysql_pool_conn_failure_timeframe}):
      avg:proxysql.pool.conn_failure${module.filter-tags.query_alert} by {proxysql_server,proxysql_port} 
      > ${var.proxysql_pool_conn_failure_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.proxysql_pool_conn_failure_threshold_warning
    critical = var.proxysql_pool_conn_failure_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = 0
  include_tags        = true

  tags = concat(["env:${var.environment}", "type:database", "provider:proxysql", "resource:proxysql", "team:claranet", "created-by:terraform"], var.proxysql_pool_conn_failure_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}
