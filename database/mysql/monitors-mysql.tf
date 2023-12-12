resource "datadog_monitor" "mysql_availability" {
  count   = var.mysql_availability_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Mysql server does not respond"
  message = coalesce(var.mysql_availability_message, var.message)
  type    = "service check"

  query = <<EOQ
    "mysql.can_connect"${module.filter-tags.service_check}.by("port","server").last(6).count_by_status()
EOQ

  monitor_thresholds {
    warning  = var.mysql_availability_threshold_warning
    critical = 5
  }

  no_data_timeframe   = var.mysql_availability_no_data_timeframe
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = var.notify_no_data
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = true

  tags = concat(local.common_tags, var.tags, var.mysql_availability_extra_tags)
}

resource "datadog_monitor" "mysql_connection" {
  count   = var.mysql_connection_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Mysql Connections limit {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.mysql_connection_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.mysql_connection_time_aggregator}(${var.mysql_connection_timeframe}): (
      avg:mysql.net.connections${module.filter-tags.query_alert} by {server} /
      avg:mysql.net.max_connections_available${module.filter-tags.query_alert} by {server}
    ) * 100 > ${var.mysql_connection_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.mysql_connection_threshold_warning
    critical = var.mysql_connection_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = var.timeout_h
  include_tags        = true

  tags = concat(local.common_tags, var.tags, var.mysql_connection_extra_tags)
}

resource "datadog_monitor" "mysql_aborted" {
  count   = var.mysql_aborted_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Mysql Aborted connects {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.mysql_aborted_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.mysql_aborted_time_aggregator}(${var.mysql_aborted_timeframe}): (
      avg:mysql.net.aborted_connects${module.filter-tags.query_alert} by {server} /
      avg:mysql.performance.threads_connected${module.filter-tags.query_alert} by {server}
    ) * 100 > ${var.mysql_aborted_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.mysql_aborted_threshold_warning
    critical = var.mysql_aborted_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = var.timeout_h
  include_tags        = true

  tags = concat(local.common_tags, var.tags, var.mysql_aborted_extra_tags)
}

resource "datadog_monitor" "mysql_slow" {
  count   = var.mysql_slow_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Mysql Slow queries {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.mysql_slow_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.mysql_slow_time_aggregator}(${var.mysql_slow_timeframe}): (
      avg:mysql.performance.slow_queries${module.filter-tags.query_alert} by {server} /
      avg:mysql.performance.queries${module.filter-tags.query_alert} by {server}
    ) * 100 > ${var.mysql_slow_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.mysql_slow_threshold_warning
    critical = var.mysql_slow_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = var.timeout_h
  include_tags        = true

  tags = concat(local.common_tags, var.tags, var.mysql_slow_extra_tags)
}

resource "datadog_monitor" "mysql_pool_efficiency" {
  count   = var.mysql_pool_efficiency_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Mysql Innodb buffer pool efficiency {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = coalesce(var.mysql_pool_efficiency_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.mysql_pool_efficiency_time_aggregator}(${var.mysql_pool_efficiency_timeframe}): (
      avg:mysql.innodb.buffer_pool_reads${module.filter-tags.query_alert} by {server} /
      avg:mysql.innodb.buffer_pool_read_requests${module.filter-tags.query_alert} by {server}
    ) * 100 > ${var.mysql_pool_efficiency_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.mysql_pool_efficiency_threshold_warning
    critical = var.mysql_pool_efficiency_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = var.timeout_h
  include_tags        = true

  tags = concat(local.common_tags, var.tags, var.mysql_pool_efficiency_extra_tags)
}

resource "datadog_monitor" "mysql_pool_utilization" {
  count   = var.mysql_pool_utilization_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Mysql Innodb buffer pool utilization {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = coalesce(var.mysql_pool_utilization_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.mysql_pool_utilization_time_aggregator}(${var.mysql_pool_utilization_timeframe}):
      ( avg:mysql.innodb.buffer_pool_total${module.filter-tags.query_alert} by {server} -
      avg:mysql.innodb.buffer_pool_free${module.filter-tags.query_alert} by {server} ) /
      avg:mysql.innodb.buffer_pool_total${module.filter-tags.query_alert} by {server}
    * 100 > ${var.mysql_pool_utilization_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.mysql_pool_utilization_threshold_warning
    critical = var.mysql_pool_utilization_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = var.timeout_h
  include_tags        = true

  tags = concat(local.common_tags, var.tags, var.mysql_pool_utilization_extra_tags)
}

resource "datadog_monitor" "mysql_threads_anomaly" {
  count   = var.mysql_threads_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Mysql threads changed abnormally"
  message = coalesce(var.mysql_threads_message, var.message)
  type    = "metric alert"

  query = <<EOQ
    ${var.mysql_threads_time_aggregator}(${var.mysql_threads_timeframe}):
      anomalies(
        avg:mysql.performance.threads_running${module.filter-tags.query_alert} by {server},
        '${var.mysql_threads_detection_algorithm}',
        ${var.mysql_threads_deviations},
        direction='${var.mysql_threads_direction}',
        alert_window='${var.mysql_threads_alert_window}',
        interval=${var.mysql_threads_interval},
        count_default_zero='${var.mysql_threads_count_default_zero}'
        ${var.mysql_threads_detection_algorithm == "agile" ? format(",seasonality='%s'", var.mysql_threads_seasonality) : ""}
      )
    >= ${var.mysql_threads_threshold_critical}
EOQ

  monitor_thresholds {
    critical          = var.mysql_threads_threshold_critical
    critical_recovery = 0
  }

  monitor_threshold_windows {
    trigger_window  = var.mysql_threads_alert_window
    recovery_window = var.mysql_threads_alert_window
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = var.timeout_h
  include_tags        = true

  tags = concat(local.common_tags, var.tags, var.mysql_threads_extra_tags)
}

resource "datadog_monitor" "mysql_questions_anomaly" {
  count   = var.mysql_questions_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Mysql queries changed abnormally"
  message = coalesce(var.mysql_questions_message, var.message)
  type    = "metric alert"

  query = <<EOQ
    ${var.mysql_questions_time_aggregator}(${var.mysql_questions_timeframe}):
      anomalies(
        avg:mysql.performance.questions${module.filter-tags.query_alert} by {server},
        '${var.mysql_questions_detection_algorithm}',
        ${var.mysql_questions_deviations},
        direction='${var.mysql_questions_direction}',
        alert_window='${var.mysql_questions_alert_window}',
        interval=${var.mysql_questions_interval},
        count_default_zero='${var.mysql_questions_count_default_zero}'
        ${var.mysql_questions_detection_algorithm == "agile" ? format(",seasonality='%s'", var.mysql_questions_seasonality) : ""}
      )
    >= ${var.mysql_questions_threshold_critical}
EOQ

  monitor_thresholds {
    critical          = var.mysql_questions_threshold_critical
    critical_recovery = 0
  }

  monitor_threshold_windows {
    trigger_window  = var.mysql_questions_alert_window
    recovery_window = var.mysql_questions_alert_window
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = var.timeout_h
  include_tags        = true

  tags = concat(local.common_tags, var.tags, var.mysql_questions_extra_tags)
}

resource "datadog_monitor" "mysql_replication_lag" {
  count   = var.mysql_replication_lag_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Mysql replication lag {{#is_alert}}{{{comparator}}} {{threshold}}s ({{value}}s){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}s ({{value}}s){{/is_warning}}"
  message = coalesce(var.mysql_replication_lag_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.mysql_replication_lag_time_aggregator}(${var.mysql_replication_lag_timeframe}):avg:mysql.replication.seconds_behind_master${module.filter-tags.query_alert} by {server} > ${var.mysql_replication_lag_threshold_critical}
EOQ

  monitor_thresholds {
    warning  = var.mysql_replication_lag_threshold_warning
    critical = var.mysql_replication_lag_threshold_critical
  }

  evaluation_delay    = var.evaluation_delay
  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = false
  timeout_h           = var.timeout_h
  include_tags        = true

  tags = concat(local.common_tags, var.tags, var.mysql_replication_lag_extra_tags)
}

resource "datadog_monitor" "mysql_replication_status" {
  count   = var.mysql_replication_status_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Mysql replication status changed abnormally"
  message = coalesce(var.mysql_replication_status_message, var.message)
  type    = "metric alert"

  query = <<EOQ
    ${var.mysql_replication_status_time_aggregator}(${var.mysql_replication_status_timeframe}):avg:mysql.replication.slave_running${module.filter-tags.query_alert} by {server} < 1
EOQ

  monitor_thresholds {
    critical = 1
  }

  new_host_delay      = var.new_host_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = true

  tags = concat(local.common_tags, var.tags, var.mysql_replication_status_extra_tags)
}
