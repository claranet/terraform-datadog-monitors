resource "datadog_monitor" "mysql_availability" {
  name    = "[${var.environment}] Mysql server does not respond"
  message = "${coalesce(var.mysql_availability_message, var.message)}"

  type = "service check"

  query = <<EOF
    "mysql.can_connect".over${module.filter-tags.service_check}.by("host","port","server").last(1).pct_by_status()
  EOF

  thresholds = {
    warning  = 0
    critical = "${var.mysql_availability_threshold_critical}"
  }

  notify_no_data      = true
  new_host_delay      = "${var.new_host_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.mysql_availability_silenced}"

  tags = ["env:${var.environment}", "type:middleware", "provider:php-fpm", "resource:php-fpm", "team:claranet", "created-by:terraform", "${var.mysql_availability_extra_tags}"]
}


resource "datadog_monitor" "mysql_connection" {
  name    = "[${var.environment}] Mysql Connections {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.mysql_connection_message, var.message)}"
  type    = "metric alert"

  query = <<EOF
    ${var.mysql_connection_time_aggregator}(${var.mysql_connection_timeframe}): (
      avg:mysql.net.connections${module.filter-tags.query_alert} by {server} /
      avg:mysql.net.max_connections_available${module.filter-tags.query_alert} by {server}
    ) * 100 > ${var.mysql_connection_threshold_critical}
  EOF

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  thresholds {
    warning  = "${var.mysql_connection_threshold_warning}"
    critical = "${var.mysql_connection_threshold_critical}"
  }

  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = 0
  include_tags        = true

  silenced = "${var.mysql_connection_silenced}"

  tags = ["env:${var.environment}", "type:database", "provider:mysql", "resource:mysql", "team:claranet", "created-by:terraform", "${var.mysql_connection_extra_tags}"]
}

resource "datadog_monitor" "mysql_aborted" {
  name    = "[${var.environment}] Mysql Aborted connects {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.mysql_aborted_message, var.message)}"
  type    = "metric alert"

  query = <<EOF
    ${var.mysql_aborted_time_aggregator}(${var.mysql_aborted_timeframe}): (
      avg:mysql.net.aborted_connects${module.filter-tags.query_alert} by {server} /
      avg:mysql.performance.queries_connected${module.filter-tags.query_alert} by {server}
    ) * 100 > ${var.mysql_aborted_threshold_critical}
  EOF

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  thresholds {
    warning  = "${var.mysql_aborted_threshold_warning}"
    critical = "${var.mysql_aborted_threshold_critical}"
  }

  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = 0
  include_tags        = true

  silenced = "${var.mysql_aborted_silenced}"

  tags = ["env:${var.environment}", "type:database", "provider:mysql", "resource:mysql", "team:claranet", "created-by:terraform", "${var.mysql_aborted_extra_tags}"]
}

resource "datadog_monitor" "mysql_slow" {
  name    = "[${var.environment}] Mysql Slow queries {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.mysql_slow_message, var.message)}"
  type    = "metric alert"

  query = <<EOF
    ${var.mysql_slow_time_aggregator}(${var.mysql_slow_timeframe}): (
      avg:mysql.performance.slow_queries${module.filter-tags.query_alert} by {server} /
      avg:mysql.performance.queries${module.filter-tags.query_alert} by {server}
    ) * 100 > ${var.mysql_slow_threshold_critical}
  EOF

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  thresholds {
    warning  = "${var.mysql_slow_threshold_warning}"
    critical = "${var.mysql_slow_threshold_critical}"
  }

  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = 0
  include_tags        = true

  silenced = "${var.mysql_slow_silenced}"

  tags = ["env:${var.environment}", "type:database", "provider:mysql", "resource:mysql", "team:claranet", "created-by:terraform", "${var.mysql_slow_extra_tags}"]
}

resource "datadog_monitor" "mysql_pool_efficiency" {
  name    = "[${var.environment}] Mysql Innodb buffer pool efficiency {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.mysql_pool_efficiency_message, var.message)}"
  type    = "metric alert"

  query = <<EOF
    ${var.mysql_pool_efficiency_time_aggregator}(${var.mysql_pool_efficiency_timeframe}): (
      avg:mysql.innodb.buffer_pool_reads${module.filter-tags.query_alert} by {server} /
      avg:mysql.innodb.buffer_pool_read_requests${module.filter-tags.query_alert} by {server}
    ) * 100 > ${var.mysql_pool_efficiency_threshold_critical}
  EOF

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  thresholds {
    warning  = "${var.mysql_pool_efficiency_threshold_warning}"
    critical = "${var.mysql_pool_efficiency_threshold_critical}"
  }

  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = 0
  include_tags        = true

  silenced = "${var.mysql_pool_efficiency_silenced}"

  tags = ["env:${var.environment}", "type:database", "provider:mysql", "resource:mysql", "team:claranet", "created-by:terraform", "${var.mysql_pool_efficiency_extra_tags}"]
}

resource "datadog_monitor" "mysql_pool_utilization" {
  name    = "[${var.environment}] Mysql Innodb buffer pool utilization {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.mysql_pool_utilization_message, var.message)}"
  type    = "metric alert"

  query = <<EOF
    ${var.mysql_pool_utilization_time_aggregator}(${var.mysql_pool_utilization_timeframe}):
      ( avg:mysql.innodb.buffer_pool_total${module.filter-tags.query_alert} by {server} -
      avg:mysql.innodb.buffer_pool_free${module.filter-tags.query_alert} by {server} ) /
      avg:mysql.innodb.buffer_pool_total${module.filter-tags.query_alert} by {server}
    * 100 > ${var.mysql_pool_utilization_threshold_critical}
  EOF

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  thresholds {
    warning  = "${var.mysql_pool_utilization_threshold_warning}"
    critical = "${var.mysql_pool_utilization_threshold_critical}"
  }

  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = 0
  include_tags        = true

  silenced = "${var.mysql_pool_utilization_silenced}"

  tags = ["env:${var.environment}", "type:database", "provider:mysql", "resource:mysql", "team:claranet", "created-by:terraform", "${var.mysql_pool_utilization_extra_tags}"]
}

resource "datadog_monitor" "mysql_threads_anomaly" {
  name    = "[${var.environment}] Mysql threads changed abnormally"
  message = "${coalesce(var.mysql_threads_message, var.message)}"
  type    = "metric alert"

  query = <<EOF
    ${var.mysql_threads_time_aggregator}(${var.mysql_threads_timeframe}):
      anomalies(
        avg:mysql.performance.threads_running${module.filter-tags.query_alert} by {server},
        '${var.mysql_threads_detection_algorithm}',
        ${var.mysql_threads_deviations},
        direction='${var.mysql_threads_direction}',
        alert_window='${var.mysql_threads_alert_window}',
        interval=${var.mysql_threads_interval},
        count_default_zero='${var.mysql_threads_count_default_zero}'
        ${var.mysql_threads_seasonality == "agile" ? format(",seasonality='%s'", var.mysql_queries_seasonality): ""}
      )
    >= ${var.mysql_threads_threshold_critical}
  EOF

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  thresholds {
    critical = "${var.mysql_threads_threshold_critical}"
    critical_recovery = 0
  }

  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = 0
  include_tags        = true

  silenced = "${var.mysql_threads_silenced}"

  tags = ["env:${var.environment}", "type:database", "provider:mysql", "resource:mysql", "team:claranet", "created-by:terraform", "${var.mysql_threads_extra_tags}"]
}

resource "datadog_monitor" "mysql_queries_anomaly" {
  name    = "[${var.environment}] Mysql queries changed abnormally"
  message = "${coalesce(var.mysql_queries_message, var.message)}"
  type    = "metric alert"

  query = <<EOF
    ${var.mysql_queries_time_aggregator}(${var.mysql_queries_timeframe}):
      anomalies(
        avg:mysql.performance.queries${module.filter-tags.query_alert} by {server},
        '${var.mysql_queries_detection_algorithm}',
        ${var.mysql_queries_deviations},
        direction='${var.mysql_queries_direction}',
        alert_window='${var.mysql_queries_alert_window}',
        interval=${var.mysql_queries_interval},
        count_default_zero='${var.mysql_queries_count_default_zero}'
        ${var.mysql_queries_detection_algorithm == "agile" ? format(",seasonality='%s'", var.mysql_queries_seasonality): ""}
      )
    >= ${var.mysql_queries_threshold_critical}
  EOF

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  thresholds {
    critical = "${var.mysql_queries_threshold_critical}"
    critical_recovery = 0
  }

  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = 0
  include_tags        = true

  silenced = "${var.mysql_queries_silenced}"

  tags = ["env:${var.environment}", "type:database", "provider:mysql", "resource:mysql", "team:claranet", "created-by:terraform", "${var.mysql_queries_extra_tags}"]
}